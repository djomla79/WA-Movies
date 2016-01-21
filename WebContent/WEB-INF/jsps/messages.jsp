<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/data/css/style1.css">
<link
	href="${pageContext.request.contextPath}/data/bootstrap/bootstrap.min.css"
	rel="stylesheet">
<!-- jQuery (necessary for Bootstrap's JavaScript plug ins) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plug ins (below), or include individual files as needed -->
<script src="${pageContext.request.contextPath}/data/bootstrap.min.js"></script>
<title>Messages</title>
</head>
<body>

	<nav class="navbar navbar-inverse" style="border-radius: 0px;">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" style="color: #e3e3e3;" href="#">Movies</a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li><a href="${pageContext.request.contextPath}/">Home Page</a></li>
					<li><a href="${pageContext.request.contextPath}/admin">Admin Page</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<div id="header1">
		<div id="messageError">
			<c:out value="${messageError}" />
		</div>
		<div id="messageOk">
			<c:out value="${messageOk}" />
		</div>
		</div>
	</div>

</body>
</html>