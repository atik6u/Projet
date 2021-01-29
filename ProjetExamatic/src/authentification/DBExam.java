package authentification;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;

import model.Choice;
import model.Exam;
import model.Question;

public class DBExam extends DBConnection {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2190566723276527108L;
	
	public DBExam() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int findIdExam(int school_year, int id_course) {
		// TODO Auto-generated method stub
		this.connect();
		
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			statement = this.connection.createStatement();
			
			//Recuperation de id_exam
			resultSet = statement.executeQuery("SELECT * FROM `Exam` WHERE `id_course` = " + id_course + " AND `school_year` = " + school_year + " ;");
			if(resultSet.next()) {
				int id_exam = resultSet.getInt("id_exam");
				return id_exam;
			}
			else {
				return 0;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("Problem dans la methode findIdExam");
		}
		finally {
			try {
				if (this.connection != null) {
					this.connection.close();
				}
				if (statement != null) {
					statement.close();
				}
				if (resultSet != null) {
					resultSet.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("Problem dans la methode close()");
			}	
		}
		return 0;
	}

	
	public Exam getExam( int id_exam) {
			
			this.connect();
			
			Statement statement = null;
			ResultSet resultSet = null;
			
			try {
				statement = this.connection.createStatement();
				
				
				// Verification de exam
				int school_year = 0;
				int id_course = 0;
				resultSet = statement.executeQuery("SELECT * FROM `Exam` WHERE `id_exam` = '" + id_exam + "';");
				if(resultSet.next()) {
					school_year = resultSet.getInt("school_year");
					id_course = resultSet.findColumn("id_course");
				}
				
				// Recuperation des questions
	
				resultSet = statement.executeQuery("SELECT * FROM `Question` WHERE `id_exam` = '" + id_exam + "';");
				
				ArrayList<Question> questions = new ArrayList<Question>();
				int id_question;
				String text;
				char answer;
				while(resultSet.next()) {
					id_question = resultSet.getInt("id_question");
					text = resultSet.getString("text");
					answer = resultSet.getString("answer").charAt(0);
					questions.add(new Question(id_question, id_exam, text, answer));
				}
				
				// Recuperation des choix
				char letter;
				String value;
				Choice choice;
				for (Question question : questions) {
					id_question = question.getId_question();
					resultSet = statement.executeQuery("SELECT * FROM `Choice` WHERE `id_question` = '" + id_question + "';");
					while(resultSet.next()) {
						letter = resultSet.getString("letter").charAt(0);
						value = resultSet.getString("value");
						choice = new Choice(id_question, letter, value);
						question.addChoice(choice);
					}
				}
				Exam exam = new Exam(id_exam, school_year, id_course, questions);
				return exam;
			}
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				System.out.println("Error connexion base de donnees (getExam)");
				
			}
			finally {
				try {
					if (this.connection != null) {
						this.connection.close();
					}
					if (statement != null) {
						statement.close();
					}
					if (resultSet != null) {
						resultSet.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
					System.out.println("Problem dans la methode close()");
				}	
			}
			return null;
		}
}
