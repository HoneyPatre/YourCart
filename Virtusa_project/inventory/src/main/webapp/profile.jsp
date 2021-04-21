<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>

<!-- This file is profile + dashboard page -->

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
  left: 430px;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}
.center2 {
  margin: 0;
  position: absolute;
  top: 350px;
  left: 730px;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}
.center3 {
  margin: 0;
  position: absolute;
  top: 350px;
  left: 1030px;
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

.form1-popup {
  display: none;
  position: fixed;
  bottom: 200px;
  right: 650px;
  border: 3px solid #f1f1f1;
  z-index: 9;
}

/* Add styles to the form container */
.form1-container {
  text-align: center;
  max-width: 300px;
  height: 170px;
  width: 250px;
  padding: 20px;
  background-color: grey;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
  opacity: 1;
}

</style>
<link rel="stylesheet" type="text/css" href="profile.css">
<meta charset="ISO-8859-1">
<title>Dashboard</title>
</head>
<body>
	
	<%
		List TestProductName = (List)request.getAttribute("productNamesToBeAlerted");
		List TestNoOfItems = (List)request.getAttribute("noOfItemsToBeAlerted");
		int TestProductNameSize = TestProductName.size();
		int TestNoOfItemsSize = TestNoOfItems.size();
		String test1 = TestProductName.get(0).toString();
		String test2 = TestNoOfItems.get(0).toString();
	%>
	<%
		List NameOfProductsGettingExpired = (List)request.getAttribute("nameOfProductsGettingExpired");
		List NoOfCartonsGettingExpired = (List)request.getAttribute("noOfCartonsGettingExpired");
		String countOfDamageGoods = (String) request.getAttribute("countOfDamageGoods");
		int TestNameOfProductsGettingExpired = NameOfProductsGettingExpired.size();
		int TestNoOfCartonsGettingExpired = NoOfCartonsGettingExpired.size();
	%>
	<%
		String firstname = (String)session.getAttribute("firstname");
		String lastname = (String)session.getAttribute("lastname");
		String email = (String)session.getAttribute("email");
		String phone = (String)session.getAttribute("phone");
		String fullname = firstname + " " + lastname;	
	%>
	
		<div class="form1-popup" id="myForm2">
		  	<form action="DeleteRecord.jsp" method="get" class="form1-container">
		    <h2>Enter Transaction ID</h2>
		    <br>
			<input name="transactionid1" type="text" id="transactionid1">
			<br><br>
		    <button type="submit" class="btn" onclick="OldClicked() =>{RequestDispatcher rd = request.getRequestDispatcher('DeleteRecord.jsp'); rd.forward(request,response)}">Select</button>
		    <button type="button" class="btn cancel" onclick="closeForm2()">Close</button>
		  	</form>
		</div>
		
		<div class="form1-popup" id="myForm3">
		  	<form action="UpdateRecord.jsp" method="get" class="form1-container">
		    <h2>Enter Transaction ID</h2>
		    <br>
			<input name="transactionid2" type="text" id="transactionid2">
			<br><br>
		    <button type="submit" class="btn" onclick="OldClicked() =>{RequestDispatcher rd = request.getRequestDispatcher('UpdateRecord.jsp'); rd.forward(request,response)}">Select</button>
		    <button type="button" class="btn cancel" onclick="closeForm3()">Close</button>
		  	</form>
		</div>
		
		<div class="form1-popup" id="myForm4">
		  	<form action="DamageGoods.jsp" method="get" class="form1-container">
		    <h2>Enter Transaction ID</h2>
		    <br>
			<input name="transactionid3" type="text" id="transactionid3">
			<br><br>
		    <button type="submit" class="btn" onclick="OldClicked() =>{RequestDispatcher rd = request.getRequestDispatcher('DamageGoods.jsp'); rd.forward(request,response)}">Select</button>
		    <button type="button" class="btn cancel" onclick="closeForm4()">Close</button>
		  	</form>
		</div>
	
		<div class="form-popup" id="myForm">
		  	<form action="ViewDailySale.jsp" method="post" class="form-container">
		    <h2 style="color: white">Choose Date</h2>
		    <br>
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
			<br><br>
		    <button type="submit" class="btn" onclick="OldClicked() =>{RequestDispatcher rd = request.getRequestDispatcher('ViewDailySale.jsp'); rd.forward(request,response)}">Select</button>
		    <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
		  	</form>
		</div>
		
		<div class="form-popup" id="myForm1">
		  	<form action="ViewDailyStockFill.jsp" method="post" class="form-container">
		    <h2 style="color: white">Choose Date</h2>
		    <br>
			<input name="dateofarrival" type="date" id="theDateforarrival">
			<script type="text/javascript">
				var date = new Date();
				var day = date.getDate();
				var month = date.getMonth() + 1;
				var year = date.getFullYear();
				if (month < 10) month = "0" + month;
				if (day < 10) day = "0" + day;
				var today = year + "-" + month + "-" + day;
				document.getElementById('theDateforarrival').value = today;
			</script>
			<br><br>
		    <button type="submit" class="btn" onclick="OldClicked() =>{RequestDispatcher rd = request.getRequestDispatcher('ViewDailyStockFill.jsp'); rd.forward(request,response)}">Select</button>
		    <button type="button" class="btn cancel" onclick="closeForm1()">Close</button>
		  	</form>
		</div>
	
	<div class="container">
		<div class="center1">
			<form action="NewProductEntry.jsp" method="post">
				<button class="button" onclick="OldClicked() =>{RequestDispatcher rd = request.getRequestDispatcher('NewProductEntry.jsp'); rd.forward(request,response)}">New Data Input</button><br><br>
			</form>

			<form action="productInput.jsp" method="post">
				<button class="button" onclick="OldClicked() =>{RequestDispatcher rd = request.getRequestDispatcher('productInput.jsp'); rd.forward(request,response)}">Old Data Daily Updation</button><br><br>
			</form>

			<form action="salesInput.jsp" method="post">
				<button class="button" onclick="OldClicked() =>{RequestDispatcher rd = request.getRequestDispatcher('salesInput.jsp'); rd.forward(request,response)}">Sales Data Input</button>
			</form>

		</div>
		
		<div class="center2">
			
				<button class="button" onclick="openForm1()">View Incoming Data</button><br><br>
				<button class="button" onclick="openForm()">View Outgoing Data</button><br><br>
				
			<form action="ViewDailyStockRemaining.jsp" method="post">
				<button class="button" onclick="OldClicked() =>{RequestDispatcher rd = request.getRequestDispatcher('ViewDailyStockRemaining.jsp'); rd.forward(request,response)}">View Current Stocks</button>
			</form>

		</div>
		
		<div class="center3">
				<button class="button" onclick="openForm4()">Damaged Goods Entry</button>
				<br><br>
				<button class="button" onclick="openForm2()">Delete Records</button>
				<br><br>
				<button class="button" onclick="openForm3()">Update Records</button>
		</div>
	</div>	
	
	<div class="sidebarRight">
			<a href="add" target="_blank" style="font-size: 40px">Alerts</a>
				<%
					for(int i=0; i<TestProductNameSize; i++){
				%>
					<p style="text-align: center; font-size: 20px; color: #800000"> <%=TestProductName.get(i)%> needs a refill</p>
					<p style="text-align: center "> <%=TestNoOfItems.get(i)%> number of cartons left</p>
				<%		
					}
				%>
				<p style="text-align: center; font-size: 20px; color: #152882">Some products are about to expire:</p>
				<%
					for(int i=0; i<TestNameOfProductsGettingExpired; i++){
				%>
					<p style="text-align: center"> <%=NameOfProductsGettingExpired.get(i)%> - <%=NoOfCartonsGettingExpired.get(i)%> Cartons</p>
				<%		
					}
				%>
					<p style="text-align: center; font-size: 20px; color: #006600"><%=countOfDamageGoods %> Damaged goods entries</p>
			<img src="Images/YourCartLogo.jpg" >
	</div>
		
	<div class="navbar">
		<a href="barcodegenerator">Barcode Generator</a>
		<a href="InvoiceDownload.jsp">Invoice Download</a>
		<a href="CsvFileUpload.jsp">File Upload</a>
	</div>
		
	<div class="sidebarLeft">
		<img src="Images/img_avatarF.png" >
		<label style="font-size: 30px"><br><%=fullname%></label>
		<label style="font-size: 20px"><%=email%></label>
		<label style="font-size: 20px"><%=phone %></label>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<a href="makerlogout">Logout</a>
	</div>
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
		
		function openForm2() {
		  document.getElementById("myForm2").style.display = "block";
		}
		
		function closeForm2() {
		  document.getElementById("myForm2").style.display = "none";
		}

		function openForm3() {
			  document.getElementById("myForm3").style.display = "block";
		}
			
		function closeForm3() {
		  document.getElementById("myForm3").style.display = "none";
		}

		function openForm4() {
			  document.getElementById("myForm4").style.display = "block";
		}
			
		function closeForm4() {
		  document.getElementById("myForm4").style.display = "none";
		}
		</script>
	
</body>
</html>