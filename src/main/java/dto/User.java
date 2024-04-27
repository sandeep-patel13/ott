package dto;

public class User {
	
	private String name;
	private String password;
	private String emailId;
	private String contactNo;
	private int age;
	private String profileId;
	
	public String getContactNo() {
		return contactNo;
	}

	public String getProfileStatus() {
		return profileId;
	}

	public void setProfileStatus(String profileId) {
		this.profileId = profileId;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public User(String name, String password, String emailId, String contactNo, int age) {
		this.name = name;
		this.password = password;
		this.emailId = emailId;
		this.contactNo = contactNo;
		this.age = age;
	}

	public String getName() {
		return name;
	}
	public User() {

	
	}

	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	
}
