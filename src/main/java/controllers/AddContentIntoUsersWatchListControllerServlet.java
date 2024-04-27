package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dto.User;
import java.util.List;
import java.util.ArrayList;
import java.io.PrintWriter;

@WebServlet("/add-media-to-watchlist")
public class AddContentIntoUsersWatchListControllerServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/plain");
		
		PrintWriter pw = response.getWriter();
		try {
			String mediaId = request.getParameter("id");
			HttpSession session = request.getSession();
			List<String> watchList = (List)session.getAttribute("watchList");
			if(!watchList.contains(mediaId)) {
				watchList.add(mediaId);
				System.out.println(watchList);
				pw.write("success");
			}
			else {
				pw.write("fail");
			}
		}
		catch(IllegalStateException e) {
			System.out.println("add-media-to-watchlist");
			e.printStackTrace();
			pw.write("error");
		}
		finally {
			pw.close();
		}
	}
}
