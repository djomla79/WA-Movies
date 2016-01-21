<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/data/css/style2.css">
	<link href="${pageContext.request.contextPath}/data/bootstrap/bootstrap.min.css" rel="stylesheet">
	<!-- jQuery (necessary for Bootstrap's JavaScript plug ins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plug ins (below), or include individual files as needed -->
	<script src="${pageContext.request.contextPath}/data/bootstrap.min.js"></script>
<title>Home</title>
</head>
<body>
	
	<nav class="navbar navbar-inverse" style="border-radius: 0px;">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" style="color: #e3e3e3;" href="#">Spring Movies</a>
			</div>
		</div>
	</nav>
	
	<div class="jumbotron">
		<div class="container">
			<div id="text">Home</div>
		</div>
	</div>
	
	<div class="container">
		<div id="text">
			Menu
		</div>
	</div>
	
	<div class="container">
		<div id="log">
			<ul>
				
				<li><a href="${pageContext.request.contextPath}/signup">Sign up</a></li>
				<li><a href="${pageContext.request.contextPath}/userpage">Log in User</a></li>
				<li><a href="${pageContext.request.contextPath}/admin">Log in Admin</a></li>
				<li><a href="${pageContext.request.contextPath}/logout" >Log Out</a></li>
				
			</ul>
		</div>
	</div>

</body>
</html>