<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log in page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	<div align="center">
	 <h1> Hello.........</h1>	
	
	 <form action="login" method="post">
	 	<input type="radio" id="student" name="usertype" value="student" checked required/>
	 	<label for="huey">Étudiant</label>
	 	<input type="radio" id="teacher" name="usertype" value="teacher" required/>
	 	<label for="huey">Enseignant</label>
	 	<br/>
	 	<br/>
		 	
		 	<table style="with: 80%">
	    <tr>
	     <td><label for="uname"><b>Nom d'utilisateur</b></label></td>
	     <td><input type="text" placeholder="Entrer nom d'utilisateur" name="username" required /></td>
	    </tr>
	    <tr>
	     <td> <label for="psw"><b>Mot de passe</b></label></td>
	     <td> <input type="password" placeholder="Entrer mot de pass" name="password" required /><br></td>
	    </tr>
	    </table>
	 	<!-- <label for="uname"><b>Nom d'utilisateur</b></label>
	    <input type="text" placeholder="Entrer nom d'utilisateur" name="username" required />
	    <label for="psw"><b>Mot de passe</b></label>
	    <input type="password" placeholder="Entrer mot de pass" name="password" required /><br> -->
	
	    <button type="submit">Connexion</button>
	 </form>
	 
	 	<p>
		<c:choose>
			<c:when test="${authentification == null}">
				<!-- <h5><c:out value="Echec: authentification null"></c:out></h5> -->
		    </c:when>
		    <c:when test="${authentification.isLoggedIn()}">
		        <h5><c:out value="Welcome ${authentification.getUserType()} ${authentification.getUser().getName()} "></c:out></h5>
		        <br />
		    </c:when>
		    <c:otherwise>
		        <h5><c:out value="Echec: ${error}"></c:out></h5>
		        <br />
		    </c:otherwise>
		</c:choose>

	</p>
	<p>
	Vous n'avez pas un compte? 
	<a href="SignUp">Cliquez ici pour créer un compte.</a>
	</p>
	
	</div>
<<<<<<< HEAD
	
=======
>>>>>>> branch 'master' of https://github.com/atik6u/Projet.git
			
	<c:if test="${alert != null}">
		<div class="alert alert-success" role="alert">
			<c:out value="${alert}"/>
		</div>
	</c:if>
<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/atik6u/Projet.git
</body>
</html>