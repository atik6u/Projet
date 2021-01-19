package model;

import java.io.Serializable;

public class User implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6265688756052150199L;
	protected String first_name;
	protected String last_name;
	protected String mail;
	protected String hash;
	
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
