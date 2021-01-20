package model;

import java.io.Serializable;
import java.util.ArrayList;

public class Question implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -5266423023898700466L;
	private int id_question;
	private int id_exam;
	private String text;
	private ArrayList<String> choices = null;
	private char answer;
	
	public Question() {
		
	}

	public Question(int id_question, int id_exam, String text, ArrayList<String> choices, char answer) {
		this.id_question = id_question;
		this.id_exam = id_exam;
		this.text = text;
		this.choices = choices;
		this.answer = answer;
	}
	
	public Question(int id_exam, String text, ArrayList<String> choices, char answer) {
		this.id_question = 0;
		this.id_exam = id_exam;
		this.text = text;
		this.choices = choices;
		this.answer = answer;
	}
	
	
	public Question(int id_exam, String text, char answer) {
		this.text = text;
		this.answer = answer;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public ArrayList<String> getChoices() {
		return choices;
	}

	public void setChoices(ArrayList<String> choices) {
		this.choices = choices;
	}

	public char getAnswer() {
		return answer;
	}

	public void setAnswer(char answer) {
		this.answer = answer;
	}

	public int getId_question() {
		return id_question;
	}

	public void setId_question(int id_question) {
		this.id_question = id_question;
	}

	public int getId_exam() {
		return id_exam;
	}

	public void setId_exam(int id_exam) {
		this.id_exam = id_exam;
	}
	
}
