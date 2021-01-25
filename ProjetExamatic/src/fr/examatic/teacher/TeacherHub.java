package fr.examatic.teacher;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Course;

/**
 * Servlet implementation class TeacherHub
 */
@WebServlet("/TeacherHub")
public class TeacherHub extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeacherHub() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("before courses");
		request.setAttribute("course_list", getCourses(request, response));
		System.out.println("after courses");
		this.getServletContext().getRequestDispatcher("/WEB-INF/teacher_hub.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public void newCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/WEB-INF/new_course.jsp").forward(request, response);
	}
	
	private ArrayList<Course> getCourses(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Course> courseList = new ArrayList<Course>();
		System.out.println("working with user = " + request.getParameter("user"));
		return courseList;
	}
}
