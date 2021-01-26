package model;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import authentification.DBConnection;

public class Exam implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7440370042974040054L;
	private int id_exam;
	private int school_year;
	private int id_course;
	private ArrayList<Question> questions = null;
	
	public Exam() {
		
	}

	public Exam(int id_exam, int school_year, int id_course, ArrayList<Question> questions) {
		this.id_exam = id_exam;
		this.school_year = school_year;
		this.id_course = id_course;
		this.questions = questions;
	}
	
	public Exam(int id_exam, int school_year, int id_course) {
		this.id_exam = id_exam;
		this.school_year = school_year;
		this.id_course = id_course;
	}

	public int getId_exam() {
		return id_exam;
	}

	public void setId_exam(int id_exam) {
		this.id_exam = id_exam;
	}

	public int getSchool_year() {
		return school_year;
	}

	public void setSchool_year(int school_year) {
		this.school_year = school_year;
	}

	public int getId_course() {
		return id_course;
	}

	public void setId_course(int id_course) {
		this.id_course = id_course;
	}

	public ArrayList<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(ArrayList<Question> questions) {
		this.questions = questions;
	}
	
	public void addQuestion(Question question) {
		questions.add(question);
	}
	
	public Question getQuestion(int index) {
		return questions.get(index);
	}

	@Override
	public String toString() {
		return "Exam [id_exam=" + id_exam + ", school_year=" + school_year + ", id_course=" + id_course + ", questions="
				+ questions + "]";
	}
	
}
