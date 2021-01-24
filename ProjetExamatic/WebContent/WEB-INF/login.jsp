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
	<div align="center">
	 Hello.........	
	 <form action="login" method="post">
	 	<input type="radio" id="student" name="usertype" value="student" checked required/>
	 	<label for="student">Étudiant</label>
	 	<input type="radio" id="teacher" name="usertype" value="teacher" required/>
	 	<label for="teacher">Enseignant</label>
	 	<br/>
	 	<label for="username"><b>Nom d'utilisateur</b></label>
	    <input type="text" placeholder="Entrer nom d'utilisateur" name="username" required />
	    <label for="password"><b>Mot de passe</b></label>
	    <input type="password" placeholder="Entrer mot de passe" name="password" required /><br>
	
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
			
	<c:if test="${alert != null}">
		<div class="alert alert-success" role="alert">
			<c:out value="${alert}"/>
		</div>
	</c:if>

</body>
</html>