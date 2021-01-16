package authentification;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


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
		
		
		
		
		
//		String submit = request.getParameter("submit");
//		if(submit == null) {
//			throw new ServletException("Problème Envoie Formulaire");
//		}
//		
//		if(submit.equals("Ajouter")) {
//			Etudiant etudiant = new Etudiant();
//			etudiant.setId(Integer.parseInt(request.getParameter("id")));
//			etudiant.setNom(request.getParameter("nom"));
//			etudiant.setPrenom(request.getParameter("prenom"));
//			
//			Etudiants etudiants = new Etudiants();
//			etudiants.ajouterEtudiant(etudiant);
//		} else if(submit.equals("Modifier")) {
//			int id = Integer.parseInt(request.getParameter("id"));
//			String nom = request.getParameter("nom");
//			String prenom = request.getParameter("prenom");
//			
//			Etudiants etudiants = new Etudiants();
//			etudiants.modifierEtudiant(id, nom, prenom);
//		} else if(submit.equals("Supprimer")) {
//			int id = Integer.parseInt(request.getParameter("id"));
//			Etudiants etudiants = new Etudiants();
//			request.setAttribute("etudiantSupprime", etudiants.supprimerEtudiant(id));
//		}
//		else {
//			System.out.println("Problème Envoie Formulaire");
//		}
		
		doGet(request, response);
	}

}
