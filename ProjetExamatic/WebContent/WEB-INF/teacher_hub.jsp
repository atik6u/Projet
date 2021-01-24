<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <%@ taglib uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_0" prefix="dsp"%> -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
	<dsp:a href="NewCourse">Créer un nouveau cours
		<dsp:param name="user" beanvalue="Profile.homeAddress.city"/>
	</dsp:a>
	 -->
	<h1>Hello Teacher</h1>
	<c:out value="${user}"/>
	<c:set var="user" value="${user}" scope="session"></c:set>
	
	
	<a href="logout">Déconnecter</a><br/>
	<a href="NewCourse">Créer un nouveau cours</a><br/>
	<a href="new_exam">Créer un nouveau QCM</a><br/>
	
	<p>
		- Ajouter un qcm
		- Ajouter un cours
		- Afficher les resultats d'un qcm
	</p>
	<a href="NewExam">Créer un nouveau QCM</a>
	
	
	<!-- 
	<c:forEach items="${}" var="etudiant">
	<p>
	<c:out value="Bonjour ${i}"></c:out>
	</p>
	</c:forEach>
	 -->
	
</body>
</html>