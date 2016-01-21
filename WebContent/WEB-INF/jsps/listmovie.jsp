<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<title>List a movie</title>
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
	        <li><a href="${pageContext.request.contextPath}/userpage">User Page</a></li>
 	    </ul>
	    </div>
	  </div>
  </nav>>
	
    <div class="jumbotron">
		<div class="container">
			
			<div id="text">
				Movie
			</div>
		</div>
	</div>
	
	<div class="container">
	
		<div id="header1">Movie's data:</div>
   
	<table class="table table-striped">
	    <thead>
	      <tr>
	          <th> Name </th>
	          <th> Year </th> 
	          <th> Genre </th>
	          <th> Director </th>
	          <th> Runtime </th>
	      </tr>
        </thead>
    
    <tbody>
           <c:forEach var="row" items="${movie}">
           <tr> 
                <td><c:out value="${row.name}" /></td>
                <td><c:out value="${row.year}" /></td>
                <td><c:out value="${row.genre}" /></td>
                <td><c:out value="${row.director}" /></td>
                <td><c:out value="${row.runtime}" /></td>
           </tr>
           </c:forEach>
	</tbody>
	
    <tfoot>
     <tr>
       <td colspan="5" style="text-align: center;">The end</td>
     </tr>
    </tfoot>
    
   </table>
   </div>
   
</body>
</html>