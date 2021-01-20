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
	<h1>Hello Student</h1>
	<c:out value="${user}"/>
	
	<a href="logout">Déconnecter</a>
	
	<p>
		- Liste des cours
		- M'inscrire dans un nouveau cours
		- Notes
	</p>
	
</body>
</html>