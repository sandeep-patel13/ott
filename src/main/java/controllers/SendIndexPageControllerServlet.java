package controllers;

import java.io.IOException;


import java.util.*;
import dto.Media;
import dao.StoreMediaDao;
import dao.StoreMediaInformationDao;
import dto.MediaInfo;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;

@WebServlet("/Send-Index-Page")
public class SendIndexPageControllerServlet extends HttpServlet {

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			HashMap<String, ArrayList<Media>> map = new HashMap<String, ArrayList<Media>>();
			
			ArrayList<Media> actionMedia = StoreMediaDao.getMediaObjectsAccordingToCategory("action");
			ArrayList<Media> romanceMedia = StoreMediaDao.getMediaObjectsAccordingToCategory("romance");
			ArrayList<Media> HorrorMedia = StoreMediaDao.getMediaObjectsAccordingToCategory("horror");
			
			map.put("action", actionMedia);
			map.put("romance", romanceMedia);
			map.put("horror", HorrorMedia);
			 
			
			String randomMediaId = StoreMediaDao.returnRandomMediaId();
			Media media = StoreMediaDao.getMediaInfo(randomMediaId);
			MediaInfo mediaInfo = StoreMediaInformationDao.getMediaAllInfo(randomMediaId);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			request.setAttribute("mediaMap", map);
			request.setAttribute("randomMediaId", randomMediaId);
			request.setAttribute("media", media);
			request.setAttribute("mediaInfo", mediaInfo);
			rd.forward(request, response);
		}
		catch(SQLException s) {
			
			System.out.println("Send-Index-Page");
			s.printStackTrace();
			
		}
		
	}

}
