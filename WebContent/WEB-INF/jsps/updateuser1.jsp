<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/data/css/style1.css">
	<link href="${pageContext.request.contextPath}/data/bootstrap/bootstrap.min.css" rel="stylesheet">
	<!-- jQuery (necessary for Bootstrap's JavaScript plug ins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plug ins (below), or include individual files as needed -->
	<script src="${pageContext.request.contextPath}/data/bootstrap.min.js"></script>
	<title>Update User by username</title>
</head>
<body>
	
	<nav class="navbar navbar-inverse" style="border-radius: 0px;">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" style="color: #e3e3e3;" href="#">Movie Users</a>
	    </div>
	    <div>
	      <ul class="nav navbar-nav">
	        <li><a href="${pageContext.request.contextPath}/">Home Page</a></li>
	        <li><a href="${pageContext.request.contextPath}/admin">Admin page</a></li>
 	    </ul>
	    </div>
	  </div>
  </nav>
	
	<div class="container" >
     <div id="header">
     <h1>Update User</h1>
  </div>
  </div>
    <div class="container" >
      <div class="container1">
     
      <form action="${pageContext.request.contextPath}/updatinguser1" method="post">
      
          <div class="row">Enter user's username<br />
          <input type="text" name="username" placeholder="Username"></div><br />
          <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
          
          <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button> 
          
      </form>
      </div>
    </div>
     
</body>
</html>