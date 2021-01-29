<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<title>Passer QCM</title>
</head>
<body>
	<!-- 	
	<c:out value="id_user = ${id_user}"></c:out>
	<c:out value="id_course = ${id_course}"></c:out>
	  -->
	 
	<div class="container">    
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Passer un QCM</div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
	
	
							<c:if test="${exam != null}">
								<form action="StudentHub" method="post" class="form-horizontal">
									<c:set var="question_num" scope="page" value = "${0}"/>
									<c:forEach var = "question" items = "${exam.getQuestions()}">
									
										<c:set var="choice_num" scope="page" value = "${0}"/>
										<c:set var="question_num" scope="page" value = "${question_num+1}"/>
										
										<div style="margin-bottom: 25px" class="input-group">
										
											<h3><c:out value="Question n${question_num}:"/></h3>
											<c:out value="${question.getText()}"></c:out> <br/>
											
											<c:forEach var = "choice" items = "${question.getChoices()}">
												
												<input type="radio" id="choice${question_num}" name="choice${question_num}" value="${choice_num+65}" required/>
											 	<label for="choice${question_num}" style="margin-right:25px"><c:out value="${choice.getLetter()}. ${choice.getValue()}"></c:out></label>
												<c:set var="choice_num" scope="page" value = "${choice_num+1}"/>
												
											</c:forEach>
											
										</div>
										
									</c:forEach>
									<br/>
									
									<input type="hidden" name="id_exam" id="id_exam" value="${exam.getId_exam()}"/>
									<input type="hidden" name="question_num" id="question_num" value="${question_num}"/>
					    			<input type="hidden" name="id_course" id="id_course" value="${id_course}"/>
					    			<input type="hidden" name="id_user" id="id_user" value="${user.getId()}" />
									<input type="submit" value="Soumettre QCM" class="btn btn-primary">
								</form>
							</c:if>
						</div>
					</div>
				</div>
			</div>
</body>
</html>