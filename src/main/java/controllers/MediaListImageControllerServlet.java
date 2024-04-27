package controllers;

import java.io.IOException;
import java.io.InputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/media-List-Image")
public class MediaListImageControllerServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		InputStream inputStream = null;
		OutputStream outputStream = null;
		try {
			
			response.setContentType("mime");
			response.setHeader("keep-alive", "timeout=3600");
			
			String mediaId = request.getParameter("id");
			ServletContext sc = request.getServletContext();
			String commonPath = sc.getInitParameter("commonPath");
			String actualPath = commonPath+"\\"+mediaId+"\\image.jpg";
			
			File file = new File(actualPath);
			
			response.setContentLength((int)file.length());
			
			inputStream = new FileInputStream(file);
			
			outputStream = response.getOutputStream(); // returns ServletOutputStream object - to write binary data
			
			int bytesRead = 0;
			byte[] buffer = new byte[1024];
			
			while((bytesRead = inputStream.read(buffer)) != -1) {
				
				outputStream.write(buffer, 0, bytesRead);
				
			}
			
		}
		catch(IOException io) {
			System.out.println("media-List-Image");
			io.printStackTrace();
		}
		finally {
			
			try {
				
				if(inputStream != null)
					inputStream.close();
				else if(outputStream != null)
					outputStream.close();
			}
			catch(IOException e) {
				System.out.println("media-List-Image");
				e.printStackTrace();
			}
		}
	}

}
