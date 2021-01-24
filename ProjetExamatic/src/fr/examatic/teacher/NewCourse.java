package fr.examatic.teacher;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
		boolean isTeacher;
//		if(get)
		request.getServletContext().getRequestDispatcher("/WEB-INF/new_course.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(addCourse(request, response)) {
			request.getServletContext().getRequestDispatcher("/WEB-INF/teacher_hub.jsp").forward(request, response);
		}
		else {
			doGet(request, response);
		}
	}
	
	private boolean addCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String courseName = request.getParameter("course_name");
		String level = request.getParameter("level");
		String str_id = request.getParameter("user_id");
		
		System.out.println(courseName);
		System.out.println(level);
		System.out.println(str_id);
		
		
		if (courseName == null || level == null || str_id == null) {
			request.setAttribute("error", "Verifier que vous avez rempli tous les champs.");
			System.out.println("Echec parametre null addCourse");
			return false;
		}
		
		int idTeacher = Integer.parseInt(str_id);
		DBConnection db = new DBConnection();
		db.connect();
		
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
