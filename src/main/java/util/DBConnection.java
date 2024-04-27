package util;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;

public class DBConnection {
	
	private static Connection connection = null;
	
	public static Connection getConnection() {
		return connection;
	}
	
	public static void closeConnection () {
		
		try {
			
			if(connection != null) {
				connection.close();
				System.out.println("connection closed successfully!");
				return;
			}
			
		}
		catch(SQLException sq) {
			System.out.println("closeConnection - DBConnection - SQLException");
			sq.printStackTrace();
		}
		
	}
	
	public static void init(String driver, String url, String username, String password) {
		
		try {
			
			Class.forName(driver);
			connection = DriverManager.getConnection(url, username, password);
			System.out.println("driver loaded - connection opened successfully!");
			
		}
		catch(ClassNotFoundException cnf) {
			System.out.println("init - DBConnection - ClassNotFoundException");
			cnf.printStackTrace();
		}
		catch(SQLException sq) {
			System.out.println("init - DBConnection - SQLException");
			sq.printStackTrace();
		}
 		
	}
	
}
