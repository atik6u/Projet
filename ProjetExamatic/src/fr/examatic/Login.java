package fr.examatic;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import authentification.Authentification;


/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Authentification authentification = new Authentification();
		authentification.login(request);
		request.setAttribute("authentification", authentification);
//		if (authentification.isLoggedIn()) {
//			String userType = request.getParameter("userType");
//			System.out.println(userType);
//			if(userType.equals("student")) {
//				this.getServletContext().getRequestDispatcher("/WEB-INF/student_hub.jsp").forward(request, response);
//				System.out.println("student");
//			}
//			else if(userType.equals("teacher")) {
//				this.getServletContext().getRequestDispatcher("/WEB-INF/teacher_hub.jsp").forward(request, response);
//				System.out.println("teacher");
//
//			}
//		}
//		String error = "Vérifiez votre nom d'utilisateur et mot de passe";
//		request.setAttribute("error" ,error);
		doGet(request, response);
	}

}
