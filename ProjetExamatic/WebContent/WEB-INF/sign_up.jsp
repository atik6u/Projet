<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up page</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
<body>
<div class="container">    
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Join us</div>
                       
                        <div style="float:right; font-size: 100%; position: relative; top:-10px"><a href="#">Forgot password?</a></div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                            
                        <form action="SignUp" method="post" id="loginform" class="form-horizontal" role="form">
                            
                            <input type="radio" id="student" name="usertype" value="student" onchange="checkStudent(this);" checked>
						 	<label for="student"><b>Étudiant</b></label>
						 	<input type="radio" id="teacher" name="usertype" value="teacher"  onchange="checkStudent(this);">
						 	<label for="teacher"><b>Enseignant</b></label><br/>
						  	<br/>
						 	<br/>
                            
                            <div style="margin-bottom: 25px" class="input-group">
                            			<div align="center">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        </div>
                                        <input type="text" placeholder="Entrer votre prénom" name="first_name"  class="form-control" required><br/>
                   
                           </div>
                                
                            <div style="margin-bottom: 25px" class="input-group">
                            			<div align="center">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        </div>
                                        <input type="text" placeholder="Entrer votre nom" name="last_name" class="form-control" required><br/>
                           </div>
                           
                           <div style="margin-bottom: 25px" class="input-group">
                           				<div align="center">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                		</div>
                                        <input type="text" placeholder="Entrer nom d'utilisateur" name="username" class="form-control" required><br/>
                           </div>
                           
                           <div style="margin-bottom: 25px" class="input-group">
                           				<div align="center">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        </div>
                                        <input type="password" placeholder="Entrer mot de passe" name="password" class="form-control" required><br/>
                           </div>
                           
                           <div style="margin-bottom: 25px" class="input-group">
                           				<div align="center">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        </div>
                                        <input type="password" placeholder="Réntrer mot de passe" name="password_conf" class="form-control" required><br/>
                           </div>
                             <div style="margin-bottom: 25px" class="input-group">        
							<div id="level" style="display: block;">
									     <label for="level"><b>Niveau</b></label>
										<select name="level" onchange="yesnoCheck(this);" class="form-control form-control-lg">
										    <option value="1A">1A</option>
										    <option value="2A">2A</option>
										    <option value="3A">3A</option>
										    <option value="4A">4A</option>
										    <option value="5A">5A</option>
										</select><br>
									</div>
									</div>
                                
                            <div class="input-group">
                                      <div class="checkbox">
                                        <label>
                                          <input id="login-remember" type="checkbox" name="remember" value="1"> Remember me
                                        </label>
                                      </div>
                                    </div>


                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->

                                    <div class="col-sm-12 controls">
                                     <button type="submit" class="btn btn-primary">Créer mon compte</button>
                                     
                 

                                    </div>
                                </div>
                                </form>
                                </div>
                                </div>
                                </div>
                                </div>













<!-- 	<form action="SignUp" method="post">
	 	<input type="radio" id="student" name="usertype" value="student" onchange="checkStudent(this);" checked>
	 	<label for="student"><b>Étudiant</b></label>
	 	<input type="radio" id="teacher" name="usertype" value="teacher"  onchange="checkStudent(this);">
	 	<label for="teacher"><b>Enseignant</b></label><br/>
		
	 	<label for="first_name"><b>Prénom</b></label>
	    <input type="text" placeholder="Entrer votre prénom" name="first_name" required><br/>
	
	 	<label for="last_name"><b>Nom</b></label>
	    <input type="text" placeholder="Entrer votre nom" name="last_name" required><br/>
	
		 	
	 	<label for="username"><b>Nom d'utilisateur</b></label>
	    <input type="text" placeholder="Entrer nom d'utilisateur" name="username" required><br/>
	
	    <label for="password"><b>Mot de passe</b></label>
	    <input type="password" placeholder="Entrer mot de passe" name="password" required><br/>
		
		<label for="password_conf"><b>Confirmer le mot de passe</b></label>
	    <input type="password" placeholder="Réntrer mot de passe" name="password_conf" required><br/>
		
		<div id="level" style="display: block;">
		    <label for="level"><b>Niveau</b></label>
			<select name="level" onchange="yesnoCheck(this);">
			    <option value="1A">1A</option>
			    <option value="2A">2A</option>
			    <option value="3A">3A</option>
			    <option value="4A">4A</option>
			    <option value="5A">5A</option>
			</select><br>
		</div>
		
				
		
	    <button type="submit">Créer mon compte</button>
	 </form> -->
	 
	 <c:if test="${error != null}">
	 	<div class="alert alert-danger" role="alert">
			<c:out value="${error}"/>
		</div>
	 </c:if>
</body>

	<script type="text/javascript">
		function checkStudent(that) {
		    if (that.value == "student") {
		        document.getElementById("level").style.display = "block";
		    } else {
		        document.getElementById("level").style.display = "none";
		    }
		}
	</script>
</html>