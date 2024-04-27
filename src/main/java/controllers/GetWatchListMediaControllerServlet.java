package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import dao.StoreMediaDao;
import java.util.List;
import dto.Media;
import java.io.PrintWriter;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
@WebServlet("/get-watchList-media")
public class GetWatchListMediaControllerServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json");
		
		int limit = Integer.parseInt(request.getParameter("limit"));
		int offset = Integer.parseInt(request.getParameter("offset"));
		
		PrintWriter pw = response.getWriter();
		try {
			List<Media> list = new ArrayList<>();
			HttpSession session = request.getSession();
			List<String> mediaIdList = (List)session.getAttribute("watchList");
			for(String id : mediaIdList) {
				Media media = StoreMediaDao.getMediaInfo(id);
				media.setMedia_id(id);
				list.add(media);
			}
			Gson gson = new Gson();
			String json = gson.toJson(list);
			pw.println(json);
		}
		catch(Exception e) {
			System.out.println("get-watchList-media");
			e.printStackTrace();
			pw.println("error");
		}
		finally {
			pw.close();
		}
	}	
}
