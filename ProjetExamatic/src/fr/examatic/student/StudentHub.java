package fr.examatic.student;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import authentification.DBConnection;
import authentification.DBExam;
import model.Exam;

/**
 * Servlet implementation class StudentHub
 */
@WebServlet("/StudentHub")
public class StudentHub extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentHub() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		this.getServletContext().getRequestDispatcher("/WEB-INF/student_hub.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Take Exam");
		System.out.println(request.getParameter("id_user") + ", "+ request.getParameter("id_course"));
		int question_num = Integer.parseInt(request.getParameter("question_num"));
		String str_id_user = request.getParameter("id_user");
		
		if(str_id_user == null) {
			doGet(request, response);
			return;
		}
		int id_student = Integer.parseInt(str_id_user);
		System.out.println("question_num: " + question_num);
		
		DBExam dbExam = new DBExam();
		
		int id_exam = Integer.parseInt(request.getParameter("id_exam"));
		Exam exam = dbExam.getExam(id_exam);

		System.out.println(exam);
		int mark = 0; 
		for(int i=0; i<question_num; i++) {
			char choice = (char)Integer.parseInt(request.getParameter("choice" + (i+1)));
//			System.out.println(choice);
			char answer = exam.getQuestion(i).getAnswer();
			if(choice == answer) {
				mark++;
			}
		}
		mark = (mark*100) / question_num;
		System.out.println("Your mark is: " + mark + "/100");
		postAttempt(id_student, id_exam, mark);
		doGet(request, response);
	}
	
	private void postAttempt(int id_student, int id_exam, int mark) {
		//Connexion à la base de donnees
		DBConnection db = new DBConnection();
		db.connect();
		
		try {
			//Insertion du QCM
			PreparedStatement preparedStatement = db.getConnection().prepareStatement("INSERT INTO `Attempt`(`id_student`, `id_exam`, `mark`, `date`) VALUES (?,?,?,?)");
			preparedStatement.setInt(1, id_student);
			preparedStatement.setInt(2, id_exam);
			preparedStatement.setInt(3, mark);
			preparedStatement.setDate(4, new java.sql.Date(Calendar.getInstance().getTime().getTime()));
			
			//executer la requete
			preparedStatement.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("Erreur: postAttempt");
		}
	}
	
}
