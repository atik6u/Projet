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
	<form action="SignUp" method="post">
	 	<input type="radio" id="student" name="usertype" value="student" onchange="checkStudent(this);" checked>
	 	<label for="student"><b>Étudiant</b></label>
	 	<input type="radio" id="teacher" name="usertype" value="teacher"  onchange="checkStudent(this);">
	 	<label for="teacher"><b>Enseignant</b></label><br/>
		
	 	<label for="first_name"><b>Prénom</b></label>
	    <input type="text" placeholder="Entrer votre prénom" name="first_name" required><br/>
	
	 	<label for="last_name"><b>Nom</b></label>
	    <input type="text" placeholder="Entrer votre nom" name="last_name" required><br/>
	
		 	
	 	<label for="username"><b>Nom d'utilisateur</b></label>
	    <input type="text" placeholder="Entrer nom d'utilisateur" name="username" required><br/>
	
	    <label for="password"><b>Mot de passe</b></label>
	    <input type="password" placeholder="Entrer mot de passe" name="password" required><br/>
		
		<label for="password_conf"><b>Confirmer le mot de passe</b></label>
	    <input type="password" placeholder="Réntrer mot de passe" name="password_conf" required><br/>
		
		<div id="level" style="display: block;">
		    <label for="level"><b>Niveau</b></label>
			<select name="level" onchange="yesnoCheck(this);">
			    <option value="1A">1A</option>
			    <option value="2A">2A</option>
			    <option value="3A">3A</option>
			    <option value="4A">4A</option>
			    <option value="5A">5A</option>
			</select><br>
		</div>
		
				
		
	    <button type="submit">Créer mon compte</button>
	 </form>
	 
	 <c:if test="${error != null}">
	 	<div class="alert alert-danger" role="alert">
			<c:out value="${error}"/>
		</div>
	 </c:if>
</body>

	<script type="text/javascript">
		function checkStudent(that) {
		    if (that.value == "student") {
		        document.getElementById("level").style.display = "block";
		    } else {
		        document.getElementById("level").style.display = "none";
		    }
		}
	</script>
</html>