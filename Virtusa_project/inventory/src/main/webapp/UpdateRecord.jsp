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
<link rel="stylesheet" type="text/css" href="profile.css">
<style type="text/css">
.center {
  margin: 0;	
  position: absolute;
  text-align: left;
  top: 250px;
  left: 600px;
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
</style>

</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style ="background-color: #C0C0C0">
<%
		Class.forName("com.mysql.cj.jdbc.Driver");
		java.sql.Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","1234");
		Statement myStmt = myConn.createStatement();
		boolean CanBeUpdatedIncome = false;
		boolean CanBeUpdatedOutgo = false;
		String message= new String();
		message = "Data Possibly doesn't exist";
		String transactionid = request.getParameter("transactionid2");
		
		session.setAttribute("transactionidupload", transactionid);
		
		System.out.println(transactionid);
		boolean isIncoming = transactionid.contains("TI");
		boolean isOutgoing = transactionid.contains("TO");
		if(isIncoming){
			String updatequery = "select * from dailystockfill where TransactionId = ?";
			PreparedStatement myPs4 = myConn.prepareStatement(updatequery);
			myPs4.setString(1, transactionid);
			ResultSet rs = myPs4.executeQuery();
			while(rs.next()) {
				String isVerified = rs.getString(9);
				if(isVerified==null) {
					//out.println("Data can be updated");
					message="Data can be updated";
					CanBeUpdatedIncome = true;
				}
				else {
					message="Data cannot be tampered";
				}
			}
			
		}
		else if(isOutgoing){
			String updatequery = "select * from dailysale where TransactionId = ?";
			PreparedStatement myPs4 = myConn.prepareStatement(updatequery);
			myPs4.setString(1, transactionid);
			ResultSet rs = myPs4.executeQuery();
			while(rs.next()) {
				
				String isVerified = rs.getString(8);
				if(isVerified==null) {
					//out.println("Data can be updated");
					message="Data can be updated";
					CanBeUpdatedOutgo = true;
				}
				else {
					message="Data cannot be tampered";
				}
			}
		}
		else{
				out.println("Data updation failed");
			}
%>
	
<!-- -------------------------------------------------------------------------------------------------------------------------------------------------------- -->	
	<%
		if(CanBeUpdatedIncome){
	%>
	
	<form action="updateincomingrecord" method="get">
		<div class="container">
		<div class="center">
		<div class="custom-select">
			<h2><%=message%></h2><br><br>
			<label>Product Name :</label>
			<input name="productnameforincomeupdate" id="productnameforincomeupdate">
			<br><br><br>
			<label>Product ID :</label>
			<input name="productidforincomeupdate" id="productidforincomeupdate">
			<br><br><br>
			<label>Date Of Arrival:</label>
			<input name="dateofarrival" type="date" id="theDate">
			<script type="text/javascript">
				var date = new Date();
				var day = date.getDate();
				var month = date.getMonth() + 1;
				var year = date.getFullYear();
				if (month < 10) month = "0" + month;
				if (day < 10) day = "0" + day;
				var today = year + "-" + month + "-" + day;
				document.getElementById('theDate').value = today;
			</script>
			<br><br><br>
			<label>No. Of Cartons:</label>
			<input type="number" name="noofcartonsforincomeupdate" placeholder="Enter number">
			<br><br><br>
			<label>Price Per Carton:</label>
			<input type="number" name="pricepercartonforincomeupdate" placeholder="Enter number">
			<br><br><br>
			<label>Expiry Date:</label>
			<input name="expirydate" type="date" id="theDate1">
			<script type="text/javascript">
				var date = new Date();
				var day = date.getDate();
				var month = date.getMonth() + 1;
				var year = date.getFullYear();
				if (month < 10) month = "0" + month;
				if (day < 10) day = "0" + day;
				var today = year + "-" + month + "-" + day;
				//document.getElementById('theDate1').value = today;
			</script>
			<br><br><br>
			<label>Vendor ID :</label>
			<input name="vendoridforincomeupdate" id="vendoridforincomeupdate">
			<br><br><br>
			<label>Employee Username:</label>
			<input name="empunameforincomeupdate" id="empunameforincomeupdate" ><br><br><br>
			<button class="button" type="submit">Update</button>
		</div>
		</div>
		</div>
	</form>
	
	<%
		} 
		else if(CanBeUpdatedOutgo ){
	%>
		<form action="updateoutgorecord" method="get">
		<div class="container">
		<div class="center">
		<div class="custom-select">
			<h2><%=message%></h2><br><br>
			<label>Product Name :</label>
			<input name="productnameforoutgoupdate" id="productnameforoutgoupdate">
			<br><br><br>
			<label>Product ID :</label>
			<input name="productidforoutgoupdate" id="productidforoutgoupdate">
			<br><br><br>
			<label>Date Of Arrival:</label>
			<input name="dateofsale" type="date" id="theDate">
			<script type="text/javascript">
				var date = new Date();
				var day = date.getDate();
				var month = date.getMonth() + 1;
				var year = date.getFullYear();
				if (month < 10) month = "0" + month;
				if (day < 10) day = "0" + day;
				var today = year + "-" + month + "-" + day;
				document.getElementById('theDate').value = today;
			</script>
			<br><br><br>
			<label>No. Of Cartons:</label>
			<input type="number" name="noofcartonsforoutgoupdate" placeholder="Enter number">
			<br><br><br>
			<label>Price Per Carton:</label>
			<input type="number" name="pricepercartonforoutgoupdate" placeholder="Enter number">
			<br><br><br>
			<label>Distributor ID :</label>
			<input name="distributoridforoutgoupdate" id="distributoridforoutgoupdate">
			<br><br><br>
			<label>Employee Username:</label>
			<input name="empunameforoutgoupdate" id="empunameforoutgoupdate" ><br><br><br>
			<button class="button" type="submit">Update</button>
		</div>
		</div>
		</div>
	</form>
	<%	
		}else{
	%>
		
		<div class="center">
			<form action="alertgenerator" method="post">
			<h2><%=message%></h2><br><br>
			<button class="button" type="submit">Go To Dashboard</button>
			</form>
		</div>
		
	<%
		}
	%>

<!-- -------------------------------------------------------------------------------------------------------------------------------------------------------- -->	
</body>
</html>