package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dto.User;
import dao.UserDao;


@WebServlet("/save-user-info")
public class SaveUserInfoControllerServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		
		String email_id = request.getParameter("email");
		String password = request.getParameter("password");
		String name = request.getParameter("username");
		String contactNo = request.getParameter("contactNo");
		int age = Integer.parseInt(request.getParameter("age"));
		
		PrintWriter out = response.getWriter();
		
		try {
			boolean ans = UserDao.saveUserInformation(name, email_id, password, contactNo, age);
			if(ans == true) {
				out.println("true");
				return;
			}
			else
				out.println("false");
				
		}
		catch(SQLException s) {
			System.out.println("save-user-info");
			s.printStackTrace();
			out.println("false");
		}
		
	}

}
