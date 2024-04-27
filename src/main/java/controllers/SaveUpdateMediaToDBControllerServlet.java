package controllers;

import java.io.IOException;
import dto.MediaInfo;
import dto.Media;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.ServletContext;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.InputStream;
import java.util.Arrays;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;


@MultipartConfig
@WebServlet("/send-updated-media")
public class SaveUpdateMediaToDBControllerServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-mm-dd");
		SimpleDateFormat timeFormatter = new SimpleDateFormat("hh:mm:ss");
		
		Date utilDate = null;
		long miliseconds = 0;
		
		OutputStream outputStreamImage = null;
		OutputStream outputStreamVideo = null;
		InputStream inputStreamImage = null;
		InputStream inputStreamVideo = null;
		
		try {
			String media_id = request.getParameter("id");
			String name = request.getParameter("name");
			String category = request.getParameter("category");
			
			String ratings = request.getParameter("ratings");
			float floatRatings = Float.parseFloat(ratings);
			
			
			String description = request.getParameter("description");
			String directorName = request.getParameter("directorName");
			String actors = request.getParameter("actors");
			
			String length = request.getParameter("length");
			utilDate = timeFormatter.parse(length);
			miliseconds = utilDate.getTime();
			java.sql.Time sqlTime = new java.sql.Time(miliseconds);
			
			String releaseDate = request.getParameter("releaseDate");
			utilDate = dateFormatter.parse(releaseDate);
			miliseconds = utilDate.getTime();
			java.sql.Date sqlDate = new java.sql.Date(miliseconds);
			
			
//		Part is an interface, implemenatation provided by tomcat server
			Part image = request.getPart("thumbnail");
			Part video = request.getPart("video");
			
			
			ServletContext sc = request.getServletContext();
			String commonPath = sc.getInitParameter("commonPath");
			String imagePath = commonPath+File.separator+media_id+File.separator+"image.jpg";
			String videoPath = commonPath+File.separator+media_id+File.separator+"video.mp4";	

			System.out.println(videoPath);
			
			inputStreamImage = image.getInputStream();
			outputStreamImage = new FileOutputStream(imagePath);
			
			byte[] buffer = new byte[4096];
			int bytesRead = 0;
			while((bytesRead = inputStreamImage.read(buffer)) != -1) {
				outputStreamImage.write(buffer, 0, bytesRead);
			}
			
			inputStreamVideo = video.getInputStream();
			
			File videoFile = new File(videoPath);
			boolean ans = false;
			if(videoFile.exists()) {
			
				ans = videoFile.delete();

				
				if(ans == true){
				
					File newVideoFile = new File(videoPath);
					newVideoFile.createNewFile();
					outputStreamVideo = new FileOutputStream(newVideoFile);
			
//					video
					buffer = new byte[4096];
					bytesRead = 0;
					while((bytesRead = inputStreamVideo.read(buffer)) != -1) {
						outputStreamVideo.write(buffer, 0, bytesRead);
					}	
					
				}	
				
			}
			
			
//			Media media = new Media();
//			media.setMedia_id(media_id);
//			media.setCategory(category);
//			media.setName(directorName);
//			
//			MediaInfo mediaInfo = new MediaInfo();
//			mediaInfo.setActors(actors);
//			mediaInfo.setDirectors(directorName);
//			mediaInfo.setDiscription(description);
//			mediaInfo.setLength(sqlTime);
//			mediaInfo.setMedia_id(media_id);
//			mediaInfo.setRatings(floatRatings);
//			mediaInfo.setRelease_date(sqlDate);
			
		}
		catch(NumberFormatException n) {
			response.getWriter().println("NumberFormatException");
			n.printStackTrace();
		}
		catch(ParseException p) {
			response.getWriter().println("ParseException");
			p.printStackTrace();
		}
		catch(ServletException s) {
			response.getWriter().println("ServletException");
			s.printStackTrace();
		}
		catch(FileNotFoundException f) {
			response.getWriter().println("FileNotFoundException");
			f.printStackTrace();
		}
		catch(IOException i) {
			response.getWriter().println("IOException");
			i.printStackTrace();
		}
		
		finally {
			
			if(inputStreamVideo != null)
				inputStreamVideo.close();
			if(inputStreamImage != null)
				inputStreamImage.close();
			if(outputStreamVideo != null)
				outputStreamVideo.close();
			if(outputStreamImage != null)
				outputStreamImage.close();
			
			
		}

	}

}
