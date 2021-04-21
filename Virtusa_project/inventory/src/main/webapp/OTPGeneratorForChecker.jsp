<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Random" %>
<%@ page import="inventory.SendMail" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.container { 
  height: 200px;
  position: fixed; 
}
.center {
  border: 1px solid black;
  background-color: purple;
  height: 300px;
  width: 570px;
  margin: 0;
  position: fixed;
  top: 300px;
  left: 800px;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}
</style>

<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="profile.css">
<title>OTP Generator</title>
</head>
<body style ="background-color: #C0C0C0">
<%
	
	String fname = request.getParameter("fnameC");
	String lname = request.getParameter("lnameC");
	String email = request.getParameter("emailC");
	String phone = request.getParameter("phoneC");
	String address = request.getParameter("addressC");
	String psw = request.getParameter("txtPasswordC");
	
	session.setAttribute("fnameC", fname);
	session.setAttribute("lnameC", lname);
	session.setAttribute("emailC", email);
	session.setAttribute("phoneC", phone);
	session.setAttribute("addressC", address);
	session.setAttribute("pswC", psw);
	
	
	String numbers= "1234567890";
	Random r = new Random();
	char[] otp= new char[4];
	for(int i=0; i<4; i++){
		otp[i]=numbers.charAt(r.nextInt(numbers.length()));
	}
	
	String OTP = String.valueOf(otp);
	session.setAttribute("originalotpC", OTP);
	String to = email;
    String subject = "YourCart OTP";
    String message =  "Your OTP: "+OTP;
    
    String user = "yourcartinventory@gmail.com";
    String pass = "yourcart@123";
    
    SendMail.send(to,subject, message, user, pass);
%>

<div class="container">
		<div class="center">
		<div class="custom-select">
		<br><br>
			<form action="checkerregistration" method="post">
				<label style="font-size: 25px">Enter OTP:</label><br><br><br>
				<input type="text" name="otpenteredC" placeholder="Enter OTP"><br><br><br>
			<button type="submit">Submit</button>
			</form>
		</div>
		</div>
	</div>

</body>
</html>