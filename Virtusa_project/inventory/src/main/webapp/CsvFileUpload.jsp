<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>

<!-- This file gives option to choose a file for upload -->

<html>
<head>
<title>File Upload</title>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="profile.css">
<style>
.container { 
  height: 200px;
  position: relative; 
}
.center {
  margin: 0;
  position: absolute;
  top: 380px;
  left: 880px;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}
.custom-file-upload {
    border: 2px solid #ccc;
    display: inline-block;
    padding: 10px 25px;
    background-color: #8B008B;
    height: 170px;
    width: 400px;
}
.image{
	vertical-align: right;
	position: fixed;
	bottom: 30px;
	right: 50px;
}
</style>

<title>File Upload</title>
</head>
<body style ="background-color: #C0C0C0">
	
	<%
		String firstname = (String)session.getAttribute("firstname");
		String lastname = (String)session.getAttribute("lastname");
		String email = (String)session.getAttribute("email");
		String phone = (String)session.getAttribute("phone");
		String fullname = firstname + " " + lastname;
		 	
	%>
	<div class="container">
		<div class="center">
			 	<form action = "./upload" method = "post" enctype = "multipart/form-data">
				<label for="file-upload" class="custom-file-upload">
					<h2 style ="color: white">Upload Daily Stock Arrival Files</h2>
					<br>
					<input align="center" type = "file" name = "file" size = "80" required/>		        
		        <br><br>
		        <input align="center" type = "submit" value = "Upload File"/>
		        </label>
		      	</form>
		      	<br><br>
		      	<form action = "./upload1" method = "post" enctype = "multipart/form-data">
				<label for="file-upload" class="custom-file-upload">
					<h2 style ="color: white">Upload Daily Sales Files</h2>
					<br>
					<input align="center" type = "file" name = "file" size = "80" required/>		        
		        <br><br>
		        <input align="center" type = "submit" value = "Upload File"/>
		        </label>
		      	</form>
		      	
		</div>
	</div>
	<div class="image">
			<img style="border-radius: 50%; width: 100px; height: 100px" src="Images/YourCartLogo.jpg" >
	</div>	
		
	<div class="navbar">
		<a href="alertgenerator">Dashboard</a>
	</div>
		
	<div class="sidebarLeft">
		<img src="Images/img_avatarF.png" >
		<label style="font-size: 30px"><br><%=fullname%></label>
		<label style="font-size: 20px"><%=email%></label>
		<label style="font-size: 20px"><%=phone %></label>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<a href="index.html">Logout</a>
	</div>
	</div>
</body>
</html>

