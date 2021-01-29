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
import authentification.DBExam;
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
//		String id_user_str = request.getParameter("id_user");
//		if(id_user_str != null) {
//			int id_user = Integer.parseInt(id_user_str);
//			request.setAttribute("id_user", id_user);
//		}
		
		int school_year = Calendar.getInstance().get(Calendar.YEAR);
		String id_course_str = request.getParameter("id_course");
		if(id_course_str != null) {
			int id_course = Integer.parseInt(id_course_str);
			request.setAttribute("id_course", id_course);
			
			DBExam dbExam = new DBExam();
			int id_exam = dbExam.findIdExam(school_year, id_course);
			if(id_exam == 0) {
				String error = "Ce QCM n'est pas dispodinble";
				request.setAttribute("error", error);
				this.getServletContext().getRequestDispatcher("/WEB-INF/student_hub.jsp").forward(request, response);
			} else {
				Exam exam = dbExam.getExam(id_exam);
				request.setAttribute("exam", exam);
				doGet(request, response);
			}
		}
	}
		
}
