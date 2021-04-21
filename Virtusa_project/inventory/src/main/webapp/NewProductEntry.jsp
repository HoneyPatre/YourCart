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
		String firstname = (String)session.getAttribute("firstname");
		String lastname = (String)session.getAttribute("lastname");
		String email = (String)session.getAttribute("email");
		String phone = (String)session.getAttribute("phone");
		String fullname = firstname + " " + lastname;
	%>
	
	<%
		ArrayList<String> EmployeeUsername = new ArrayList<String>();
		ArrayList<String> ProductId = new ArrayList<String>();
		ArrayList<String> ProductName = new ArrayList<String>();
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","1234");
		Statement myStmt = myConn.createStatement();
		
		int EmployeeUsernameSize = EmployeeUsername.size();
		ResultSet myRs2 = myStmt.executeQuery("select * from productdetail");
		while(myRs2.next()){
			ProductName.add(myRs2.getString("ProductName"));
		}
		int ProductNameSize = ProductName.size();
		ResultSet myRs3 = myStmt.executeQuery("select * from productdetail");
		while(myRs3.next()){
			ProductId.add(myRs3.getString("ProductID"));
		}
	%>
	
	
	<form action="newentry" method="post">
	
	<div class="container">
		<div class="center">
		<div class="custom-select">
		<br>
			<h1>New Product Fill</h1>
			<br><br>
			<label>Product Name :</label>
			<input type="text" name="productnamefornewentry" id="productnamefornewentry">
			<br><br><br>
			<label>Product ID :</label>
			<input type="text" name="productidfornewentry" id="productnamefornewentry">
			<br><br><br>
			
			<button type="submit">Save</button>
		</div>
		</div>
	</div>
	</form>
	 <div class="sidebarRight">
			<a href="add" target="_blank" style="font-size: 40px">Alerts</a>
			<img src="Images/YourCartLogo.jpg" >
	</div>
		
	<div class="navbar">
		<a href="#">Barcode Generator</a>
		<a href="#">Invoice Download</a>
		<a href="#">File Upload</a>
	</div>
		
	<div class="sidebarLeft">
		<img src="Images/img_avatarF.png" >
		<label style="font-size: 30px"><br><%=fullname %></label>
		<label style="font-size: 20px"><%=email %></label>
		<label style="font-size: 20px"><%=phone %></label>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<a href="index.html">Logout</a>
	</div> 
	
		
</body>
</html>