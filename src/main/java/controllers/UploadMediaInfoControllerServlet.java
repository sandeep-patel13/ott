package controllers;

import java.io.File;


import java.io.IOException;
import dto.Media;
import dto.MediaInfo;
import dao.StoreMediaDao;
import dao.StoreMediaInformationDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletContext;
import java.util.List;
import java.util.UUID;
import java.util.Date;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.FileItem;
import java.text.SimpleDateFormat;
import java.text.ParseException;

@WebServlet("/upload-media-info")
public class UploadMediaInfoControllerServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		
		String name = null;
		String category = "";
		String strRating = null;
		String strLength = null;
		String description = null;
		String directorName = null;
		String actors = null;
		String strReleaseDate = null;
		String mediaId = null;
		
		java.sql.Date sqlReleaseDate = null;
		java.sql.Time sqlLength = null;
		float floatRating = 0.0f; 
		long miliseconds = 0;
		SimpleDateFormat dateFormatter = new  SimpleDateFormat("yyyy-mm-dd");
		SimpleDateFormat timeFormatter = new SimpleDateFormat("hh:mm:ss");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			
			try {
				List<FileItem> items = upload.parseRequest(request);
				UUID uuid = UUID.randomUUID();
				
				for(FileItem item : items) {
					
					/* if it file upload data */
					if(item.isFormField() == false) {
						
						if(item.getFieldName().equals("thumbnail") && item.getSize() ==0) {
							response.getWriter().println("empty-thumbnail");
							return;
						}
						else if(item.getFieldName().equals("video") && item.getSize() == 0) {
							response.getWriter().println("empty-video");
							return;
						}
						
						String contentType = item.getContentType();
						String fileName = null;
						
						if(contentType.startsWith("image/")) {
							fileName = "image.jpg";
						}
						else if(contentType.startsWith("video/")) {
							fileName= "video.mp4";
						}
						
						ServletContext sc = request.getServletContext();
						String commonPath = sc.getInitParameter("commonPath");
						String actualPath = commonPath+File.separator+uuid+File.separator+fileName;
						
						File storeFile = new File(actualPath);
						
						item.write(storeFile);
						
						mediaId = uuid.toString();
						
					}
					else {
						
						String fieldName = item.getFieldName();
						String value = item.getString();
						
						switch(fieldName){
						
							case "name":
								name = value;
								if(name.equals("")) {
									response.getWriter().println("empty-name");
									return;
								}
								break;
							case "category":
								
								if(value.equals("") || value == null) {
									response.getWriter().println("empty-category");
									return;
								}
									
								else if(category.equals("")) {
									category = value+",";
								}
								
								else {
									category = category + "," + value;
								}
								
								break;
							case "ratings":
								strRating = value;
								floatRating = Float.parseFloat(strRating);
								break;
							case "length":
								strLength = value;
								try {
									
									Date utilCurrentDate = timeFormatter.parse(strLength);
									miliseconds = utilCurrentDate.getTime();
									sqlLength = new java.sql.Time(miliseconds);
									
								}
								catch(ParseException p) {
									System.out.println("UploadMediaInfoControllerServlet - ParseException");
									response.getWriter().println("wrong-length");
									return;
								}
								break;
							case "description":
								description = value;
								if(description.equals("")) {
									response.getWriter().println("empty-description");
									return;
								}
								break;
							case "directorName":
								directorName = value;
								if(directorName.equals("")) {
									response.getWriter().println("empty-director-name");
									return;
								}
								break;
							case "actors":
								actors = value;
								if(actors.equals("")) {
									response.getWriter().println("empty-actor-name");
									return;
								}
								break;
							case "releaseDate":
								strReleaseDate = value;
								try {
									
									Date utilReleaseDate = dateFormatter.parse(strReleaseDate);
									miliseconds = utilReleaseDate.getTime();
									sqlReleaseDate = new java.sql.Date(miliseconds);
								}
								catch(ParseException p) {
									System.out.println("UploadMediaInfoControllerServlet - ParseException");
									response.getWriter().println("wrong-date");
									return;
								}
								break;
							default:
								break;
						
						}
						
					}
					
				}
				
				
				System.out.println("category : "+category);
				 Media media = new Media(mediaId, category, name);
				 StoreMediaDao.storeMedia(media);
				 
				 MediaInfo mediaInfo = new MediaInfo(mediaId, floatRating, sqlLength,
				 description, sqlReleaseDate, directorName, actors);
				 StoreMediaInformationDao.insertMediaInformation(mediaInfo);
				 
				
			}
			catch(NumberFormatException nfm) {
				System.out.println("UploadMediaInfoControllerServlet - NumberFormatException");
				response.getWriter().println("NumberFormatException");
			}
			
			catch(Exception e) {
				System.out.println("UploadMediaInfoControllerServlet");
				e.printStackTrace();
			}
		}
		
	}



}
