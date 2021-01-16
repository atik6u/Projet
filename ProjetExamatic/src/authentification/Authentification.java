package authentification;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;

import model.Student;
import model.Teacher;
import model.User;

public class Authentification implements Serializable{
	private Connection connection;
	private boolean connected = false;
	private String userType = "";
	private User user;
	
	public Connection getConnection() {
		return connection;
	}

	public void setConnection(Connection connection) {
		this.connection = connection;
	}

	public Authentification() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public void login(HttpServletRequest request) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		userType = request.getParameter("usertype");
		
		this.connect();
		
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		
		try {
			
			statement = connection.createStatement();
			
			// Executer une requete
			if (userType.equals("student")) {
				resultSet = statement.executeQuery("SELECT * FROM `Student` WHERE `mail` = '" + username.trim() + "';");
				//recuperation des donnees
				int id_student;
				String first_name;
				String last_name;
				String mail;
				String hash;
				String level;
				
				if(resultSet.next()) {
					id_student = resultSet.getInt("id_student");
					first_name = resultSet.getString("first_name");
					last_name = resultSet.getString("last_name");
					mail = resultSet.getString("mail");
					hash = resultSet.getString("hash");
					level = resultSet.getString("level");
					user = new Student(id_student, first_name, last_name, mail, hash, level);
					connected = true;
				}	
			}
			else if (userType.equals("teacher")) {
				resultSet = statement.executeQuery("SELECT * FROM `Teacher` WHERE `mail` = '" + username.trim() + "';");
				//recuperation des donnees
				int id_teacher;
				String first_name;
				String last_name;
				String mail;
				String hash;
				
				if(resultSet.next()) {
					id_teacher = resultSet.getInt("id_teacher");
					first_name = resultSet.getString("first_name");
					last_name = resultSet.getString("last_name");
					mail = resultSet.getString("mail");
					hash = resultSet.getString("hash");
					user = new Teacher(id_teacher, first_name, last_name, mail, hash);
					connected = true;
				}
			}
			else {
				throw new IllegalArgumentException("Error usertype : " + userType);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			connected = false;
			System.out.println("Problème de connexion à la base de données");
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
		
		
		
		
//		if (password.equals(username+"1234")) {
//			this.connected = true;
//		} else {
//			this.connected = false;
//		}
	}
	
	public void connect() {
			
			// Chargement du driver de MySQL 
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");	// exception surveillée
			} catch (ClassNotFoundException e) {
				System.out.println("Le driver n'est pas chargé");
			}
			//se connecter à la base de données
			try {
				this.connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Examatic?useSSL=false", "root", "root");
			} catch (Exception e) {
				System.out.println("Erreur connexion à la base des donnees");
			}
		}

	public boolean isConnected() {
		return connected;
	}

	public void setConnected(boolean connected) {
		this.connected = connected;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
	
}
