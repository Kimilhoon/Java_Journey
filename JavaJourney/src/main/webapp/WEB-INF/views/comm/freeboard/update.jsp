<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e8fbebe3028eb8e4ca3a2c1633eec190&libraries=services"></script>
<script type="text/javascript">
$(function() {
	  $('#summernote').summernote({
		  
	  });
	
	$("#update").click(function() {
		$.ajax({
			url: "./update",
			type: "post",
			data: {
				"freeBoardTitle":$("#t").val(),
				"freeBoardContent":$("#summernote").val(),
				"freeBoardNo":${freeBoardView.freeBoardNo },
				"freeBoardMapX":$("#x").text(),
				"freeBoardMapY":$("#y").text()
			},
			dataType: "text",
			success: function() {
				location.href = "./view?freeBoardNo="+${freeBoardView.freeBoardNo };
			},
			error: function() {
				
			}
			
		});
	})
	$("#x").text(${freeBoardView.freeBoardMapX});
	$("#y").text(${freeBoardView.freeBoardMapY});
	
	
	var container = document.getElementById('dmap'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(${freeBoardView.freeBoardMapX }, ${freeBoardView.freeBoardMapY }), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	var marker = new kakao.maps.Marker({
        position: map.getCenter()
    });
    marker.setMap(map);
	$("#map_update").click(function() {
		$("#dmap").toggle();
		$("#api_all_wrap").toggle();
		
		var markers = [];
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();  
		
		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		
		// 키워드로 장소를 검색합니다
		

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {
		
		    var keyword = $('#keyword').val();
		
		    if (!keyword.replace(/^\s+|\s+$/g, '')) {
		        alert('키워드를 입력해주세요!');
		        return false;
		    }
		
		    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		    ps.keywordSearch( keyword, placesSearchCB); 
		}
		
		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {
		
		        // 정상적으로 검색이 완료됐으면
		        // 검색 목록과 마커를 표출합니다
		        displayPlaces(data);
		
		        // 페이지 번호를 표출합니다
		        displayPagination(pagination);
		
		    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
		
		        alert('검색 결과가 존재하지 않습니다.');
		        return;
		
		    } else if (status === kakao.maps.services.Status.ERROR) {
		
		        alert('검색 결과 중 오류가 발생했습니다.');
		        return;
		
		    }
		}
		
		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {
		
		    var listEl = document.getElementById('placesList'), 
		    menuEl = document.getElementById('menu_wrap'),
		    fragment = document.createDocumentFragment(), 
		    bounds = new kakao.maps.LatLngBounds(), 
		    listStr = '';
		    
		    // 검색 결과 목록에 추가된 항목들을 제거합니다
		    removeAllChildNods(listEl);
		
		    // 지도에 표시되고 있는 마커를 제거합니다
		    removeMarker();
		    
		    for ( var i=0; i<places.length; i++ ) {
		
		        // 마커를 생성하고 지도에 표시합니다
		        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
		            marker = addMarker(placePosition, i), 
		            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
		
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        bounds.extend(placePosition);
		
		        // 마커와 검색결과 항목에 mouseover 했을때
		        // 해당 장소에 인포윈도우에 장소명을 표시합니다
		        // mouseout 했을 때는 인포윈도우를 닫습니다
		        (function(marker, title) {
		            kakao.maps.event.addListener(marker, 'mouseover', function() {
		                displayInfowindow(marker, title);
		            });
		
		            kakao.maps.event.addListener(marker, 'mouseout', function() {
		                infowindow.close();
		            });
		
		            itemEl.onmouseover =  function () {
		                displayInfowindow(marker, title);
		            };
		
		            itemEl.onmouseout =  function () {
		                infowindow.close();
		            };
		        })(marker, places[i].place_name);
		
		        fragment.appendChild(itemEl);
		    }
		
		    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
		    listEl.appendChild(fragment);
		    menuEl.scrollTop = 0;
		
		    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		    map.setBounds(bounds);
		}
		
		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {
		
		    var el = document.createElement('li'),
		    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
		                '<div class="info">' +
		                '   <h5>' + places.place_name + '</h5>';
		
		    if (places.road_address_name) {
		        itemStr += '    <span>' + places.road_address_name + '</span>' +
		                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
		    } else {
		        itemStr += '    <span>' +  places.address_name  + '</span>'; 
		    }
		                 
		      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
		                '</div>';           
		
		    el.innerHTML = itemStr;
		    el.className = 'item';
			console.log(places);
		    return el;
		}
		
		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
		    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
		        imgOptions =  {
		            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
		            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		        },
		        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker = new kakao.maps.Marker({
		            position: position, // 마커의 위치
		            image: markerImage 
		        });
		
		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
		
		    
		    kakao.maps.event.addListener(marker, 'click', function() {
		        var lat = position.getLat();
		        var lng = position.getLng();
//	 	        $("#choose").text("마커의 좌표는 위도: " + lat + ", 경도: " + lng);
		        $("#x").text(lat);
		        $("#y").text(lng);
		        $("#choose").css("display","");
		        var moveLatLon = new kakao.maps.LatLng(lat, lng);
	            map.setCenter(moveLatLon);
	            map.setLevel(3);
	            marker.setPosition(moveLatLon);
		        
		    });
		    
		    return marker;
		}
		
		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}
		
		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
		    var paginationEl = document.getElementById('pagination'),
		        fragment = document.createDocumentFragment(),
		        i; 
		
		    // 기존에 추가된 페이지번호를 삭제합니다
		    while (paginationEl.hasChildNodes()) {
		        paginationEl.removeChild (paginationEl.lastChild);
		    }
		
		    for (i=1; i<=pagination.last; i++) {
		        var el = document.createElement('a');
		        el.href = "#";
		        el.innerHTML = i;
		
		        if (i===pagination.current) {
		            el.className = 'on';
		        } else {
		            el.onclick = (function(i) {
		                return function() {
		                    pagination.gotoPage(i);
		                }
		            })(i);
		        }
		
		        fragment.appendChild(el);
		    }
		    paginationEl.appendChild(fragment);
		}
		
		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
		    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
		
		    infowindow.setContent(content);
		    infowindow.open(map, marker);
		}
		
		 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {   
		    while (el.hasChildNodes()) {
		        el.removeChild (el.lastChild);
		    }
		}
		$("#api_search").click(function() {
			searchPlaces();	
		})
		 
		
	})/* map_update click */
	
	
})	
	
