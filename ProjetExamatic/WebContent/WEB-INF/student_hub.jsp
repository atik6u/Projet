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
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script> 
<title>Insert title here</title>
<style type="text/css">
	td, th{border: 1px #DDD solid; padding: 5px; cursor: pointer;}
	
	.selected {
	    background-color: #e8f1ff;
	}
</style>
</head>
<body>
	<h1>Hello Student</h1>
	<c:out value="${user}"/>
	
	<a href="logout">Déconnecter</a>
	
	<form method="get" id="myForm">
		<a href="TakeExam">Passer un QCM</a> 
	</form>
	
	
	
	<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/Examatic"
         user = "root"  password = "root"/>	
         
     <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * FROM `Course` C, `Student` S WHERE C.`Level` = S.`level`AND S.`id_student` = ? ;
         <sql:param value = "${user.getId()}" />
     </sql:query>
	
	
	<h2>Liste des cours</h2>
	<table id="course_list" border = "1">
         <tr>
            <th>ID de cours</th>
            <th>Nom de cours</th>
            <th>Niveau</th>
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.id_course}"/></td>
               <td><a href="#"><c:out value = "${row.course_name}"/></a></td>
               <td><c:out value = "${row.level}"/></td>
            </tr>
         </c:forEach>
      </table>
      
    <form action="TakeExam" method="post">
    	<input type="text" name="id_course" id="id_course"/>
    	<input type="text" name="id_user" id="id_user" value="${user.getId()}"/>
		<button type="submit" id="take_exam" disabled>Passer le QCM</button>
	</form>
	<p>
		- Liste des cours
		- M'inscrire dans un nouveau cours
		- Notes
	</p>
	
</body>

<script type="text/javascript">
	$('#myForm A').click(function(e)
	{
	   e.preventDefault(); // prevent the link from actually redirecting
	
	   var destination = $(this).attr('href');
	   $('#myForm').attr('action', destination);
	   $('#myForm').submit();
	});
	
	$("#course_list tr").click(function(){
		   $(this).addClass('selected').siblings().removeClass('selected');    
		   var value=$(this).find('td:first').html();
		   document.getElementById("take_exam").disabled = false;
		   document.getElementById('id_course').value = value;
		   //alert(value);    
	});

	$('.ok').on('click', function(e){
	    alert($("#course_list tr.selected td:first").html());
	});
	
</script>


</html>