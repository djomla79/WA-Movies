<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
	<title>Add Administrator Page</title>
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
	        <li><a href="${pageContext.request.contextPath}/admin">Admin page</a></li>
 	    </ul>
	    </div>
	  </div>
  </nav>
	
	<div class="container">
		<div id="header1">New Administrator Registration Page</div>
	</div>
	
    <div class="container" >
      <div class="container1">
     
      <sf:form action="${pageContext.request.contextPath}/addingadmin" method="post" modelAttribute="user">
          
          <div class="row">
          
          	  <label>Name: </label><br />
          	  <sf:input type="text" path="name" name="name" placeholder="Name" title="Please, enter admin's name." /><br />
          	  <sf:errors path="name" cssClass="error"></sf:errors><br />
	          <label>Last Name: </label><br />
	          <sf:input type="text" path="lastName" name="lastName" placeholder="Last Name" title="Please, enter admin's last name." /><br />
	          <sf:errors path="lastName" cssClass="error"></sf:errors><br />
	          <label>Username: </label><br />
	          <sf:input type="text" path="username" name="username" placeholder="Username" /><br />
	          <sf:errors path="username" cssClass="error"></sf:errors><br />
	          <label>Password: </label><br />
	          <sf:input type="password" path="password" name="password" placeholder="Password" /><br />
	          <sf:errors path="password" cssClass="error"></sf:errors><br />
	          <label>E-mail: </label><br />
	          <sf:input type="email" path="email" name="email" placeholder="E-mail" /><br />
	          <sf:errors path="email" cssClass="error"></sf:errors><br />
	          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	          
          </div><br />
          
          <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button> 
          
      </sf:form>
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