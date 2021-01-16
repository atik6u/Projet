package model;

public class Teacher extends User{
	private int id_teacher;
	private String first_name;
	private String last_name;
	private String mail;
	private String hash;
	
	public Teacher(int id_teacher, String first_name, String last_name, String mail, String hash) {
		super(first_name, last_name, mail, hash);
		this.id_teacher = id_teacher;
	}

	public int getId_teacher() {
		return id_teacher;
	}

	public void setId_teacher(int id_teacher) {
		this.id_teacher = id_teacher;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Teacher other = (Teacher) obj;
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
		if (id_teacher != other.id_teacher)
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

	@Override
	public String toString() {
		return "Teacher [id_teacher=" + id_teacher + ", first_name=" + first_name + ", last_name=" + last_name
				+ ", mail=" + mail + ", hash=" + hash + "]";
	}
	
}
