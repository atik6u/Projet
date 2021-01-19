package model;

import java.io.Serializable;
import java.util.ArrayList;

public class Question implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -5266423023898700466L;
	private String text;
	private ArrayList<String> choices = null;
	private char answer;
	
	public Question() {
		
	}

	public Question(String text, ArrayList<String> choices, char answer) {
		this.text = text;
		this.choices = choices;
		this.answer = answer;
	}
	
	public Question(String text, char answer) {
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
	
}
