package dto;

public class Media {
	
	private String media_id;
	private String category;
	private String name;
	
	public String getMedia_id() {
		return media_id;
	}
	public void setMedia_id(String media_id) {
		this.media_id = media_id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public Media(String media_id, String category, String name) {
		this.media_id = media_id;
		this.category = category;
		this.name = name;
	}
	
	public Media() {
		
	}

}
