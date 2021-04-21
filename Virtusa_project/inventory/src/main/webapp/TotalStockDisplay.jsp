<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Total Stock Remaining</title>
</head>
<!-- This file is called when alert of any page is called. Called via servlet -->
<body style ="background-color: #C0C0C0">
	
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
	<br>
				<%
					for(int i=0; i<TestProductNameSize; i++){
				%>
					<p style="text-align: center; font-size: 20px; color: red"> <%=TestProductName.get(i)%> needs a refill</p>
					<p style="text-align: center "> <%=TestNoOfItems.get(i)%> number of cartons left</p>
				<%		
					}
				%>
				<p style="text-align: center; font-size: 20px; color: #3357FF">Some products are about to expire:</p>
				<%
					for(int i=0; i<TestNameOfProductsGettingExpired; i++){
				%>
					<p style="text-align: center; font-size: 20px"> <%=NameOfProductsGettingExpired.get(i)%> - <%=NoOfCartonsGettingExpired.get(i)%> Cartons</p>
				<%		
					}
				%>
					<p style="text-align: center; font-size: 20px; color: #006600"><%=countOfDamageGoods %> Damaged goods entries</p>
</body>
</html>