package dao;
import util.DBConnection;


import java.sql.Statement;
import dto.Media;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import java.sql.ResultSet;
import dto.Media;

public class StoreMediaDao {

	private static PreparedStatement ps1;
	private static PreparedStatement ps2;
	private static Statement st1;
	private static PreparedStatement ps3;
	private static PreparedStatement ps4;
	private static PreparedStatement ps5;
	private static PreparedStatement ps6;
	private static Statement ps7;

	
	static {
		
		try{
			
			ps1 = DBConnection.getConnection().prepareStatement("insert into media (media_id, category, name) values (?, ?, ?)");
			ps2 = DBConnection.getConnection().prepareStatement("select * from media limit ? offset ?");
			st1 = DBConnection.getConnection().createStatement();
			ps3 = DBConnection.getConnection().prepareStatement("select category, name from media where media_id = ?");
			ps4 = DBConnection.getConnection().prepareStatement("select * from media where name like ?");
			ps5 = DBConnection.getConnection().prepareStatement("update media set category = ? , name = ? where media_id = ?");
			ps6 = DBConnection.getConnection().prepareStatement("select * from media where category = ?");
			ps7 = DBConnection.getConnection().createStatement();
			
		}
		catch(SQLException sq) {
			
			System.out.println("static - StoreMediaDao");
			sq.printStackTrace();
			
		}
		
	}
	
	public static String returnRandomMediaId() throws SQLException{
		
		ResultSet rs = st1.executeQuery("select media_id from media order by RAND() LIMIT 1;");
		String randomMediaId = null;
		while(rs.next()) {
			randomMediaId = rs.getString(1);
		}
		
		return randomMediaId;
		
	}
	
	
	public static ArrayList<Media> getMediaObjectsAccordingToCategory(String category) throws SQLException{
		
		ps6.setString(1, category);
		ResultSet rs = ps6.executeQuery();
		ArrayList<Media> mediaList = new ArrayList<>();
		while(rs.next()) {
			
			String mediaId = rs.getString(1);
			String c = rs.getString(2);
			String mediaName = rs.getString(3);
			Media media = new Media(mediaId, c, mediaName);
			mediaList.add(media);
			
		}
		
		return mediaList;
		
	}
	
	 
	public static void updateMediaBasedOnMedia(Media media) throws SQLException {
		
		ps5.setString(getTotalNumberOfMediaLimit(), media.getCategory());
		ps5.setString(2 , media.getName());
		ps5.executeQuery();
		
	}
	 
	
	 
	public static List<Media> searchByName(String pattern) throws SQLException {
		
		ps4.setString(1, pattern+"%");
		ResultSet rs = ps4.executeQuery();
		List<Media> list = new ArrayList<>();
		while(rs.next()) {
			
			String media_id = rs.getString(1);
			String category = rs.getString(2);
			String name = rs.getString(3);
			Media media = new Media(media_id, category, name);
			list.add(media);
			
		}
		
		return list;
		
	}
	
	public static Media getMediaInfo(String id) throws SQLException {
		
		ps3.setString(1, id);
		ResultSet rs = ps3.executeQuery();
		Media media = new Media();
		while(rs.next()) {
			
			String category = rs.getString(1);
			String name = rs.getString(2);
			
			media.setCategory(category);
			media.setName(name);
			
		}
		
		return media;
		
	}
	
	public static List<Media> getMediaLimitOffset(int limit, int offset) throws SQLException {
		
		ps2.setInt(1, limit);
		ps2.setInt(2, offset);
		
		System.out.println(ps2.toString());
		
		ResultSet rs = ps2.executeQuery();
		
		List<Media> list = new ArrayList<>();
		
		while(rs.next()) {
			
			Media media = new Media();
			media.setMedia_id(rs.getString(1));
			media.setCategory(rs.getString(2));
			media.setName(rs.getString(3));
			
			list.add(media);
		}
		
		return list;
		
	}
	
	public static int getTotalNumberOfMediaLimit() throws SQLException {
			
		ResultSet rs = st1.executeQuery("select count(*) from media");
		
		int count = 0;
		
		if(rs.next()) {
			count = rs.getInt(1);
		}
		
		return count;
	}
		
	
	public static boolean storeMedia(Media media) throws SQLException{
		
		ps1.setString(1, media.getMedia_id());
		ps1.setString(2, media.getCategory());
		ps1.setString(3, media.getName());
		
		int a = ps1.executeUpdate();
		
		if(a > 0) {
			return true;
		}
		else {
			return false;
		}
		
	}
	
	
}
