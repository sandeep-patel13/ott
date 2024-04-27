package listener;

import javax.servlet.ServletContextListener;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContext;
import util.DBConnection;

public class MyListener implements ServletContextListener {
	
	@Override
	public void contextInitialized(ServletContextEvent e) {
		
		ServletContext sc = e.getServletContext();
		String driver = sc.getInitParameter("driver");
		String url = sc.getInitParameter("url");
		String username = sc.getInitParameter("username");
		String password = sc.getInitParameter("password");
		DBConnection.init(driver, url, username, password);
		
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent e) {
		
		DBConnection.closeConnection();
		
	}
	
}
