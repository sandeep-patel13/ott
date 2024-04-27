package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;


@WebServlet("/get-Video-Based-On-Id")
public class GetVideoBasedOnMediaIdControllerServlet extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException , IOException {

		response.setContentType("video/mp4");
		
		String id = request.getParameter("id");
		
		ServletContext context = request.getServletContext();
		
		String commonPath = context.getInitParameter("commonPath");
		
		String filePath = commonPath+File.separator+id+File.separator+"video.mp4";
		
		FileInputStream inputStream = null;
		
		ServletOutputStream outputStream = null;
		
		try {
			
			File file = new File(filePath);
			response.setContentLengthLong(file.length());
			
			inputStream = new FileInputStream(file);
			
			outputStream = 	response.getOutputStream();
			
			int bytesRead = 0;
			byte[] buffer = new byte[4096];
			while((bytesRead = inputStream.read(buffer)) != -1) {
				
				outputStream.write(buffer, 0, bytesRead);
				
			}
			outputStream.flush();
		}
		catch(IOException io) {
			System.out.println("get-Video-Based-On-Id");
			io.printStackTrace();
		}
		finally {
			if(inputStream != null)
				inputStream.close();
			if(outputStream != null)
				outputStream.close();
		}
	
	}


}
