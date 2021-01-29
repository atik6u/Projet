<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log in page</title>
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
                        <div class="panel-title">Connectez-vous à l'espaces d'étudiant / enseignant</div>
                       
                        <div style="float:right; font-size: 100%; position: relative; top:-10px"><a href="#">mot de passe oublié?</a></div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                            
                        <form action="login" method="post" id="loginform" class="form-horizontal" role="form">
                            
                            <input type="radio" id="student" name="usertype" value="student" checked required/>
						 	<label for="usertype">Étudiant</label>
						 	<input type="radio" id="teacher" name="usertype" value="teacher" required/>
						 	<label for="usertype">Enseignant</label>
						  	<br/>
						 	<br/>
                            
                            <div style="margin-bottom: 25px" class="input-group">
                            			<div align="center">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                  						 </div>
                                        <input id="login-username" type="text" class="form-control" name="username" value="" placeholder="nom d'utilisatuer">                                        
                                    </div>
                                
                            <div style="margin-bottom: 25px" class="input-group">
                            			<div align="center">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        </div>
                                        <input type="password" placeholder="Entrer mot de pass" name="password" class="form-control" required >
                                    </div>
                                    

                                
                            <div class="input-group">
                                      <div class="checkbox">
                                        <label>
                                          <input id="login-remember" type="checkbox" name="remember" value="1"> Se souvenir de moi
                                        </label>
                                      </div>
                                    </div>


                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->

                                    <div class="col-sm-12 controls">
                                      <button type="submit" class="btn btn-primary">Connecter</button>
                 

                                    </div>
                                </div>


                                <!-- <div class="form-group">
                                    <div class="col-md-12 control">
                                        <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" >
                                            Don't have an account! 
                                        <a href="#" onClick="$('#loginbox').hide(); $('#signupbox').show()">
                                            Sign Up Here
                                        </a>
                                        </div>
                                    </div>
                                </div>    
                            </form>     



                        </div>                     
                    </div>  
        </div>
        <div id="signupbox" style="display:none; margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="panel-title">Sign Up</div>
                            <div style="float:right; font-size: 85%; position: relative; top:-10px"><a id="signinlink" href="#" onclick="$('#signupbox').hide(); $('#loginbox').show()">Sign In</a></div>
                        </div>  
                        <div class="panel-body" >
                            <form id="signupform" class="form-horizontal" role="form">
                                
                                <div id="signupalert" style="display:none" class="alert alert-danger">
                                    <p>Error:</p>
                                    <span></span>
                                </div>
                                    
                                
                                  
                                <div class="form-group">
                            
                                    <label for="email" class="col-md-3 control-label"></label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" placeholder="Entrer nom d'utilisateur" name="username" required>
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label for="firstname" class="col-md-3 control-label">First Name</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="firstname" placeholder="First Name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="lastname" class="col-md-3 control-label">Last Name</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="lastname" placeholder="Last Name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-md-3 control-label">Password</label>
                                    <div class="col-md-9">
                                        <input type="password" class="form-control" name="passwd" placeholder="Password">
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label for="icode" class="col-md-3 control-label">Invitation Code</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="icode" placeholder="">
                                    </div>
                                </div>

                                <div class="form-group">
                                    Button                                        
                                    <div class="col-md-offset-3 col-md-9">
                                        <button id="btn-signup" type="button" class="btn btn-info"><i class="icon-hand-right"></i> &nbsp Sign Up</button>
                                        <span style="margin-left:8px;">or</span>  
                                    </div>
                                </div>
                                
                                <div style="border-top: 1px solid #999; padding-top:20px"  class="form-group">
                                    
                                    <div class="col-md-offset-3 col-md-9">
                                        <button id="btn-fbsignup" type="button" class="btn btn-primary"><i class="icon-facebook"></i>   Sign Up with Facebook</button>
                                    </div>                                           
                                        
                                </div>-->
                                
                                
                                
                            </form>
			      <p>
					<c:choose>
						<c:when test="${authentification == null}">
							<!-- <h5><c:out value="Echec: authentification null"></c:out></h5> -->
					    </c:when>
					    <c:when test="${authentification.isLoggedIn()}">
					        <h5><c:out value="Welcome ${authentification.getUserType()} ${authentification.getUser().getName()} "></c:out></h5>
					        <br />
					    </c:when>
					    <c:otherwise>
					        <h5><c:out value="Echec: ${error}"></c:out></h5>
					        <br />
					    </c:otherwise>
					</c:choose>
			
				</p>
				<p>
				Vous n'avez pas un compte? 
				<a href="SignUp">Cliquez ici pour créer un compte.</a>
				</p>
			
			
				<c:if test="${alert != null}">
					<div class="alert alert-success" role="alert">
						<c:out value="${alert}"/>
					</div>
				</c:if>
				
                         </div>
                    </div>
					<a class="nav-link js-scroll-trigger" href="index.html"> Home</a>
               
               
                
         </div> 
    </div> 
    

 <%-- <div align="center">

<h1> Hello.........</h1>	

	 <form action="login" method="post">
	  	
	 	<input type="radio" id="student" name="usertype" value="student" checked required/>
	 	<label for="huey">Étudiant</label>
	 	<input type="radio" id="teacher" name="usertype" value="teacher" required/>
	 	<label for="huey">Enseignant</label>
	  	<br/>
	 	<br/>
		 	
		<table style="with: 80%">
	    <tr>

	     <td><label for="uname"><b>Nom d'utilisateur</b></label></td>
	     <td><input type="text" placeholder="Entrer nom d'utilisateur" name="username" required /></td> 
	    </tr>
	    <tr>
	     <td> <label for="psw"><b>Mot de passe</b></label></td>
	     <td> <input type="password" placeholder="Entrer mot de pass" name="password" required /><br></td>
	    </tr>
	    </table>
	 	<!-- <label for="uname"><b>Nom d'utilisateur</b></label>
	    <input type="text" placeholder="Entrer nom d'utilisateur" name="username" required />
	    <label for="psw"><b>Mot de passe</b></label>
	    <input type="password" placeholder="Entrer mot de pass" name="password" required /><br> -->
	
	    <button type="submit">Connexion</button>
	 </form>
	 
	 	<p>
		<c:choose>
			<c:when test="${authentification == null}">
				<!-- <h5><c:out value="Echec: authentification null"></c:out></h5> -->
		    </c:when>
		    <c:when test="${authentification.isLoggedIn()}">
		        <h5><c:out value="Welcome ${authentification.getUserType()} ${authentification.getUser().getName()} "></c:out></h5>
		        <br />
		    </c:when>
		    <c:otherwise>
		        <h5><c:out value="Echec: ${error}"></c:out></h5>
		        <br />
		    </c:otherwise>
		</c:choose>

	</p>
	<p>
	Vous n'avez pas un compte? 
	<a href="SignUp">Cliquez ici pour créer un compte.</a>
	</p>
	</div>


	<c:if test="${alert != null}">
		<div class="alert alert-success" role="alert">
			<c:out value="${alert}"/>
		</div>
	</c:if> --%>
	

</body>
</html>