<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.container { 
  height: 200px;
  position: relative; 
}
.center {
  margin: 0;
  position: absolute;
  top: 250px;
  left: 600px;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}

</style>
<link rel="stylesheet" type="text/css" href="profile.css">
<meta charset="ISO-8859-1">
<title>Registration Page</title>
</head>
<body style ="background-color: #C0C0C0">
<div class="container">
		<div class="center">
		<div class="custom-select">
		<br><br>
			<h1>Registration</h1>
			<br>
			<form action="OTPGeneratorForChecker.jsp">
			<label>First Name :</label>
			<input type="text" placeholder="Enter First Name" name="fnameC">
			<br><br><br>
			<label>Last Name :</label>
			<input type="text" placeholder="Enter Last Name" name="lnameC">
			<br><br><br>
			<label>Email ID:</label>
			<input type="text" placeholder="Enter Email ID" name="emailC">
			<br><br><br>
			<label>Phone:</label>
			<input type="text" placeholder="Enter Phone Number" name="phoneC">
			<br><br><br>
			<label>Address:</label>
			<input type="text" placeholder="Enter Address" name="addressC">
			<br><br><br>
			<label>Set Password</label>
			<input type="password" id="txtPasswordC" name="txtPasswordC">
			<br><br><br>
			<label>Confirm Password</label>
			<input type="password" id="txtConfirmPasswordC">
			<br><br><br>
			<button type="submit" >Save</button>
			</form>
		</div>
		</div>
	</div>
<script type="text/javascript">
    function Validate() {
        var password = document.getElementById("txtPasswordC").value;
        var confirmPassword = document.getElementById("txtConfirmPasswordC").value;
        if (password != confirmPassword) {
            alert("Passwords do not match.");
            return false;
        }
        return true;
    }
</script>
</body>
</html>