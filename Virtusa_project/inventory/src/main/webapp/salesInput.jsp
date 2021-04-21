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

<!-- This page take input of daily sales -->

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
<title>Sales Details Fill</title>
</head>
<body onload="GetAll()">
	<script>
		function GetAll(){
			GetProductName();
			GetEmployeeUsername();
			GetDistributorId();
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
		ArrayList<String> DistributorId = new ArrayList<String>();
		ArrayList<String> ProductId = new ArrayList<String>();
		ArrayList<String> ProductName = new ArrayList<String>();
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","1234");
		Statement myStmt = myConn.createStatement();
		
		ResultSet myRs1 = myStmt.executeQuery("select * from makerinformation");
		while(myRs1.next()){
			EmployeeUsername.add(myRs1.getString("Username"));
		}
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
		ResultSet myRs4 = myStmt.executeQuery("select * from distributorinformation");
		while(myRs4.next()){
			DistributorId.add(myRs4.getString("DistributorId"));
		}
		int DistributorIdsize = DistributorId.size();
	%>
	
	<script>
		function GetEmployeeUsername(){	
				<%
					for(int i=0; i<EmployeeUsernameSize; i++){		
				%>
				var e = document.getElementById("empunameforsale");
				var option = document.createElement("option");
				option.text = "<%=EmployeeUsername.get(i)%>";
				e.add(option);
				<%
					}
				%>
		}
		function GetDistributorId(){	
			<%
				for(int i=0; i<DistributorIdsize; i++){		
			%>
			var d = document.getElementById("distributorid");
			var option = document.createElement("option");
			option.text = "<%=DistributorId.get(i)%>";
			d.add(option);
			<%
				}
			%>
		}
		function GetProductName(){	
			<%
				for(int j=0; j<ProductNameSize; j++){		
			%>
			var p = document.getElementById("productnameforsale");
			var option = document.createElement("option");
			option.text = "<%=ProductName.get(j)%>";
			p.add(option);
			<%
				}
			%>
	}
	</script>
	
	<form action="dailysales" method="post">
	
	<div class="container">
		<div class="center">
		<div class="custom-select">
		<br><br><br><br>
			<h1>Sales Data Fill</h1>
			<br><br>
			<label>Product Name :</label>
			<select name="productnameforsale" id="productnameforsale" onchange="GetSelectedProductId(this)">
				<option>select</option>
			</select>
			
			<br><br><br>
			<label>Product ID :</label>
			<select name="productidforsale" id="productidforsale">
			<option>select</option>
			</select>
			<br><br><br>
			<label>Date Of Sale:</label>
			<input name="dateofsale" type="date" id="theDateforsale">
			<script type="text/javascript">
				var date = new Date();
				var day = date.getDate();
				var month = date.getMonth() + 1;
				var year = date.getFullYear();
				if (month < 10) month = "0" + month;
				if (day < 10) day = "0" + day;
				var today = year + "-" + month + "-" + day;
				document.getElementById('theDateforsale').value = today;
			</script>
			<br><br><br>
			<label>No. Of Cartons:</label>
			<input type="number" name="noofcartonsforsale" placeholder="Enter number">
			<br><br><br>
			<label>Price Per Cartons:</label>
			<input type="number" name="pricepercarton" placeholder="Enter number">
			<br><br><br>
			<label>Distributor ID:</label>
			<select name="distributorid" id="distributorid" >
			<option>select</option>
			</select>
			<br><br><br>
			<label>Employee Username:</label>
			<select name="empunameforsale" id="empunameforsale" >
			<option>select</option>
			</select>
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
	<script>
	function GetSelectedProductId(productnameforsale){
		selectedText1 = productnameforsale.options[productnameforsale.selectedIndex].innerHTML;
		console.log(selectedText1);
		var select = document.getElementById("productidforsale");
		var length = select.options.length;
		for (i = length-1; i > 0; i--) {
			select.options[i] = null;
		}

		<%
		for(int i=0; i<ProductNameSize; i++){
		%>
			var s2 = "<%=ProductName.get(i)%>";
			if(selectedText1.localeCompare(s2)==0){
				var p = document.getElementById("productidforsale");
				var option = document.createElement("option");
				option.text = "<%=ProductId.get(i)%>";
				p.add(option);
			}		
		<%
		}
		%>
	}
	</script>
		
</body>
</html>