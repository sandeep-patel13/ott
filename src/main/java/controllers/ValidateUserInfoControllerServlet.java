package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import dao.UserDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.SQLException;
import dto.User;
import dao.UserDao;
import java.util.List;
import java.util.ArrayList;
import javax.servlet.ServletContext;
@WebServlet("/validate-user-info")
public class ValidateUserInfoControllerServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		
		String email = request.getParameter("loginEmailInput");
		String pwd = request.getParameter("pwdInput");
		
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(300);
		session.setAttribute("email", email);
		session.setAttribute("password", pwd);
		
		if(session.getAttribute("watchList") == null) {
			List<String> watchList = new ArrayList<>();
			session.setAttribute("watchList", watchList);
		}
		
//		session.setMaxInactiveInterval(300);
		
		try {
			boolean x = UserDao.validateUserInformation(email, pwd);
			RequestDispatcher rd = null;
			
			ServletContext sc = super.getServletContext();
			String adminEmail = sc.getInitParameter("adminEmail");
			String adminPassword = sc.getInitParameter("adminPassword");
			
			if(email.equals(adminEmail) && pwd.equals(adminPassword)) {
				response.sendRedirect("adminActions.jsp");
			}
			else if(x == false) {
				rd = request.getRequestDispatcher("invalidUsernameOrPassword.jsp");
				rd.forward(request, response);
				return;
			}
			else {
				rd = request.getRequestDispatcher("UserProfleWebPage.jsp");
				User user = UserDao.getUserAllInfoOfUser(email);
				
				session.setAttribute("user", user);
				rd.forward(request, response);	
			}
		}
		catch(SQLException s) {
			System.out.println("validate-user-info");
			s.printStackTrace();
		}
		
	}

}
