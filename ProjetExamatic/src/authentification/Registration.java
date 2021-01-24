package authentification;

import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;

import model.Student;
import model.Teacher;

public class Registration extends DBConnection {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6053051423885189427L;
	private boolean registered = false;

	public boolean isRegistered() {
		return registered;
	}

	public void setRegistered(boolean registered) {
		this.registered = registered;
	}

	public Registration() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public boolean signUp(HttpServletRequest request) {
		String userType = request.getParameter("usertype");
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String username = request.getParameter("username");
		String mail = request.getParameter("mail");
		String password = request.getParameter("password");
		String password_conf = request.getParameter("password_conf");
		
		if (password == null || first_name == null || last_name == null || username == null || password == null || password_conf == null) {
			request.setAttribute("error", "Verifier que vous avez rempli tous les champs.");
			System.out.println("Echec mot de passe null");
			return false;
		}
		if (!password.equals(password_conf)) {
			request.setAttribute("error", "Verifier que vous avez entrez le même mot de passe dans les deux champs \"Mot de passe\" et \"Confirmer le mot de passe\". ");
			System.out.println("Echec Verification du mot de passe");
			return false;
		}
		
		String hash;
		try {
			hash = Encryption.Encrypt(password);
		} catch (NoSuchAlgorithmException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			request.setAttribute("error", "Erreur Cryptage");
			System.out.println("Echec Encryption");
			return false;
		}
		
		this.connect();
		
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			
			statement = connection.createStatement();
			
			// Executer une requete
			if (userType.equals("student")) {
				String level = request.getParameter("level");
				
				try {
					resultSet = statement.executeQuery("SELECT * FROM `Student` WHERE `mail` = '" + username.trim() + "';");
				}
				catch(Exception checkStudenExcept) {
					checkStudenExcept.printStackTrace();
					System.out.println("Problème de connexion à la base de données (Check Student)");
				}
				
				Student student = new Student(0, first_name, last_name, username, hash, level);

				if(resultSet.next()) {
					request.setAttribute("error", "Le nom d'utilisateur est pris. Voulez-vous en choisir un nouveau.");
					System.out.println("Echec username");
					return false;
				}
				try {
					System.out.println(student);
					PreparedStatement preparedStatement = this.connection.prepareStatement("INSERT INTO `Student`(`first_name`, `last_name`, `mail`, `hash`, `level`) VALUES (?,?,?,?,?)");
					preparedStatement.setString(1, student.getFirst_name());
					preparedStatement.setString(2, student.getLast_name());
					preparedStatement.setString(3, student.getMail());
					preparedStatement.setString(4, student.getHash());
					preparedStatement.setString(5, student.getLevel());
	
					//executer la requete
					preparedStatement.executeUpdate();
				}
				catch(Exception insertStudenExcept) {
					insertStudenExcept.printStackTrace();
					System.out.println("Problème de connexion à la base de données (Insert Student)");
				}
			}
			else if (userType.equals("teacher")) {
				try {
					resultSet = statement.executeQuery("SELECT * FROM `Teacher` WHERE `mail` = '" + username.trim() + "';");
				}
				catch(Exception checkTeacherExcept) {
					checkTeacherExcept.printStackTrace();
					System.out.println("Problème de connexion à la base de données (Check Teacher)");
				}
				
				Teacher teacher = new Teacher(0, first_name, last_name, username, hash);

				if(resultSet.next()) {
					request.setAttribute("error", "Le nom d'utilisateur est pris. Voulez-vous en choisir un nouveau.");
					System.out.println("Echec username");
					return false;
				}
				try {
					PreparedStatement preparedStatement = this.connection.prepareStatement("INSERT INTO `Teacher`(`first_name`, `last_name`, `mail`, `hash`) VALUES (?,?,?,?)");
					preparedStatement.setString(1, teacher.getFirst_name());
					preparedStatement.setString(2, teacher.getLast_name());
					preparedStatement.setString(3, teacher.getMail());
					preparedStatement.setString(4, teacher.getHash());
					
					//executer la requete
					preparedStatement.executeUpdate();
				
				}
				catch (Exception insertTeacherExcept) {
					insertTeacherExcept.printStackTrace();
					System.out.println("Problème de connexion à la base de données (insert Teacher)");
				}
			}
			else {
				throw new IllegalArgumentException("Error usertype : " + userType);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Problème de connexion à la base de données (REGISTRATION)");
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
				if (statement != null) {
					statement.close();
				}
				if (resultSet != null) {
					resultSet.close();
				}
			} catch (SQLException e) {
				System.out.println("Problem dans la methode close()");
			}
		}
		return true;
	}
}
