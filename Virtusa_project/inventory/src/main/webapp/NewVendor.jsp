<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.*"%>
<%@ page import ="javax.servlet.http.HttpServlet"%>
<%@ page import ="javax.servlet.http.HttpServletRequest"%>
<%@ page import ="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>

<!-- This page takes input for new product -->

<link rel="stylesheet" type="text/css" href="profile.css">
<meta charset="ISO-8859-1">
<style>
.container { 
  height: 200px;
  position: relative;
}
.center {
  margin: 0;
  position: absolute;
  top: 250px;
  left: 400px;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}
.image{
	vertical-align: right;
	position: fixed;
	bottom: 30px;
	right: 50px;
}
</style>
<title>New Product Entry</title>
</head>
<body onload="GetAll()">
	<script>
		function GetAll(){
			GetProductName();
			GetEmployeeUsername();
			
		}
	</script>
	
	<%
		String firstname = (String)session.getAttribute("firstnameC");
		String lastname = (String)session.getAttribute("lastnameC");
		String email = (String)session.getAttribute("emailC");
		String phone = (String)session.getAttribute("phoneC");
		String fullname = firstname + " " + lastname;
	%>
	
	<form action="newvender" method="post">
	
	<div class="container">
		<div class="center">
		<div class="custom-select">
		<br>
			<h1>New Product Fill</h1>
			<br><br>
			<label>Vendor ID :</label>
			<input type="text" name="vendorid" id="vendorid">
			<br><br><br>
			<label>Vendor First Name :</label>
			<input type="text" name="vendorfname" id="vendorfname">
			<br><br><br>
			<label>Vendor Last Name :</label>
			<input type="text" name="vendorlname" id="vendorlname">
			<br><br><br>
			<label>Vendor Email ID :</label>
			<input type="text" name="vendoremail" id="vendoremail">
			<br><br><br>
			<label>Vendor Phone Number :</label>
			<input type="text" name="vendorphone" id="vendorphone">
			<br><br><br>
			<label>Vendor Address :</label>
			<input type="text" name="vendoraddress" id="vendoraddress">
			<br><br><br>
			<button type="submit">Save</button>
		</div>
		</div>
	</div>
	</form>
	 <div class="image">
			<img style="border-radius: 50%; width: 100px; height: 100px" src="Images/YourCartLogo.jpg" >
	</div>	
		
	<div class="navbar">
		<a href="DashboardForChecker.jsp">Dashboard</a>
	</div>
		
	<div class="sidebarLeft">
		<img src="Images/img_avatarM.png" >
		<label style="font-size: 30px"><br><%=fullname %></label>
		<label style="font-size: 20px"><%=email %></label>
		<label style="font-size: 20px"><%=phone %></label>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<a href="index.html">Logout</a>
	</div> 
	
		
</body>
</html>