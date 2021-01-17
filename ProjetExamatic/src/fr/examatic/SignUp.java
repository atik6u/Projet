package fr.examatic;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import authentification.Registration;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String mail = request.getParameter("mail");
		String password = request.getParameter("password");
		if (password != null) {
			String hash = Integer.toString(password.hashCode());
		}
		this.getServletContext().getRequestDispatcher("/WEB-INF/sign_up.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Registration registration = new Registration();
		if(!registration.signUp(request)) {
			request.setAttribute("error", "Echec Ceation de compte");
			System.out.println("Echec Ceation de compte");
		}
		
		doGet(request, response);
	}

}
