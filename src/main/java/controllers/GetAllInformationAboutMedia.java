package controllers;

import java.io.IOException;
import dao.StoreMediaDao;
import dao.StoreMediaInformationDao;
import dto.MediaInfo;
import dto.Media;
import dao.StoreMediaInformationDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;


@WebServlet("/get-all-info-media")
public class GetAllInformationAboutMedia extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		String media_id = request.getParameter("id");
			
		try {
			
			Media media = StoreMediaDao.getMediaInfo(media_id);
			MediaInfo mediaInfo = StoreMediaInformationDao.getMediaAllInfo(media_id);
			request.setAttribute("mediaInfo", mediaInfo);
			request.setAttribute("media", media);
			request.setAttribute("media_id", media_id);
			RequestDispatcher rd = request.getRequestDispatcher("showAllInformationOfMedia.jsp");
			rd.forward(request, response);
			
		}
		catch(SQLException sq) {
			System.out.println("UploadMediaInfoControllerServlet - NumberFormatException");
			response.getWriter().println("NumberFormatException");
		}
		
	
	}

}
