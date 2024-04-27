package dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import util.DBConnection;
import util.DBConnection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import org.jasypt.util.password.StrongPasswordEncryptor;
import dto.User;
public class UserDao {

	private static PreparedStatement ps1;
	private static PreparedStatement ps2;
	private static PreparedStatement ps3;
	private static PreparedStatement ps4;
	private static PreparedStatement ps5;
	private static StrongPasswordEncryptor spe = new StrongPasswordEncryptor();
	
	static {
		
		try {
			
			ps1 = DBConnection.getConnection().prepareStatement("insert into users (name, email, contact_no, password, age) values (? , ? , ? , ? , ?)");
			ps2 = DBConnection.getConnection().prepareStatement("select password from users where email = ?;");
			ps3 = DBConnection.getConnection().prepareStatement("select name, email, contact_no , age , profile_status from users where email = ?;");
			ps4 = DBConnection.getConnection().prepareStatement("update users set profile_status = ? where email = ?;");
			ps5 = DBConnection.getConnection().prepareStatement("select profile_status from users where email = ?");
			
		}
		catch(SQLException sq) {
			System.out.println("static - UserDao");
			sq.printStackTrace();
		}
		
	}
	
	public static String hasProfileStatus(String email) throws SQLException{
		ps5.setString(1, email);
		ResultSet rs = ps5.executeQuery();
		String profileStatus = "";
		while(rs.next()) {
			profileStatus = rs.getString(1);
		}
		return profileStatus;
	}
	
	public static boolean updateProfileStatus(String profileId , String email) throws SQLException{
	
		ps4.setString(2, email);
		ps4.setString(1, profileId);
		int x = ps4.executeUpdate();
		return x == 1 ? true : false;
		
	}
	
	public static User getUserAllInfoOfUser(String email) throws SQLException{
		
		ps3.setString(1, email);
		ResultSet rs = ps3.executeQuery();
		User user = new User();
		while(rs.next()) {
			String name = rs.getString(1);
			String e = rs.getString(2);
			String contact = rs.getString(3);
			int age = rs.getInt(4);
			String profileStataus = rs.getString(5);
			
			user.setName(name);
			user.setEmailId(e);
			user.setContactNo(contact);
			user.setAge(age);
			user.setProfileStatus(profileStataus);
		}
		return user;
	}
	
	public static boolean saveUserInformation(String name, String email, String pwd, String contact_no, int age) throws SQLException{
		
		String encPwd = spe.encryptPassword(pwd);
		ps1.setString(1, name);
		ps1.setString(2, email);
		ps1.setString(3, contact_no);
		ps1.setString(4, encPwd);
		ps1.setInt(5, age);
		int x = ps1.executeUpdate();
		if(x > 0)
			return true;
		return false;
	}
	
	public static boolean validateUserInformation(String email, String pwd) throws SQLException{
		
		ps2.setString(1, email);
		ResultSet rs = ps2.executeQuery();
		if(rs.next()) {
			String fetchedPwd = rs.getString(1);
//			validate
			return spe.checkPassword(pwd, fetchedPwd);
			
		}
		return false;
	}
	
}
