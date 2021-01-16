package authentification;

public class Student {
	private int id_student;
	private String first_name;
	private String last_name;
	private String mail;
	private String hash;
	
	public Student() {
		
	}
	
	public Student(int id_student, String first_name, String last_name, String mail, String hash) {
		this.id_student = id_student;
		this.first_name = first_name;
		this.last_name = last_name;
		this.mail = mail;
		this.hash = hash;
	}

	public int getId_student() {
		return id_student;
	}

	public void setId_student(int id_student) {
		this.id_student = id_student;
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

//	@Override
//	public int hashCode() {
//		final int prime = 31;
//		int result = 1;
//		result = prime * result + ((first_name == null) ? 0 : first_name.hashCode());
//		result = prime * result + ((hash == null) ? 0 : hash.hashCode());
//		result = prime * result + id_student;
//		result = prime * result + ((last_name == null) ? 0 : last_name.hashCode());
//		result = prime * result + ((mail == null) ? 0 : mail.hashCode());
//		return result;
//	}

	@Override
	public String toString() {
		return "Student [id_student=" + id_student + ", first_name=" + first_name + ", last_name=" + last_name
				+ ", mail=" + mail + ", hash=" + hash + "]";
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Student other = (Student) obj;
		if (first_name == null) {
			if (other.first_name != null)
				return false;
		} else if (!first_name.equals(other.first_name))
			return false;
		if (hash == null) {
			if (other.hash != null)
				return false;
		} else if (!hash.equals(other.hash))
			return false;
		if (id_student != other.id_student)
			return false;
		if (last_name == null) {
			if (other.last_name != null)
				return false;
		} else if (!last_name.equals(other.last_name))
			return false;
		if (mail == null) {
			if (other.mail != null)
				return false;
		} else if (!mail.equals(other.mail))
			return false;
		return true;
	}
	
	
}
