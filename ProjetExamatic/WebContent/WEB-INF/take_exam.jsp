<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script> 
<title>Passer QCM</title>
</head>
<body>
	<h1>Passer un QCM</h1>
	
	<c:out value="id_user = ${id_user}"></c:out>
	<c:out value="id_course = ${id_course}"></c:out>
	
	<c:if test="${exam != null}">
		<form action="#" method="post">
			<c:set var="question_num" scope="session" value = "${1}"/>
			<c:forEach var = "question" items = "${exam.getQuestions()}">
				<h3><c:out value="Question n${question_num}:"/></h3>
				<c:out value="${question.getText()}"></c:out> <br/>
				<c:forEach var = "choice" items = "${question.getChoices()}">
					<input type="radio" id="choice${question_num}" name="choice${question_num}" value="choice${question_num}" required/>
				 	<label for="choice${question_num}"><c:out value="${choice.getLetter()}. ${choice.getValue()}"></c:out></label>
				</c:forEach>
				<c:set var="question_num" scope="session" value = "${question_num+1}"/>
			</c:forEach>
			<br/>
			<input type="submit">
		</form>
	</c:if>
	
</body>
</html>