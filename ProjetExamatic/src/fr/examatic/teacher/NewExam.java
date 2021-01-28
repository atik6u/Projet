package fr.examatic.teacher;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;

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
 * Servlet implementation class NewExam
 */
@WebServlet("/NewExam")
public class NewExam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewExam() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.getServletContext().getRequestDispatcher("/WEB-INF/new_exam.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if(addExam(request, response)){
			
		}
		else {
			doGet(request, response);
		}
	}
	
	
	private boolean addExam(HttpServletRequest request, HttpServletResponse response) {
		int numQuestions = Integer.parseInt(request.getParameter("num_questions"));
		System.out.println(numQuestions);
		if(numQuestions == 0) {
			return false;
		}
		
		int school_year = Calendar.getInstance().get(Calendar.YEAR);
		int id_course = Integer.parseInt(request.getParameter("course"));
		int id_Teacher = Integer.parseInt(request.getParameter("user_id"));
		
		Exam exam;
		try {
			exam = new Exam();
			
			Question question;
			for(int i=1; i<=numQuestions; i++) {
				String text = request.getParameter("text" + i);
				char answer = request.getParameter("answer" + i).charAt(0);
				int numChoice = Integer.parseInt(request.getParameter("numChoice" + i));
				ArrayList<Choice> choices = new ArrayList<Choice>();
				for(int j=0; j<numChoice; j++) {
					String choiceValue = request.getParameter("choice" + (char)(65+j) + i);
					char letter = (char)(65+j);
					choices.add(new Choice(letter, choiceValue));
				}
				question = new Question(text, choices, answer);
				exam.addQuestion(question);
				exam.setSchool_year(school_year);
			}
			exam.setId_course(id_course);
			System.out.println(exam);
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("Echech: recuperation du contenu d'exam (New Exam)");
			return false;
		}
		
		if(!postExam(exam)) {
			return false;
		}
		return true;
	}
	
	private boolean postExam(Exam exam) {
		if(exam == null) {
			return false;
		}
		
		//Connexion à la base de donnees
		DBConnection db = new DBConnection();
		db.connect();
		
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			
			//Verification que  Qcm n'existe pas deja
			statement = db.getConnection().createStatement();
			resultSet = statement.executeQuery("SELECT * FROM `Exam` WHERE `id_course` = " + exam.getId_course() + " AND `school_year` = " + exam.getSchool_year() + ";");
			if(resultSet.next()) {
				System.out.println("Erreur: Exam Existe deja");
				return false;
			}
			
			//Insertion du QCM
			PreparedStatement preparedStatement = db.getConnection().prepareStatement("INSERT INTO `Exam`(`school_year`, `id_course`) VALUES (?,?)");
			preparedStatement.setInt(1, exam.getSchool_year());
			preparedStatement.setInt(2, exam.getId_course());
			//executer la requete
			preparedStatement.executeUpdate();
			
			//Recuperation de id_exam
			resultSet = statement.executeQuery("SELECT * FROM `Exam` WHERE `id_course` = " + exam.getId_course() + " AND `school_year` = " + exam.getSchool_year() + ";");
			
			if(resultSet.next()) {
				int id_exam = resultSet.getInt("id_exam");
				exam.setId_exam(id_exam);
				//Insertion des question au QCM
				for (Question question : exam.getQuestions()) {
					preparedStatement = db.getConnection().prepareStatement("INSERT INTO `Question`(`id_exam`, `text`, `answer`) VALUES (?,?,?)");
					preparedStatement.setInt(1, exam.getSchool_year());
					preparedStatement.setInt(2, exam.getId_course());
					preparedStatement.setString(3, question.getAnswer()+"");
					//executer la requete
					preparedStatement.executeUpdate();
				}
			}
			else {
				System.out.println("Erreur: recuperation de id_exam depuis la nase de donnees");
				return false;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("Echech: envoie du contenu d'exam à la base de donnees (New Exam)");
			return false;
		}
		
		return true;
	}
}
