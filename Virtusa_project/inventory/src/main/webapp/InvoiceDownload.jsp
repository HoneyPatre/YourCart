<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import = "java.util.List" %>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.*"%>
<%@ page import ="javax.servlet.http.HttpServlet"%>
<%@ page import ="javax.servlet.http.HttpServletRequest"%>
<%@ page import ="javax.servlet.http.HttpSession"%>
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
  top: 250px;
  left: 700px;
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
<body style ="background-color: #C0C0C0" onload="GetAll()" >
	
	<script>
		function GetAll(){
			GetProductId();
			GetDistributorId();
			GetVendorId();
			GetProductId1();
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
		ArrayList<String> DistributorId = new ArrayList<String>();
		ArrayList<String> ProductId = new ArrayList<String>();
		ArrayList<String> VendorId = new ArrayList<String>();
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","1234");
		Statement myStmt = myConn.createStatement();
		ResultSet myRs3 = myStmt.executeQuery("select * from productdetail");
		while(myRs3.next()){
			ProductId.add(myRs3.getString("ProductID"));
		}
		int ProductIdsize = ProductId.size();
		ResultSet myRs4 = myStmt.executeQuery("select * from distributorinformation");
		while(myRs4.next()){
			DistributorId.add(myRs4.getString("DistributorId"));
		}
		int DistributorIdsize = DistributorId.size();
		
		ResultSet myRs5 = myStmt.executeQuery("select * from vendorinformation");
		while(myRs5.next()){
			VendorId.add(myRs5.getString("VendorId"));
		}
		int VendorIdsize = VendorId.size();
	%>
	
	<script type="text/javascript">
		function GetDistributorId(){	
			<%
				for(int i=0; i<DistributorIdsize; i++){		
			%>
			var d = document.getElementById("distributoridforinvoice");
			var option = document.createElement("option");
			option.text = "<%=DistributorId.get(i)%>";
			d.add(option);
			<%
				}
			%>
		}
		function GetProductId(){	
			<%
				for(int j=0; j<ProductIdsize; j++){		
			%>
			var p = document.getElementById("productidforinvoice");
			var option = document.createElement("option");
			option.text = "<%=ProductId.get(j)%>";
			p.add(option);
			<%
				}
			%>
	  	}
		function GetVendorId(){	
			<%
				for(int i=0; i<VendorIdsize; i++){		
			%>
			var v = document.getElementById("vendoridforinvoice");
			var option = document.createElement("option");
			option.text = "<%=VendorId.get(i)%>";
			v.add(option);
			<%
				}
			%>
		}
		function GetProductId1(){	
			<%
				for(int j=0; j<ProductIdsize; j++){		
			%>
			var p1 = document.getElementById("productidforinvoice1");
			var option = document.createElement("option");
			option.text = "<%=ProductId.get(j)%>";
			p1.add(option);
			<%
				}
			%>
	  }
	
	</script>
	<div class="container">
		<div class="center">
			<div class="custom-select">
			 	<form action = "PdfGenerator.jsp">
			 	<br><br><br><br><br>
					<h2>Generate Invoice Of Goods Sold</h2>
					<br>
					<label>Distributor ID :</label>
					<select name="distributoridforinvoice" id="distributoridforinvoice" required>
					<option>select</option>
					</select>
					<br><br>
					
					<label>Product ID :</label>
					<select name="productidforinvoice" id="productidforinvoice" required>
					<option>select</option>
					</select>
					<br><br>
					
					<label>Date Of Sale:</label>
					<input name="dateofsaleforinvoice" type="date" id="theDateforsaleforinvoice" required>
					<script type="text/javascript">
						var date = new Date();
						var day = date.getDate();
						var month = date.getMonth() + 1;
						var year = date.getFullYear();
						if (month < 10) month = "0" + month;
						if (day < 10) day = "0" + day;
						var today = year + "-" + month + "-" + day;
						document.getElementById('theDateforsaleforinvoice').value = today;
					</script>
					<br><br>
			        <button type="submit">Generate</button>
			        </form>
			        
			        <form action="PdfGeneratorForIncoming.jsp">
			 		<br><br><br>
					<h2>Generate Invoice Of Incoming Goods</h2>
					<br>
					<label>Vendor ID :</label>
					<select name="vendoridforinvoice" id="vendoridforinvoice" >
					<option>select</option>
					</select>
					<br><br>
					
					<label>Product ID :</label>
					<select name="productidforinvoice1" id="productidforinvoice1">
					<option>select</option>
					</select>
					<br><br>
					
					<label>Date Of Arrival:</label>
					<input name="theDateforarrivalforinvoice" type="date" id="theDateforarrivalforinvoice">
					<script type="text/javascript">
						var date = new Date();
						var day = date.getDate();
						var month = date.getMonth() + 1;
						var year = date.getFullYear();
						if (month < 10) month = "0" + month;
						if (day < 10) day = "0" + day;
						var today = year + "-" + month + "-" + day;
						document.getElementById('theDateforarrivalforinvoice').value = today;
					</script>
					<br><br>
			        <button type="submit">Generate</button>
			        </form>
			        
			        
			    </div>
		      	
		      	<br><br>
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
