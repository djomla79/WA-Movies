<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/data/css/style1.css">
	<link href="${pageContext.request.contextPath}/data/bootstrap/bootstrap.min.css" rel="stylesheet">
	<!-- jQuery (necessary for Bootstrap's JavaScript plug ins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plug ins (below), or include individual files as needed -->
	<script src="${pageContext.request.contextPath}/data/bootstrap.min.js"></script>
	<title>Administrator Page</title>
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
	        <li><a href="${pageContext.request.contextPath}/logout" >Log Out</a></li>
 	    </ul>
	    </div>
	  </div>
  </nav>
    
	<div class="container">
		 <div class="well">
		 	<h2>Welcome</h2>
		 </div>
		<div id="header2">
			<div id="text" style="font-size: 30px"><b>Administrator</b></div>
		</div>
	</div>
	
	<div class="container">
		<div id="text">
			Administrator's Menu
		</div>
	</div>
	
	<div class="container">
		<div id="log">
			<ul>
				
				<li><a href="${pageContext.request.contextPath}/addmovie">Add a new movie</a></li>
				<li><a href="${pageContext.request.contextPath}/deletemovie">Delete a movie</a></li>
				<li><a href="${pageContext.request.contextPath}/updatemovie1">Update a movie</a></li>
				<li><a href="${pageContext.request.contextPath}/getmovie">Find a movie</a></li>
				<li><a href="${pageContext.request.contextPath}/getmovies">List of all movies</a></li>
				<li>___________________________________________________________________________________________________________________________________</li>
				<li><a href="${pageContext.request.contextPath}/signup">Add a new user</a></li>
				<li><a href="${pageContext.request.contextPath}/deleteuser">Delete a user</a></li>
				<li><a href="${pageContext.request.contextPath}/updateuser1">Update a user</a></li>
				<li><a href="${pageContext.request.contextPath}/getuser">Find a user</a></li>
				<li><a href="${pageContext.request.contextPath}/getusers">List of all users</a></li>
				<li><a href="${pageContext.request.contextPath}/addadmin">Add a new administrator</a></li>
				
			</ul>
		</div>
	</div>
	 
</body>
</html>