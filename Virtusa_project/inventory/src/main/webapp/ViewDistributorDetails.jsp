<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import = "java.util.List" %>
<%@ page import= "java.io.IOException"%>
<%@ page import= "java.io.PrintWriter"%>
<%@ page import= "java.sql.DriverManager"%>
<%@ page import= "java.sql.PreparedStatement"%>
<%@ page import= "java.sql.ResultSet"%>
<%@ page import= "java.sql.Statement"%>
<%@ page import= "java.time.LocalDate"%>
<%@ page import= "java.time.format.DateTimeFormatter"%>
<%@ page import= "javax.servlet.http.HttpServlet"%>
<%@ page import= "java.sql.SQLException"%>

<!DOCTYPE html>


<html>
<head>
<title>Distributor Details</title>
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
  top: 300px;
  left: 730px;
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

<title>Verify Sales Data</title>
</head>
<body style ="background-color: #C0C0C0">
	
	<%
		String firstname = (String)session.getAttribute("firstnameC");
		String lastname = (String)session.getAttribute("lastnameC");
		String email = (String)session.getAttribute("emailC");
		String phone = (String)session.getAttribute("phoneC");
		String fullname = firstname + " " + lastname;	 	
	%>
	<%
		ArrayList<String> DistributorID = new ArrayList<String>();
		ArrayList<String> DistributorFirstName = new ArrayList<String>();
		ArrayList<String> DistributorLastName = new ArrayList<String>();
		ArrayList<String> DistributorEmail = new ArrayList<String>();
		ArrayList<String> DistributorPhone = new ArrayList<String>();
		ArrayList<String> DistributorAddress = new ArrayList<String>();
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		java.sql.Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","1234");
		Statement myStmt = myConn.createStatement();
		String alertquery = "select * from distributorinformation";
		ResultSet myRs5 = myStmt.executeQuery(alertquery);
		while(myRs5.next()) {
			
			String DistributorIDCurrent = myRs5.getString(1);
			String DistributorFirstnameCurrent = myRs5.getString(2);
			String DistributorLastNameCurrent = myRs5.getString(3);
			String DistributorEmailCurrent = myRs5.getString(4);
			String DistributorPhoneCurrent = myRs5.getString(5);
			String DistributorAddressCurrent = myRs5.getString(6);
			
			DistributorID.add(DistributorIDCurrent);
			DistributorFirstName.add(DistributorFirstnameCurrent);
			DistributorLastName.add(DistributorLastNameCurrent);
			DistributorEmail.add(DistributorEmailCurrent);
			DistributorPhone.add(DistributorPhoneCurrent);
			DistributorAddress.add(DistributorAddressCurrent);
		}	
		
	%>
	
	<div class="container">
		<div class="center">
		    <table width="130%" style="border: 1px solid black; text-align: center;">
				<tr style="border: 1px solid black">
				    <th style="border: 1px solid black;padding: 10px;">Distributor ID</th>
				    <th style="border: 1px solid black;padding: 10px;">Distributor First Name</th>
				    <th style="border: 1px solid black;padding: 10px;">Distributor Last Name</th>
				    <th style="border: 1px solid black;padding: 10px;">Distributor Email ID</th>
				    <th style="border: 1px solid black;padding: 10px;">Distributor Phone No.</th>
				    <th style="border: 1px solid black;padding: 10px;">Distributor Address</th>
				  </tr>
		      	<%
					for(int i=0; i<DistributorID.size(); i++){
				%>
				  <tr style="border: 1px solid black">
				    <td style="border: 1px solid black; padding: 10px;"><%=DistributorID.get(i)%></td>
				    <td style="border: 1px solid black; padding: 10px;"><%=DistributorFirstName.get(i)%></td>
				    <td style="border: 1px solid black; padding: 10px;"><%=DistributorLastName.get(i)%></td>
				    <td style="border: 1px solid black; padding: 10px;"><%=DistributorEmail.get(i)%></td>
				    <td style="border: 1px solid black; padding: 10px;"><%=DistributorPhone.get(i)%></td>
				    <td style="border: 1px solid black; padding: 10px;"><%=DistributorAddress.get(i)%></td>
				  </tr>
				<%		
					}
				%>	
			</table>  	
		</div>
	</div>
	<div class="image">
			<img style="border-radius: 50%; width: 100px; height: 100px" src="Images/YourCartLogo.jpg" >
	</div>	
		
	<div class="navbar">
		<a href="DashboardForChecker.jsp">Dashboard</a>
	</div>
		
	<div class="sidebarLeft">
		<img src="Images/img_avatarM.png" >
		<label style="font-size: 30px"><br><%=fullname%></label>
		<label style="font-size: 20px"><%=email%></label>
		<label style="font-size: 20px"><%=phone %></label>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<a href="index.html">Logout</a>
	</div>
</body>
</html>

