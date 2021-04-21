<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
</head>
<body>

</body>
</html>


<!-- This file is profile + dashboard page for Checker-->

<html>
<head>
<style>
.container { 
  height: 200px;
  position: relative; 
}
.center1 {
  margin: 0;
  position: absolute;
  top: 350px;
  left: 500px;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}
.center2 {
  margin: 0;
  position: absolute;
  top: 350px;
  left: 800px;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}
.center3 {
  margin: 0;
  position: absolute;
  top: 350px;
  left: 1100px;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}

.button {
  background-color: #BA55D3;
  border: 1px solid purple;
  color: white;
  padding: 1px 2px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  width: 200px;
  height: 60px;
}

/* The popup form - hidden by default */
.form-popup {
  display: none;
  position: fixed;
  bottom: 200px;
  right: 650px;
  border: 3px solid #f1f1f1;
  z-index: 9;
}

/* Add styles to the form container */
.form-container {
  text-align: center;
  max-width: 300px;
  height: 170px;
  width: 250px;
  padding: 20px;
  background-color: black;
  opacity : 0.8;
}


/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
  opacity: 1;
}
.image{
	vertical-align: right;
	position: fixed;
	bottom: 30px;
	right: 50px;
}

</style>
<link rel="stylesheet" type="text/css" href="DashboardForChecker.css">
<meta charset="ISO-8859-1">
<title>Dashboard</title>
</head>
<body style ="background-color: #C0C0C0">
	
	<%
		String firstname = (String)session.getAttribute("firstnameC");
		String lastname = (String)session.getAttribute("lastnameC");
		String email = (String)session.getAttribute("emailC");
		String phone = (String)session.getAttribute("phoneC");
		String fullname = firstname + " " + lastname; 	
	%>
	
	<div class="form-popup" id="myForm">
		  	<form action="VerifyDailySale.jsp" method="post" class="form-container">
		    <h2 style="color: white">Choose Date</h2>
		    <br>
			<input name="dateofsaleverify" type="date" id="theDateforsaleverify">
			<script type="text/javascript">
				var date = new Date();
				var day = date.getDate();
				var month = date.getMonth() + 1;
				var year = date.getFullYear();
				if (month < 10) month = "0" + month;
				if (day < 10) day = "0" + day;
				var today = year + "-" + month + "-" + day;
				document.getElementById('theDateforsaleverify').value = today;
			</script>
			<br><br>
		    <button type="submit" class="btn" onclick="OldClicked() =>{RequestDispatcher rd = request.getRequestDispatcher('ViewDailySale.jsp'); rd.forward(request,response)}">Select</button>
		    <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
		  	</form>
		</div>
		
		<div class="form-popup" id="myForm1">
		  	<form action="VerifyDailyStock.jsp" method="post" class="form-container">
		    <h2 style="color: white">Choose Date</h2>
		    <br>
			<input name="dateofarrivalverify" type="date" id="theDateforarrivalverify">
			<script type="text/javascript">
				var date = new Date();
				var day = date.getDate();
				var month = date.getMonth() + 1;
				var year = date.getFullYear();
				if (month < 10) month = "0" + month;
				if (day < 10) day = "0" + day;
				var today = year + "-" + month + "-" + day;
				document.getElementById('theDateforarrivalverify').value = today;
			</script>
			<br><br>
		    <button type="submit" class="btn" onclick="OldClicked() =>{RequestDispatcher rd = request.getRequestDispatcher('ViewDailyStockFill.jsp'); rd.forward(request,response)}">Select</button>
		    <button type="button" class="btn cancel" onclick="closeForm1()">Close</button>
		  	</form>
		</div>	
		
	
	<div class="container">
		<div class="center1">
			<form action="ViewVendorDetails.jsp" method="post">
				<button class="button" onclick="OldClicked() =>{RequestDispatcher rd = request.getRequestDispatcher('ViewVendorDetails.jsp'); rd.forward(request,response)}">View Vendor Details</button><br><br>
			</form>

			<form action="ViewDistributorDetails.jsp" method="post">
				<button class="button" onclick="OldClicked() =>{RequestDispatcher rd = request.getRequestDispatcher('ViewDistributorDetails.jsp'); rd.forward(request,response)}">View Distributor Details</button><br><br>
			</form>

			<form action="ViewEmployeeDetails.jsp" method="post">
				<button class="button" onclick="OldClicked() =>{RequestDispatcher rd = request.getRequestDispatcher('ViewEmployeeDetails.jsp'); rd.forward(request,response)}">View Employee Details</button>
			</form>

		</div>
		
		<div class="center2">
			
				<button class="button" onclick="openForm1()">Verify Incoming Data</button><br><br>
				<button class="button" onclick="openForm()">Verify Outgoing Data</button><br><br>
			

			<form action="RefuteVerification.jsp" method="post">
				<button class="button" onclick="OldClicked() =>{RequestDispatcher rd = request.getRequestDispatcher('.jsp'); rd.forward(request,response)}">Refute Verification</button>
			</form>

		</div>
		
		<div class="center3">
			<form action="NewVendor.jsp" method="post">
				<button class="button" onclick="OldClicked() =>{RequestDispatcher rd = request.getRequestDispatcher('NewVendor.jsp'); rd.forward(request,response)}">New Vendor</button><br><br>
			</form>

			<form action="NewDistributor.jsp" method="post">
				<button class="button" onclick="OldClicked() =>{RequestDispatcher rd = request.getRequestDispatcher('NewDistributor.jsp'); rd.forward(request,response)}">New Distributor</button><br><br>
			</form>
	</div>	
	
	<div class="image">
			<img style="border-radius: 50%; width: 100px; height: 100px" src="Images/YourCartLogo.jpg" >
	</div>	
	
		
	<div class="navbar">
		<a href="#">Dashboard</a>
	</div>
		
	<div class="sidebarLeft">
		<img src="Images/img_avatarM.png" >
		<label style="font-size: 30px"><br><%=fullname%></label>
		<label style="font-size: 20px"><%=email%></label>
		<label style="font-size: 20px"><%=phone %></label>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<a href="index.jsp">Logout</a>
	</div>
	
	<script>
		function openForm() {
		  document.getElementById("myForm").style.display = "block";
		}
		
		function closeForm() {
		  document.getElementById("myForm").style.display = "none";
		}

		function openForm1() {
			  document.getElementById("myForm1").style.display = "block";
		}
			
		function closeForm1() {
		  document.getElementById("myForm1").style.display = "none";
		}
	</script>
	
</body>
</html>