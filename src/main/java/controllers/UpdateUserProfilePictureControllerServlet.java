package controllers;

import java.io.IOException;
import java.io.InputStream;

import dao.UserDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.util.Collection;
import java.io.FileOutputStream;
import java.io.File;
import javax.servlet.ServletContext;
import java.util.UUID;
import java.io.PrintWriter;
import javax.servlet.http.HttpSession;
import dto.User;

@WebServlet("/upload-user-profile")
@MultipartConfig
public class UpdateUserProfilePictureControllerServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = null;
		try {
			
			response.setContentType("text/plain");
			
			Part part = request.getPart("profile");
			
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			
			ServletContext sc = super.getServletContext();
			String profilePath = sc.getInitParameter("profilePath");
			
			String directryPath = null;
			
			out = response.getWriter();
			
//			check
			String profile = UserDao.hasProfileStatus(user.getEmailId());
			if(profile.length() != 0) {
				
				directryPath= profilePath + File.separator + profile + File.separator + "prfile.jpg";
				// Use FileOutputStream without append mode
		        FileOutputStream fileOutputStream = new FileOutputStream(directryPath);

		        // Read and write the data from the Part to the FileOutputStream
		        byte[] buffer = new byte[1024];
		        int bytesRead;
		        InputStream partInputStream = part.getInputStream();

		        while ((bytesRead = partInputStream.read(buffer)) != -1) {
		            fileOutputStream.write(buffer, 0, bytesRead);
		        }

		        fileOutputStream.close();
		        partInputStream.close();
			}
			
			
			else {
				UUID uuid = UUID.randomUUID();
				directryPath = profilePath + File.separator + uuid.toString();
				File directry = new File(directryPath);
				if(!directry.exists()) 
					directry.mkdir();
				String finalPath = directryPath + File.separator + "prfile.jpg";
				part.write(finalPath);
				boolean x = UserDao.updateProfileStatus(uuid.toString() , user.getEmailId());
			}

			out.println("success");
			
		}
		catch(Exception e) {
			System.out.println("upload-user-profile");
			e.printStackTrace();
			out.println("error");
		}

	}

}
