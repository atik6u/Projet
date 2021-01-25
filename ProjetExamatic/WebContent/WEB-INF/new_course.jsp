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
	<h1>New Course</h1>
	
	<form action="NewCourse" method="post">
		<c:choose>
			<c:when test="${user == null}">
				<c:set var="error" value="L'utilisateur est null" scope="session"></c:set>
			</c:when>
			<c:otherwise>
				<c:set var="user_id" value="${user.getId()}"></c:set>
			</c:otherwise>
		</c:choose>
		
		<input type="hidden" name="user_id" value="${user_id}"/>
	
		<label for="course_name"><b>Nom de cours:</b></label>
		<input type="text" name="course_name"><br/>
		<label for="level"><b>Niveau</b></label>
		<select name="level">
		    <option value="1A">1A</option>
		    <option value="2A">2A</option>
		    <option value="3A">3A</option>
		    <option value="4A">4A</option>
		    <option value="5A">5A</option>
		</select><br>
		
		<button type="submit">Ajouter cours</button>
	</form>
	
	<c:if test="${error != null}">
	 	<div class="alert alert-danger" role="alert">
			<c:out value="${error}"/>
		</div>
	 </c:if>
</body>
</html>