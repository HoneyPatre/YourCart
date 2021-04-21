<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Completed</title>
</head>
<body style ="background-color: #C0C0C0">
<%
	String EmployeeID = (String)request.getAttribute("employeeidC");
%>
	<form action="index.jsp">
		<h1>Registration is Completed</h1>
		<h2>Your Employee ID is<%=EmployeeID %></h2>
		<button type="submit">Login</button>
	</form>
</body>
</html>