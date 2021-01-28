package model;

import java.io.Serializable;

public class Choice implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1562286525630204940L;
	private int id_question;
	private char letter;
	private String value;
	
	public Choice() {
		super();
	}
	
	public Choice(int id_question, char letter, String value) {
		super();
		this.id_question = id_question;
		this.letter = letter;
		this.value = value;
	}
	
	public Choice(char letter, String value) {
		super();
		this.letter = letter;
		this.value = value;
	}

	public int getId_question() {
		return id_question;
	}

	public void setId_question(int id_question) {
		this.id_question = id_question;
	}

	public char getLetter() {
		return letter;
	}

	public void setLetter(char letter) {
		this.letter = letter;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id_question;
		result = prime * result + letter;
		result = prime * result + ((value == null) ? 0 : value.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Choice other = (Choice) obj;
		if (id_question != other.id_question)
			return false;
		if (letter != other.letter)
			return false;
		if (value == null) {
			if (other.value != null)
				return false;
		} else if (!value.equals(other.value))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "\n\t\tChoice [id_question=" + id_question + ", letter=" + letter + ", value=" + value + "]";
	}
	
	
}
