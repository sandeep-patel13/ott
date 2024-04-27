package controllers;

import java.io.IOException;
import dao.StoreMediaDao;
import dto.Media;
import java.util.List;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/get-list-media")
public class GetListOfMediaControllerServlet extends HttpServlet {
	
	int limit = 0, offset = 0 , remaining = 0;
	List<Media> list = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
//			means abhi hum jsp me nahi gaye,
//			to pehli baar ke liye in atrributes ko initialize karne ke liye
			if(request.getParameter("visitToJsp") == null) {
				
				limit = 5; offset = 0; remaining = 0;
				list = StoreMediaDao.getMediaLimitOffset(limit, offset);
				remaining = StoreMediaDao.getTotalNumberOfMediaLimit();
				
				
			}
			
			else if(request.getParameter("visitToJsp").equalsIgnoreCase("yes")) {
				
				limit = Integer.parseInt(request.getParameter("limit"));
				offset = Integer.parseInt(request.getParameter("offset"));
				remaining = Integer.parseInt(request.getParameter("remaining"));
				list = StoreMediaDao.getMediaLimitOffset(limit, offset);
				
			}
			
			request.setAttribute("mediaList", list);
			request.setAttribute("offset", offset);
			request.setAttribute("limit", limit);
			request.setAttribute("remaining", remaining);
			RequestDispatcher rd = request.getRequestDispatcher("adminShowMediaList.jsp");
			rd.forward(request, response);
			
		}
		catch(SQLException sq) {
			System.out.println("get-list-media");
			sq.printStackTrace();
		}
		
	
	}


}