</script>
<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;height:500px; margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}


#content {
    max-width: 1200px;
    margin: 0 auto;
    padding: 30px 50px;
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
}

.container{
	display: inline-block;
	width: -webkit-fill-available;
	margin: 0 auto;
}

.btn{
	background: transparent;
	border: 1px solid #6f4e37;
	color: black;
}

.btn:hover{
	background: #6f4e37;
	color: white;
}





</style>
<div id="content">

<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="./list">freeboard</a></li>
		<li class="breadcrumb-item"><a href="./list">list</a></li>
		<li class="breadcrumb-item"><a href="./view?freeBoardNo=${freeBoardView.freeBoardNo }">view</a></li>
		<li class="breadcrumb-item active" aria-current="page">update</li>
	</ol>
</nav>

<div class="container">
<table class="table table-bordered">
<tr>
	<td>카테고리 | ${freeBoardView.freeBoardCategory }</td>
</tr>
<tr>
	<td colspan="4">
		<input type="text"class="form-control" value="${freeBoardView.freeBoardTitle }" name="freeBoardTitle" id="t">
	</td>
</tr>
<tr>
	<td colspan="4">
		<textarea id="summernote" rows="15" cols="50" name="freeBoardContent" required="required" class="form-control">${freeBoardView.freeBoardContent }</textarea>
	</td>
</tr>
<c:choose>
	<c:when test='${freeBoardView.freeBoardMapX ne "123" }'>
	<tr>
	<td colspan="4">
	
		<div>
			<div id="dmap" style="width: -webkit-fill-available; height:500px;"></div>
		</div>
		<div id="api_all_wrap" style="display: none;">
			<div class="map_wrap" >
			    <div id="map" style="width: -webkit-fill-available; height: 500px;position:relative;overflow:hidden;"></div>
			    <div id="menu_wrap" class="bg_white">
			        <div class="option">
			            <div>
		                    키워드 : <input type="text" value="" id="keyword" size="15"> 
		                    <button id="api_search" class="btn"><small>검색하기</small></button> 
			            </div>
			        </div>
			        <hr>
			        <ul id="placesList"></ul>
			        <div id="pagination"></div>
			    </div>
			</div>
		</div>
	</td>
	</tr>
	</c:when>
	<c:otherwise>
	<tr id="api_all_wrap" style="display: none;">
	<td colspan="4">
	
		<div style="display: none;">
			<div id="dmap" style="width: -webkit-fill-available; height:500px;"></div>
		</div>
		<div >
			<div class="map_wrap" >
			    <div id="map" style="width: -webkit-fill-available; height: 500px;position:relative;overflow:hidden;"></div>
			    <div id="menu_wrap" class="bg_white">
			        <div class="option">
			            <div>
		                    키워드 : <input type="text" value="" id="keyword" size="15"> 
		                    <button id="api_search" class="btn"><small>검색하기</small></button> 
			            </div>
			        </div>
			        <hr>
			        <ul id="placesList"></ul>
			        <div id="pagination"></div>
			    </div>
			</div>
		</div>
	</td>
	</tr>
	</c:otherwise>
</c:choose>	
<tr>
	<td>
		<button id="map_update" class="btn">지도 수정</button>
	</td>
</tr>
<tr id="choose" style="display: none;">
	<td>
		<div >
		선택결과<br>
		좌표: 
		<span id="x"></span>,<span id="y"></span>
		</div>
	</td>
</tr>
</table>
<div style="float: right;">
	<button id="update" class="btn">수정</button>
	<a href="./view?freeBoardNo=${freeBoardView.freeBoardNo }"><button type="button" class="btn">취소</button></a>
</div>

</div><!-- container -->
</div><!-- content -->
<c:import url="/WEB-INF/views/layout/footer.jsp"/>