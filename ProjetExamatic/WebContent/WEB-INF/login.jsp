<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 Hello.........	
	 <form action="login" method="post">
	 	<label for="uname"><b>Nom d'utilisateur</b></label>
	    <input type="text" placeholder="Entrer nom d'utilisateur" name="username" required>
	
	    <label for="psw"><b>Mot de passe</b></label>
	    <input type="password" placeholder="Entrer mot de pass" name="password" required>
	
	    <button type="submit">Connexion</button>
	 </form>
	 
	 	<p>
		<c:choose>
		    <c:when test="${authentification.isConnected()}">
		        <h5>Vous etes connecte</h5>
		        <br />
		    </c:when>    
		    <c:otherwise>
		        <h5>Echec Connexion...</h5>
		        <br />
		    </c:otherwise>
		</c:choose>
	</p>
</body>
</html>