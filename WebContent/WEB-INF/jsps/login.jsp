<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/data/css/style1.css">
	<link href="${pageContext.request.contextPath}/data/bootstrap/bootstrap.min.css" rel="stylesheet">
	<!-- jQuery (necessary for Bootstrap's JavaScript plug ins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plug ins (below), or include individual files as needed -->
	<script src="${pageContext.request.contextPath}/data/bootstrap.min.js"></script>
	<title>Login Page</title>
</head>
<body onload='document.loginForm.username.focus();'>

	<nav class="navbar navbar-inverse" style="border-radius: 0px;">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" style="color: #e3e3e3;" href="#">Movie Users</a>
	    </div>
	    <div>
	      <ul class="nav navbar-nav">
	        <li><a href="${pageContext.request.contextPath}/">Home Page</a></li>
 	    </ul>
	    </div>
	  </div>
  </nav>
	
	<div class="container">
		<div id="header1">User log-in</div>
	</div>
	
	<div class="row">
         <div class="well"><h2>Enter your username and password</h2>
         </div>
     </div>
	
    <div class="container" >
      <div class="container1">
      		
			<form name='loginForm' action='${pageContext.request.contextPath}/login' method='post'>

				<div class="row">

					Username: <br /> <input type="text" name="username" placeholder="Username" value=""><br />
					Password: <br /> <input type="password" name="password" placeholder="Password"><br />
					Remember Me: <input type="checkbox" name="remember-me" />
					
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					
				</div>
				
				<br/><button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button> 
				 
			</form>

		</div>
	</div>
	
</body>
</html>