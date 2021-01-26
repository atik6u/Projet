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
	<h1>Créer un nouveau QCM</h1>
		
	<c:choose>
		<c:when test="${user == null}">
			<c:set var="error" value="L'utilisateur est null" scope="session"></c:set>
		</c:when>
		<c:otherwise>
			<c:set var="user_id" value="${user.getId()}"></c:set>
		</c:otherwise>
	</c:choose>
	
	<form action="NewExam" method="post">
	 	<input type="hidden" name="user_id" value="${user_id}"/>
		<c:out value="${user_id}"></c:out>
		<c:out value="${user.getId()}"></c:out>
		
		<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
	         url = "jdbc:mysql://localhost/Examatic"
	         user = "root"  password = "root"/>
	         
	     <sql:query dataSource = "${snapshot}" var = "result">
	         SELECT * FROM `Course` WHERE `id_teacher`= ? ;
	         <sql:param value = "${user.getId()}" />
	     </sql:query>
		
	 	<label for="course"><b>Cours</b></label>
	 	<select name="course">
	 		<c:forEach items="${result.rows}" var="course">
			    <option value="${course.id_course}">
			    	<c:out value="${course.course_name} (${course.level})"></c:out>
			    </option>
		    </c:forEach>
		</select><br>
		
		<form method="get" id="#newQuestion" >
			<input type="text" id="num_questions" name="num_questions" value="0"/>
			<input type="button" onclick="incrementValue()" value="Ajouter question"/>
			<input type="submit" value="add Question"/>
		</form>
		
		<p>
			<c:out value="Nombre des question ${num_questions}"></c:out>
		</p>
		
		<c:forEach var = "i" begin = "1" end = "${num_questions}">
         Item <c:out value = "${i}"/><p>
      </c:forEach>
		
		<button type="submit">Ajouter QCM</button>
	 </form>
	 
	 
	 <c:if test="${error != null}">
	 	<div class="alert alert-danger" role="alert">
			<c:out value="${error}"/>
		</div>
	 </c:if>
	 
	 
	 
</body>
<script type="text/javascript">
	
	$('#newQuestion A').click(function(e)
	{
	   e.preventDefault(); // prevent the link from actually redirecting
	
	   var count = $('#newQuestion').attr('num_questions');
	   $('#newQuestion').attr('num_questions', count+1);
	   //$('#newQuestion').submit();
	});
	
	/*	function incrementValue()
	{
	    var value = parseInt(document.getElementById('num_questions').value, 10);
	    value = isNaN(value) ? 0 : value;
	    value++;
	    document.getElementById('num_questions').value = value;
	}
	*/
</script>
</html>