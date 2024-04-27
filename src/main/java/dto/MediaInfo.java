package dto;
import java.sql.Time;
import java.sql.Date;

public class MediaInfo {

	private String media_id;
	private float ratings;
	private Time length;
	private String discription;
	private Date release_date;
	private String directors;
	private String actors;
	
	public MediaInfo(String media_id, float ratings, Time length, String discription, Date release_date,
			String directors, String actors) {
		super();
		this.media_id = media_id;
		this.ratings = ratings;
		this.length = length;
		this.discription = discription;
		this.release_date = release_date;
		this.directors = directors;
		this.actors = actors;
	}

	public MediaInfo(float ratings, Time length, String discription, Date release_date, String directors,
			String actors) {
		super();
		this.ratings = ratings;
		this.length = length;
		this.discription = discription;
		this.release_date = release_date;
		this.directors = directors;
		this.actors = actors;
	}

	public String getMedia_id() {
		return media_id;
	}

	public void setMedia_id(String media_id) {
		this.media_id = media_id;
	}

	public float getRatings() {
		return ratings;
	}

	public void setRatings(float ratings) {
		this.ratings = ratings;
	}

	public Time getLength() {
		return length;
	}

	public void setLength(Time length) {
		this.length = length;
	}

	public String getDiscription() {
		return discription;
	}

	public void setDiscription(String discription) {
		this.discription = discription;
	}

	public Date getRelease_date() {
		return release_date;
	}

	public void setRelease_date(Date release_date) {
		this.release_date = release_date;
	}

	public String getDirectors() {
		return directors;
	}

	public void setDirectors(String directors) {
		this.directors = directors;
	}

	public String getActors() {
		return actors;
	}

	public void setActors(String actors) {
		this.actors = actors;
	}

	public MediaInfo() {
		super();
	}
	
}
