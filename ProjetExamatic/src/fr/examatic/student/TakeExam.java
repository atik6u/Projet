package fr.examatic.student;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import authentification.DBConnection;
import model.Choice;
import model.Exam;
import model.Question;

/**
 * Servlet implementation class TakeExam
 */
@WebServlet("/TakeExam")
public class TakeExam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TakeExam() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		this.getServletContext().getRequestDispatcher("/WEB-INF/take_exam.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id_user_str = request.getParameter("id_user");
		if(id_user_str != null) {
			int id_user = Integer.parseInt(id_user_str);
			request.setAttribute("id_user", id_user);
		}
		
		int school_year = Calendar.getInstance().get(Calendar.YEAR);
		String id_course_str = request.getParameter("id_course");
		if(id_course_str != null) {
			int id_course = Integer.parseInt(id_course_str);
			request.setAttribute("id_course", id_course);
			
			int id_exam = findIdExam(school_year, id_course);
			System.out.println("idExam = " + id_exam);
			if(id_exam == 0) {
				String error = "Ce QCM n'est pas dispodinble";
				request.setAttribute("error", error);
				this.getServletContext().getRequestDispatcher("/WEB-INF/student_hub.jsp").forward(request, response);
			} else {
				Exam exam = getExam(id_exam);
				request.setAttribute("exam", exam);
				doGet(request, response);
			}
		}
	}
	
private int findIdExam(int school_year, int id_course) {
	// TODO Auto-generated method stub
	DBConnection db = new DBConnection();
	db.connect();
	
	Statement statement = null;
	ResultSet resultSet = null;
	
	try {
		statement = db.getConnection().createStatement();
		
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
			if (db.getConnection() != null) {
				db.getConnection().close();
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
		
		DBConnection db = new DBConnection();
		db.connect();
		
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			statement = db.getConnection().createStatement();
			
			
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
				if (db.getConnection() != null) {
					db.getConnection().close();
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
