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
	<title>Add a movie</title>
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
		<div id="header1">Add a movie</div>
	</div>
	
    <div class="container" >
      <div class="container1">
     
      <sf:form action="${pageContext.request.contextPath}/addingmovie" method="post" modelAttribute="movie">
          
          <div class="row">

					<label>Name: </label><br/>
					<sf:input type="text" path="name" name="name" placeholder="Name" title="Please, enter a name of the movie." />
					<br/><sf:errors path="name" cssClass="error"></sf:errors>
					<br/> <label>Year: </label><br/>
					<sf:input type="text" path="year" name="year" placeholder="Year" />
					<br/><sf:errors path="year" cssClass="error"></sf:errors>
					<br/><label>Genre: </label><br/>
					<sf:input type="text" path="genre" name="genre" placeholder="Genre" />
					<br/><sf:errors path="genre" cssClass="error"></sf:errors>
					<br/><label>Director: </label><br/>
					<sf:input type="text" path="director" name="director" placeholder="Director" />
					<br/><sf:errors path="director" cssClass="error"></sf:errors>
					<br/><label>Runtime: </label><br/>
					<sf:input type="text" path="runtime" name="runtime" placeholder="Runtime" />
					<br/><sf:errors path="runtime" cssClass="error"></sf:errors><br/>
					
					<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
					
		  </div>
          
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