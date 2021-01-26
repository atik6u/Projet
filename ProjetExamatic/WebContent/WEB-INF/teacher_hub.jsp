<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>Hello Teacher</h1>
	<c:out value="${user}"/>
	<c:set var="user" value="${user}" scope="page"></c:set>
	
	
	<a href="logout">Déconnecter</a><br/>
	
		<!-- 
	<dsp:a href="NewCourse">Créer un nouveau cours
		<dsp:param name="user" beanvalue="Profile.homeAddress.city"/>
	</dsp:a>
	 
	<a href="NewCourse">Créer un nouveau cours</a><br/>
	<a href="new_exam">Créer un nouveau QCM</a><br/>
	-->
	
	<p>
		- Ajouter un qcm
		- Ajouter un cours
		- Afficher les resultats d'un qcm
	</p>
	<!-- 
	<a href="NewExam">Créer un nouveau QCM</a>
	 -->
	
	
	<form method="get" id="myForm">
		<a href="NewCourse">Ajouter Cours</a>
		<a href="NewExam">Ajouter QCM</a>
	</form>
	
	
	<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/Examatic"
         user = "root"  password = "root"/>
         
     <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * FROM `Course` WHERE `id_teacher`= ? ;
         <sql:param value = "${user.getId()}" />
     </sql:query>
	
	<table border = "1">
         <tr>
            <th>ID de cours</th>
            <th>Nom de cours</th>
            <th>Niveau</th>
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.id_course}"/></td>
               <td><c:out value = "${row.course_name}"/></td>
               <td><c:out value = "${row.level}"/></td>
            </tr>
         </c:forEach>
      </table>
	
	<!-- 
	<c:forEach items="${}" var="etudiant">
	<p>
	<c:out value="Bonjour ${i}"></c:out>
	</p>
	</c:forEach>
	
	
	 -->
	
</body>
<script type="text/javascript">
	$('#myForm A').click(function(e)
	{
	   e.preventDefault(); // prevent the link from actually redirecting
	
	   var destination = $(this).attr('href');
	   $('#myForm').attr('action', destination);
	   $('#myForm').submit();
	});
</script>
</html>
