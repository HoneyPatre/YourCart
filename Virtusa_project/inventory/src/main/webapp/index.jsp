<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="IndexForCss.css">
<link rel="stylesheet" type="text/css" href="BackgroundDesign.css">
<title>YourCart Inventory Application</title>

</head>
<!-- This page is the Login of the system -->

<body style ="background-color: #C0C0C0; margin: 0px">

<!-- <ul class="bubbles">
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul> -->
	<div class="heading">
			<label><br>YourCart Inventory Application<br><br></label>
	</div>
	<br><br>
	
		<div class= "flex-container">
				<div class="flex-child maker">
					<form action="makerlogin" method="post">
					<div style="padding-left:40px; width:350px;height:400px;border:2px solid purple;box-shadow: 10px 10px 5px grey;background-color:gainsboro">
					<br><br>
					<label style="font-size: 30px">Login as Maker</label><br><br>
					<label for="uname"><b>Username:</b></label>
			    	<input style="padding: 6px" type="text" placeholder="Enter Username" name="uname" required><br><br>
			    	<label for="psw"><b>Password :</b></label>
			    	<input style="padding: 6px" type="password" placeholder="Enter Password" name="psw" required><br><br>
			    	<button class= "button1" type="submit">Login</button><br><br>
			    	<a style="font-size:20px" href="MakerRegistration.jsp">Don't have an account? Register</a>
			    	</div>
			    	</form>
				</div>
				
				<div class= "flex-child checker">
					<form action="checkerlogin" method="post">
					<div style="padding-left:40px; width:350px;height:400px;border:2px solid purple;box-shadow: 10px 10px 5px grey;background-color:gainsboro">
					<br><br>
					<label style="font-size: 30px">Login as Checker</label><br><br>
					<label for="unameC"><b>Username:</b></label>
			    	<input style="padding: 6px" type="text" placeholder="Enter Username" name="unameC" required><br><br>
			    	<label for="pswC"><b>Password :</b></label>
			    	<input style="padding: 6px" type="password" placeholder="Enter Password" name="pswC" required><br><br>
			    	<button class= "button1" type="submit">Login</button><br><br>
			    	<a style="font-size:20px" href="CheckerRegistration.jsp">Don't have an account? Register</a>
			    	</div>
			    	</form>
				</div>
			</div> 
</body>
</html>