package controllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StoreMediaDao;
import dto.Media;


@WebServlet("/send-to-media-dao-to-update")
public class SendToMediaDaoToUpdateMedia extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		String name = request.getParameter("name");
		try {
			List<Media> list = StoreMediaDao.searchByName(name);
			for(Media media : list) {
				
				String mediaName = media.getName();
				String category = media.getCategory();
				String id = media.getMedia_id();
				
				ServletContext sc = super.getServletContext();
				
				String commonPath = sc.getInitParameter("commonPath");
				
				String actualPath = commonPath+File.separator+id+File.separator+"image.jpg";
				
				
				FileInputStream inputStream = new FileInputStream(new File(actualPath));
				 
				byte[] bytes = inputStream.readAllBytes(); 
				
				String encoded = Base64.getEncoder().encodeToString(bytes);
				
				/*
				 * StringBuffer output = new StringBuffer(); output.
				 * append("<div class='d-flex justify-content-center align-itens-center'>");
				 * output.append("<img width = '200px' src='"+encoded+"'");
				 * output.append("<p>"+mediaName+"</p>"); output.append("<p>"+category+"</p>");
				 * output.append("</div>");
				 */
				
				StringBuffer output = new StringBuffer();
				output.append("<div class='d-flex justify-content-center align-itens-center flex-column mb-5'>");
				output.append("<img class='shadow rounded' width = '500px' src='media-List-Image?id="+id+"'/>");
				output.append("<p class='fontOne text-light '>"+mediaName+"</p>");
				output.append("<p  width = '450px' class='fontOne text-light '>"+category+"</p>");
				output.append("<a href='update-media?id="+id+"' class='btn btn-outline-light shadow'>Update Media</a>");
				output.append("</div>");
				
				response.getWriter().write(output.toString());
			}
		}
		catch(SQLException s){
			System.out.println("send-to-media-dao-to-delete");
			s.printStackTrace();
		}
		
		
	}

}
