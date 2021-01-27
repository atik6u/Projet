<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<link href="css/table.css" rel="stylesheet" id="table-css">
<meta charset="UTF-8">
<title>Student Hub</title>
</head>
<body>
<div class="container">    
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">
							<c:out value="Bienvenue ${user.getName()} à l'espace étudiant"/>
							<div class="float-right">
								<a href="logout" class="btn btn-info" >Déconnecter</a><br/>
							</div>
						</div>
                       
                        <div style="float:right; font-size: 100%; position: relative; top:-10px"><a href="#"></a></div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                        <form method="get" id="myForm">
                         <div style="margin-bottom: 25px" class="input-group">
							<a href="TakeExam">Passer un QCM</a>
							</div>
							 <div style="margin-bottom: 25px" class="input-group">
							<a href="NewExam">Ajouter QCM</a>
							</div>
						</form>
						
						<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
					         url = "jdbc:mysql://localhost/Examatic"
					         user = "root"  password = "root"/>
					         
					     <sql:query dataSource = "${snapshot}" var = "result">
					         SELECT * FROM `Student` S, `Course` C WHERE S.`level` = C.`level`AND `id_student` = ? ;
					         <sql:param value = "${user.getId()}" />
					     </sql:query>
						
						<table border = "1" class = "table" id="course_list">
							<thead>
								<tr>
								   <th  style="display:none;">ID de cours</th>
								   <th>Nom de cours</th>
								   <th>Niveau</th>
								</tr>
							<thead>
							<tbody>
							<c:forEach var = "row" items = "${result.rows}">
								<tr id="row">
								   <td style="display:none;"><c:out value = "${row.id_course}"/></td>
								   <td><c:out value = "${row.course_name}"/></td>
								   <td><c:out value = "${row.level}"/></td>
								</tr>
							</c:forEach>
							<tbody>
						</table>
					      
						<form action="TakeExam" method="post">
					    	<input type="hidden" name="id_course" id="id_course" />
					    	<input type="hidden" name="id_user" id="id_user" value="${user.getId()}" />
					    	<br/>
							<button type="submit" id="take_exam" class="btn btn-info" disabled>Passer le QCM</button>
						</form>
						
					</div>
				</div>
			</div>
	</div>
						
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
	
	<%-- <h1>Hello Student</h1>
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
    	<input type="hidden" name="id_course" id="id_course" />
    	<input type="hidden" name="id_user" id="id_user" value="${user.getId()}" />
		<button type="submit" id="take_exam" disabled>Passer le QCM</button>
	</form>
	<p>
		- Liste des cours
		- M'inscrire dans un nouveau cours
		- Notes
	</p> --%>
	
</body>


<script type="text/javascript">

	$('#myForm A').click(function(e)
	{
	   e.preventDefault();
	
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
	
	window.addEventListener('click', function(e){
		if (!document.getElementById('course_list').contains(e.target)){
			document.getElementById("take_exam").disabled = true;
			$('#course_list tr').removeClass("selected");
		}
	});
</script>


</html>