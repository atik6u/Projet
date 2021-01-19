package model;

public class Student extends User{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3454670726658376362L;
	private int id_student;
	private String level;
	
	public Student(int id_student, String first_name, String last_name, String mail, String hash, String level) {
		super(first_name, last_name, mail, hash);
		this.id_student = id_student;
		this.level = level;
	}

	public int getId_student() {
		return id_student;
	}

	public void setId_student(int id_student) {
		this.id_student = id_student;
	}
	
	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	@Override
	public String toString() {
		return "Student [id_student=" + id_student + ", first_name=" + first_name + ", last_name=" + last_name
				+ ", mail=" + mail + ", hash=" + hash + ", level=" + level + "]";
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
		if (level == null) {
			if (other.level != null)
				return false;
		} else if (!level.equals(other.level))
			return false;
		return true;
	}
	
	
}
