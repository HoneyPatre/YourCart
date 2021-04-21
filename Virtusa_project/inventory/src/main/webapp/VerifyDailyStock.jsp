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
<title>Verify Stock Data</title>
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

<title>File Upload</title>
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
		ArrayList<String> ProductID = new ArrayList<String>();
		ArrayList<String> ProductNames = new ArrayList<String>();
		ArrayList<String> DateOfArrival = new ArrayList<String>();
		ArrayList<Integer> NoOfItems = new ArrayList<Integer>();
		ArrayList<Integer> PricePerCarton = new ArrayList<Integer>();
		ArrayList<String> ExpiryDate = new ArrayList<String>();
		ArrayList<String> VendorID = new ArrayList<String>();
		ArrayList<String> EmployeeUsername = new ArrayList<String>();
		ArrayList<String> TransactionID = new ArrayList<String>();
		
		//LocalDate CurrentDate= java.time.LocalDate.now();
		//String CurrentDate1 = CurrentDate.toString();
		String CurrentDate1 = request.getParameter("dateofarrivalverify");
		Class.forName("com.mysql.cj.jdbc.Driver");
		java.sql.Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","1234");
		Statement myStmt = myConn.createStatement();
		String alertquery = "select * from dailystockfill where DateOfArrival = ?";
		PreparedStatement myPs3 = myConn.prepareStatement(alertquery);
		myPs3.setString(1, CurrentDate1);
		ResultSet myRs5 = myPs3.executeQuery();
		while(myRs5.next()) {
			
			String ProductIDOfItemsLeft = myRs5.getString(1);
			String ProductNameOfItemsLeft = myRs5.getString(2);
			String DateOfConsideration1 = myRs5.getString(3);
			int noOfCartonsLeft = myRs5.getInt(4);
			int pricePerCarton = myRs5.getInt(5);
			String expiryDate = myRs5.getString(6);
			String vendorId = myRs5.getString(7);
			String empUsername = myRs5.getString(8);
			String transactionId = myRs5.getString(10);
			
			ProductID.add(ProductIDOfItemsLeft);
			DateOfArrival.add(DateOfConsideration1);
			ProductNames.add(ProductNameOfItemsLeft);
			NoOfItems.add(noOfCartonsLeft);
			PricePerCarton.add(pricePerCarton);
			ExpiryDate.add(expiryDate);
			VendorID.add(vendorId);
			EmployeeUsername.add(empUsername);
			TransactionID.add(transactionId);
		}	
		
	%>
	
	<script type="text/javascript">
	function MarkAsVerified(){
		<%
			String somedate = request.getParameter("dateofarrivalverify");
			//String somedate = "2020-08-08";
			String updatequery = "update dailystockfill set IsVerified=true where DateOfArrival = ?";
			PreparedStatement myPs4 = myConn.prepareStatement(updatequery);
			myPs4.setString(1, somedate);
			System.out.println(myPs4.executeUpdate());
			if(myPs4.executeUpdate()>0){
		%>
				alert("Data marked as verified successfully!");
		<%
			}else{
		%>
				alert("No data available for this date");
		<%
			}
		%>	
	}
	</script>
	
	<div class="container">
		<div class="center">
		    <table width="130%" style="border: 1px solid black; text-align: center;">
				<tr style="border: 1px solid black">
				    <th style="border: 1px solid black;padding: 10px;">Product ID</th>
				    <th style="border: 1px solid black;padding: 10px;">Product Names</th>
				    <th style="border: 1px solid black;padding: 10px;">Date Of Sale</th>
				    <th style="border: 1px solid black;padding: 10px;">No. Of Items</th>
				    <th style="border: 1px solid black;padding: 10px;">Price(Per Carton)</th>
				    <th style="border: 1px solid black;padding: 10px;">Expiry Date</th>
				    <th style="border: 1px solid black;padding: 10px;">Vendor ID</th>
				    <th style="border: 1px solid black;padding: 10px;">Employee Incharge ID</th>
				    <th style="border: 1px solid black;padding: 10px;">Transaction ID</th>
				  </tr>
		      	<%
					for(int i=0; i<ProductID.size(); i++){
				%>
				  <tr style="border: 1px solid black">
				    <td style="border: 1px solid black; padding: 10px;"><%=ProductID.get(i)%></td>
				    <td style="border: 1px solid black; padding: 10px;"><%=ProductNames.get(i)%></td>
				    <td style="border: 1px solid black; padding: 10px;"><%=DateOfArrival.get(i)%></td>
				    <td style="border: 1px solid black; padding: 10px;"><%=NoOfItems.get(i)%></td>
				    <td style="border: 1px solid black; padding: 10px;"><%=PricePerCarton.get(i)%></td>
				    <td style="border: 1px solid black; padding: 10px;"><%=ExpiryDate.get(i)%></td>
				    <td style="border: 1px solid black; padding: 10px;"><%=VendorID.get(i)%></td>
				    <td style="border: 1px solid black; padding: 10px;"><%=EmployeeUsername.get(i)%></td>
				    <td style="border: 1px solid black; padding: 10px;"><%=TransactionID.get(i)%></td>
				  </tr>
				<%		
					}
				%>	
			</table>
			<br><br><br>
			<button type="button" onclick="MarkAsVerified()">Mark as Verified</button>  	
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

