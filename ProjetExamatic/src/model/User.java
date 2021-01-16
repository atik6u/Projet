package model;

public class User {
	private String first_name;
	private String last_name;
	private String mail;
	private String hash;
	
	public User() {
		
	}
	
	public User(String first_name, String last_name, String mail, String hash) {
		super();
		this.first_name = first_name;
		this.last_name = last_name;
		this.mail = mail;
		this.hash = hash;
	}
	
	public String getName() {
		return first_name + " " + last_name;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getHash() {
		return hash;
	}

	public void setHash(String hash) {
		this.hash = hash;
	}
	
	
}
