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

public class DBConnection implements Serializable{
	protected Connection connection;
	
	public Connection getConnection() {
		return connection;
	}

	public void setConnection(Connection connection) {
		this.connection = connection;
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

}
