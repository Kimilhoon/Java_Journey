package web.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import lombok.extern.slf4j.Slf4j;
import web.dto.Bean;
import web.dto.Cafe;
import web.service.face.BeanService;
import web.service.face.CafeService;

@Controller
@RequestMapping("/main")
@Slf4j
public class MainController {
	
	@Autowired CafeService cafeservice;
	@Autowired BeanService beanservice;
	
	@GetMapping("")
	public void mainForm(
			Model model,
			HttpServletRequest request
			) {
		
//		List<Cafe> cafeBestList = cafeservice.getBest();
//		log.info("cafeBestList : {}",cafeBestList);
		
//		List<BeanRev> beanBestList = beanservice.getBest();
		List<Bean> bList = beanservice.getBeanTop();
		List<Cafe> cList = cafeservice.getCafeTop();
//		log.info("beanBestList : {}",beanBestList);
		
//		model.addAttribute("cafeBestList",cafeBestList);
		model.addAttribute("bList", bList);
		model.addAttribute("cList", cList);
		
        
        
	    
	    
	}
	
	
	@GetMapping("/admin")
	public void adminmenuForm() {}
	
	
	
}
