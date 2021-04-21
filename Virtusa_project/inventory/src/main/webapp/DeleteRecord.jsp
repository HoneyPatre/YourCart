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
<style type="text/css">
.center {
  margin: 0;
  position: absolute;
  text-align: center;
  top: 250px;
  left: 750px;
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
		
		String message= new String();
		message = "Data Possibly doesn't exist";
		String transactionid = request.getParameter("transactionid1");
		System.out.println(transactionid);
		boolean isIncoming = transactionid.contains("TI");
		boolean isOutgoing = transactionid.contains("TO");
		if(isIncoming){
			String deletequery = "select * from dailystockfill where TransactionId = ?";
			PreparedStatement myPs4 = myConn.prepareStatement(deletequery);
			myPs4.setString(1, transactionid);
			ResultSet rs = myPs4.executeQuery();
			while(rs.next()) {
				String isVerified = rs.getString(9);
				if(isVerified==null) {
					//out.println("Data can be deleted");
					String query = "delete from dailystockfill where TransactionId=?";
					PreparedStatement myPs5 = myConn.prepareStatement(query);
					myPs5.setString(1,transactionid);
					if(myPs5.executeUpdate()>0) {
						//out.println("Data deleted");
						message="Data Deleted";
					}
					else{
						message="Data Possibly doesn't exist";
					}
				}
				else {
					//out.print("Data cannot be tampered");
					message="Data cannot be tampered";
				}
			}
			
		}
		else if(isOutgoing){
			String deletequery = "select * from dailysale where TransactionId = ?";
			PreparedStatement myPs4 = myConn.prepareStatement(deletequery);
			myPs4.setString(1, transactionid);
			ResultSet rs = myPs4.executeQuery();
			while(rs.next()) {
				
				String isVerified = rs.getString(8);
				if(isVerified==null) {
					//out.println("Data can be deleted");
					String query = "delete from dailysale where TransactionId=?";
					PreparedStatement myPs5 = myConn.prepareStatement(query);
					myPs5.setString(1,transactionid);
					if(myPs5.executeUpdate()>0) {
						//out.println("Data deleted");
						message="Data Deleted";
					}
					else{
						message="Data Possibly doesn't exist";
					}
				}
				else {
					//out.print("Data cannot be tampered");
					message="Data cannot be tampered";
				}
			}
		}
		else{
				//out.println("Data refute was inturrpted");
			}
%>
	<form action="alertgenerator" method="post">
		<div class="center">
			<h2><%=message%></h2><br><br>
			<button class="button" type="submit">Go To Dashboard</button>
		</div>
	</form>
</body>
</html>