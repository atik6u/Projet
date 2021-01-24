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
	<h1>Créer un nouveau QCM</h1>
	
	<form action="" method="post">
	 	
	 	<label for="course"><b>Cours</b></label>
	 	<select name="level">
	 		<c:forEach items="${courseList}" var="etudiant">
			    <option value="">
			    	<c:out value="${course}"></c:out>
			    </option>
		    </c:forEach>
		</select><br>
	 </form>
</body>
</html>