<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New course</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
<div class="container">    
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Nouveau cours</div>
                       
                        <div style="float:right; font-size: 100%; position: relative; top:-10px"><a href="#"></a></div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
	
	
	<form action="NewCourse" method="post">
		<c:choose>
			<c:when test="${user == null}">
				<%-- <c:set var="error" value="L'utilisateur est null" scope="session"></c:set> --%>
			</c:when>
			<c:otherwise>
				<c:set var="user_id" value="${user.getId()}"></c:set>
			</c:otherwise>
		</c:choose>
		 <div style="margin-bottom: 25px" class="input-group">
         <input type="hidden" name="user_id" value="${user_id}" class="form-control" />
          
          </div>
		
		<div style="margin-bottom: 25px" class="input-group">
		<label for="course_name"><b>Nom de cours:</b></label>
		<input type="text" name="course_name"><br/>
		<label for="level"><b>Niveau</b></label>
		<select name="level" class="form-control form-control-lg">
		    <option value="1A">1A</option>
		    <option value="2A">2A</option>
		    <option value="3A">3A</option>
		    <option value="4A">4A</option>
		    <option value="5A">5A</option>
		</select><br>
		</div>
		<div class="col-sm-12 controls">
		<button type="submit" class="btn btn-primary">Ajouter cours</button>
		</div>
	</form>
	</div>
	</div>
	</div>
	</div>

	<%-- 
	<c:if test="${error != null}">
	 	<div class="alert alert-danger" role="alert">
			<c:out value="${error}"/>
		</div>
	 </c:if> --%>
</body>
</html>