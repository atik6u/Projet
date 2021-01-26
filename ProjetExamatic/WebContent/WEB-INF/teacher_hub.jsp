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
<title>Teacher hub</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>



<div class="container">    
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Hello teacher
						<c:out value="${user}"/>
						<c:set var="user" value="${user}" scope="page"></c:set>
						<a href="logout">Déconnecter</a><br/>
						</div>
                       
                        <div style="float:right; font-size: 100%; position: relative; top:-10px"><a href="#"></a></div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                        <p>
								- Ajouter un qcm
								- Ajouter un cours
								- Afficher les resultats d'un qcm
							</p>
                        <form method="get" id="myForm">
                         <div style="margin-bottom: 25px" class="input-group">
							<a  href="NewCourse">Ajouter Cours</a>
							</div>
							 <div style="margin-bottom: 25px" class="input-group">
							<a href="NewExam">Ajouter QCM</a>
							</div>
							 <div style="margin-bottom: 25px" class="input-group">
							 <a href="NewExam">Ajouter QCM</a>
							 </div>
						</form>
						<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/Examatic"
         user = "root"  password = "root"/>
         
     <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * FROM `Course` WHERE `id_teacher`= ? ;
         <sql:param value = "${user.getId()}" />
     </sql:query>
	
	<table border = "1"  class = "table-bordered">
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
						</div>
						</div>
						
						
						
						</div>
						</div>
					











<%-- 
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
	
	
	 --> --%>
	
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
