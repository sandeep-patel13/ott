package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dto.User;
import dao.UserDao;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletContext;
import java.io.File;
import java.io.FileInputStream;

@WebServlet("/get-profile-of-user")
public class GetProfileOfUserControllerServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("image/jpg");
		
		System.out.println("ji ok");
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String profileId = user.getProfileStatus();
		
		ServletContext sc = super.getServletContext();
		
		String basePath =  sc.getInitParameter("profilePath");
		
		String finalPath = basePath + File.separator + profileId + File.separator + "prfile.jpg";
		
		System.out.println(finalPath+"hhhh");
		
		try {
			FileInputStream inputStream = new FileInputStream(finalPath);
			
			ServletOutputStream outputStream = response.getOutputStream();
			
			//		4kb
			byte[] buffer = new byte[1024];
			
			int bytesRead = 0;
			
			while((bytesRead = inputStream.read(buffer)) != -1) {
				outputStream.write(buffer, 0 , bytesRead);
			}
		}
		catch(IOException io) {
			io.printStackTrace();
			System.out.println("get-profile-of-user");
		}
	}

}
