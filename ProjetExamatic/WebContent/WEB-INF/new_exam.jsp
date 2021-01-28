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
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<title>Créer un nouveau QCM</title>
</head>
<body>
	<h1>Créer un nouveau QCM</h1>
		
	<c:choose>
		<c:when test="${user == null}">
			<c:set var="error" value="L'utilisateur est null" scope="page"></c:set>
		</c:when>
		<c:otherwise>
			<c:set var="user_id" value="${user.getId()}"></c:set>
			<c:remove var="error" scope="session" />
		</c:otherwise>
	</c:choose>
	
	<form action="NewExam" method="post">
	 	<input type="hidden" name="user_id" value="${user_id}"/>
	 	<input type="hidden" name="num_questions" id="num_questions" value="0"/>
	 	<!-- 
		<c:out value="${user_id}"></c:out>
		<c:out value="${user.getId()}"></c:out>
		  -->
		 
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
		
		
		<input type="button" onclick="addQuestion()" value="Ajouter question"/>
		<input type="button" value="Supprimer Question"/>
		
		<div id="questions">
			
		</div>
		
		
		
		<!-- 
		<form method="get" id="#newQuestion" action="">
		</form>
		
		 
		<p>
			<c:out value="Nombre des question ${num_questions}"></c:out>
		</p>
		
		<c:forEach var = "i" begin = "1" end = "${num_questions}">
			Item <c:out value = "${i}"/><p>
		</c:forEach>
		 -->
		 
		<button type="submit">Ajouter QCM</button>
	 </form>
	 
	 
	 <c:if test="${error}">
	 	<div class="alert alert-danger" role="alert">
			<c:out value="${error}"/>
		</div>
	 </c:if>
	 
	 
	 
</body>
<script type="text/javascript">
	let num_questions = 0;
	let choices = [];
	
	$('#newQuestion A').click(function(e)
	{
	   e.preventDefault(); // prevent the link from actually redirecting
	
	   var count = $('#newQuestion').attr('num_questions');
	   $('#newQuestion').attr('num_questions', count+1);
	   //$('#newQuestion').submit();
	});
	
	function addQuestion()
	{
		if(num_questions>99){
			return;
		}
		
		num_questions++;
		document.getElementById("num_questions").value = ''+num_questions;
		
		var element;
		
		var divQuestion = document.createElement("div");
		divQuestion.id = "question"+num_questions;
		element = document.getElementById("questions");
		element.appendChild(divQuestion);
		
		//Creation du question
		var questionTitle = document.createElement("h4");
		questionTitle.innerHTML = "Q" + num_questions + ".";
		divQuestion.appendChild(questionTitle);
		
		var enonce = document.createElement("textarea");
		enonce.placeholder = "Remplir l'énoncé";
		enonce.name = "text" + num_questions;
		enonce.required = true;
		divQuestion.appendChild(enonce);
		
		//var jump = document.createElement("br/");
		//element = document.getElementById("questions");
		//element.appendChild(jump);
		
		//Creation de la reponse
		var answer = document.createElement("input");
		answer.id = "answer"+num_questions;
		answer.placeholder = "Réponse: Tappez A, B, C ou D";
		answer.name = "answer" + num_questions;
		answer.required = true;
		divQuestion.appendChild(answer);
		
		
		//Creation du boutton d'ajout des choix
		choices.push(0);
		var divChoice = document.createElement("div");
		divChoice.id = "divChoice" + num_questions;
		divQuestion.appendChild(divChoice);
		
		var numChoice = document.createElement("input");
		numChoice.type = "hidden";
		numChoice.id = "numChoice" + num_questions;
		numChoice.name = "numChoice" + num_questions;
		numChoice.value = choices[num_questions-1];
		numChoice.required = true;
		divChoice.appendChild(numChoice);
		
		var addChoiceBtn = document.createElement("input");
		addChoiceBtn.type = "button";
		addChoiceBtn.id = "addChoiceBtn" + num_questions;
		addChoiceBtn.value = "Ajouter Choix";
		
		addChoiceBtn.addEventListener  ("click", function() {
			
			var num_question = parseInt(this.parentElement.id.replace('question',''));
			
			divChoice = document.getElementById("divChoice" + num_question);
			
			if(choices[num_question-1] < 4) {
				var divQuestion = document.getElementById("question"+num_question);
				
				var choiceLetter = document.createElement("label");
				letter = String.fromCharCode(65 + choices[num_question-1]);
				choiceLetter.innerHTML = letter + ".";
				divChoice.appendChild(choiceLetter);
				
				var choice = document.createElement("input");
				choice.type = "text";
				choice.placeholder = "Choix " + letter;
				choice.name = "choice" + letter + num_question;
				choice.required = true;
				divChoice.appendChild(choice);
				
				choices[num_question-1] += 1;
				document.getElementById("numChoice" + num_question).value = choices[num_question-1];
			}
		});
		divQuestion.appendChild(addChoiceBtn);
		
	}

</script>
</html>