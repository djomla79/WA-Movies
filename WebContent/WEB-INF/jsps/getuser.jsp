<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/data/css/style1.css">
	<link href="${pageContext.request.contextPath}/data/bootstrap/bootstrap.min.css" rel="stylesheet">
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="${pageContext.request.contextPath}/data/bootstrap.min.js"></script>
<title>Get User by username</title>
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
 	    </ul>
	    </div>
	  </div>
  </nav>
  <div class="header">
     <h1>Search by username.</h1>
  </div>
  
    <div class="well">Enter a user's username </div>
     
    <div class="container" >
      <div class="container1">
     
      <form action="${pageContext.request.contextPath}/gettinguser" method="post">
          
          <div class="row">
          
          	 <label>Username: </label><br />
          	 <input type="text" name="username" placeholder="Username" title="Please, enter user's username." /><br />
          	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          	 
          </div><br />
          
          <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button> 
          
      </form>
      </div>
      <div id="messageError">
        <c:out value="${messageError}" />
      </div>
      <div id="messageOk">
        <c:out value="${messageOk}" />
      </div>
    </div>
</body>
</html>