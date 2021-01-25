package fr.examatic;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import authentification.Authentification;
import model.User;


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
		
		String user = request.getParameter("user");
		if(user == null) {
			this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
		}
		else {
			String userType = request.getParameter("usertype");
			if(userType == null) {	
				request.setAttribute("user", null);
				String error = "Choisissez le type de votre compte";
				request.setAttribute("error", error);
				doGet(request, response);
			}
			else if(userType.equals("student")) {
				this.getServletContext().getRequestDispatcher("/WEB-INF/student_hub.jsp").forward(request, response);
			}
			else if(userType.equals("teacher")) {
				this.getServletContext().getRequestDispatcher("/WEB-INF/teacher_hub.jsp").forward(request, response);
			}
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Authentification authentification = new Authentification();
		authentification.login(request);
		request.setAttribute("authentification", authentification);
		if (authentification.isLoggedIn()) {
			String userType = request.getParameter("usertype");
			if(userType == null) {
				
				doGet(request, response);
				String error = "Choisissez le type de votre compte";
				request.setAttribute("error", error);
				return;
			}
			User user = authentification.getUser();
			System.out.println(user);
			request.setAttribute("user", user);
			request.setAttribute("user_id", user.getId());
			if(userType.equals("student")) {
				this.getServletContext().getRequestDispatcher("/WEB-INF/student_hub.jsp").forward(request, response);
			}
			else if(userType.equals("teacher")) {
				this.getServletContext().getRequestDispatcher("/WEB-INF/teacher_hub.jsp").forward(request, response);
			}
		} else {
			String error = "Vérifiez votre nom d'utilisateur et mot de passe";
			request.setAttribute("error" ,error);
			doGet(request, response);		
		}
	}

}
