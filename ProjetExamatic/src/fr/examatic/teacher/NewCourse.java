package fr.examatic.teacher;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import authentification.DBConnection;

/**
 * Servlet implementation class NewCourse
 */
@WebServlet("/NewCourse")
public class NewCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewCourse() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.getServletContext().getRequestDispatcher("/WEB-INF/new_course.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(addCourse(request, response)) {
//			request.getServletContext().getRequestDispatcher("/WEB-INF/teacher_hub.jsp").forward(request, response);
			response.sendRedirect(request.getContextPath() + "/TeacherHub");
		}
		else {
			doGet(request, response);
		}
	}
	
	private boolean addCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String courseName = request.getParameter("course_name");
		String level = request.getParameter("level");
		String str_id = request.getParameter("user_id");
		
		String error;
		
//		System.out.println(courseName);
//		System.out.println(level);
//		System.out.println(str_id);
		
		
		if (courseName == null || level == null || str_id == null) {
			error = "Verifier que vous avez rempli tous les champs.";
			request.setAttribute("error", error);
			System.out.println("Echec parametre null addCourse");
			return false;
		}
		
		courseName = courseName.trim();
		int idTeacher = Integer.parseInt(str_id);
		DBConnection db = new DBConnection();
		db.connect();
		
		//Verifier si le nom de cours existe pour ce niveau et cet enseignant
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			statement = db.getConnection().createStatement();
			
			try {
				resultSet = statement.executeQuery("SELECT * FROM `Course` WHERE `id_teacher` = " + idTeacher + " AND `course_name` = '" + courseName +"' AND level = '" + level + "'; ");
				if(resultSet.next()) {
					request.setAttribute("error", "Le nom d'utilisateur est pris. Voulez-vous en choisir un nouveau.");
					System.out.println("Echec username");
					error = "Ce cours existe déjà pour le même enseignant et le même niveau";
					request.setAttribute("error", error);
					return false;
				}
				
			}
			catch(Exception checkCourseException) {
				checkCourseException.printStackTrace();
				System.out.println("Problème de connexion à la base de données (addCourse/statement/checkCourse)");
			}
		}
		catch (Exception statementExcept) {
			statementExcept.printStackTrace();
			System.out.println("Problème de connexion à la base de données (addCourse/statement)");
		}
		
		
		PreparedStatement preparedStatement;
		try {
			preparedStatement = db.getConnection().prepareStatement("INSERT INTO `Course`(`course_name`, `level`, `id_teacher`) VALUES (?,?,?);");
			preparedStatement.setString(1, courseName);
			preparedStatement.setString(2, level);
			preparedStatement.setInt(3, idTeacher);
			
			//executer la requete
			preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error course insertion");
			return false;
		} finally {
			try {
				if (db.getConnection() != null) {
					db.getConnection().close();
				}
			} catch (SQLException e) {
				System.out.println("Problem dans la methode close()");
			}
		}
		
		return true;
	}
	
}
