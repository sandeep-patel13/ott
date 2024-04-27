package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.StoreMediaDao;
import dao.StoreMediaInformationDao;
import dto.Media;
import dto.MediaInfo;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;

@WebServlet("/update-media")
public class UpdateMediaControllerServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
		String id = request.getParameter("id");
		try {
			
			Media media = StoreMediaDao.getMediaInfo(id);
			MediaInfo mediaInfo = StoreMediaInformationDao.getMediaAllInfo(id);
			RequestDispatcher rd = request.getRequestDispatcher("adminUpdateMedia1.jsp");
			request.setAttribute("media", media);
			request.setAttribute("mediaInfo", mediaInfo);
			request.setAttribute("id", id);
			rd.forward(request, response);
			
		}
		catch(SQLException s) {
			
		}
		
		
	}


}
