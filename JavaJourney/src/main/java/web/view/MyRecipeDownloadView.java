package web.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import web.dto.MyRecipeFile;

public class MyRecipeDownloadView extends AbstractView{
	@Autowired private ServletContext context;
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		MyRecipeFile myRecipeFile = (MyRecipeFile)model.get("myRecipeFileDownload");
		String path = context.getRealPath("/upload");
		String fileName = myRecipeFile.getMyRipFileStoredName();
		File src = new File(path, fileName);
		response.setContentType("application/octet-stream");
		response.setContentLength((int)src.length());
		response.setCharacterEncoding("utf-8");
		String outputName = URLEncoder.encode( myRecipeFile.getMyRipFileOriginName(),"utf-8");
		outputName = outputName.replace("+", "%20");
		response.setHeader("Content-Disposition", "attachment;filename=\""+outputName+"\"");
		FileInputStream fis = new FileInputStream(src); 
		OutputStream out = response.getOutputStream();
		
		FileCopyUtils.copy(fis, out);
		fis.close();
		out.close();
		
		
	}

}






