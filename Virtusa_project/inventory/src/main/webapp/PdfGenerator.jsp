<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="javax.swing.border.TitledBorder"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.lowagie.text.DocumentException"%>
<%@page import="com.lowagie.text.Paragraph"%>
<%@page import="com.lowagie.text.html.HtmlWriter"%>
<%@page import="com.lowagie.text.pdf.PdfWriter"%>
<%@page import="com.lowagie.text.Document"%>
<%@page import="java.io.*"%>
<%@page import="java.awt.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="com.lowagie.text.*"%>
<%@page import="com.lowagie.text.pdf.*"%>
<%@page import="com.lowagie.text.html.*"%>
<%@page import="java.awt.*"%>
<%@page import="java.io.IOException"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="com.lowagie.text.*"%>
<%@page import="com.lowagie.text.pdf.*"%>
<%@page import="com.lowagie.text.html.*"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Statement" %>
<%@page import="inventory.MakeConnection"%>

<!DOCTYPE html>

<!-- This page generates PDF for distributors -->

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% 
		String disid= request.getParameter("distributoridforinvoice");
		String proid= request.getParameter("productidforinvoice");
		String dos= request.getParameter("dateofsaleforinvoice");
		String str="pdf";
		//String DistributorId = "YCD001";
		//String ProductId = "YCP001";
		//String DateOfSale = "2020-08-08";
		String DistributorId = disid;
		String ProductId = proid;
		String DateOfSale = dos;
		//out.println(DateOfSale);
		
	    Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try
		{
		    Document document=new Document();
		    if(str.equals("pdf"))
		    {
		        response.setContentType("application/pdf");
		        PdfWriter.getInstance(document,response.getOutputStream());
		    }
		    conn= MakeConnection.getConnection();
		    String query1 = "select * from distributorinformation where DistributorId=?";          //Fetching data from table
		    ps=conn.prepareStatement(query1);                // executing query
		    ps.setString(1, DistributorId);
		    rs=ps.executeQuery();
		    
		    document.open();

		    document.add(new Paragraph("YourCart Inventory                                                                                                    INVOICE\n\n"));
		    document.add(new Paragraph("Indira Nagar\n"));
		    document.add(new Paragraph("Nashik, Maharashtra 499001\n"));
		    document.add(new Paragraph("Phone: (000) 000-0000\n"));
		    document.add(new Paragraph("---------------------------------------------------------------------------------------------------------------------------------"));
		    document.add(new Paragraph("Distributor Details: "));
		   
		    //document.addCreationDate();
		   
		    while(rs.next())
		    {
		        document.add(new Paragraph("\n"+rs.getString(2)+" "+rs.getString(3)+"\n "+rs.getString(6)+"\nEmail ID: "+rs.getString(4)+"\nPhone: "+rs.getString(5)+"\n\n"));
		    }
		    document.add(new Paragraph("---------------------------------------------------------------------------------------------------------------------------------"));
		    document.add(new Paragraph("Product Details: "));
		    String query2 = "select * from dailysale where DistributorId=? and DateOfSale=? and ProductId=?";          //Fetching data from table
		    ps=conn.prepareStatement(query2);                // executing query
		    ps.setString(1, DistributorId);
		    ps.setString(2, DateOfSale);
		    ps.setString(3, ProductId);
		    rs=ps.executeQuery();
		    
		    while(rs.next())
		    {
		        document.add(new Paragraph("\nProduct ID: "+rs.getString(1)+"\nProduct Name: "+rs.getString(2)+"\nDate Of Sale: "+rs.getString(3)+"\n No. Of Cartons: "+rs.getString(4)+"\n Price(Per Carton): "+rs.getString(5)+"\n Transaction ID: "+rs.getString(9)));
		    }
		    document.add(new Paragraph("---------------------------------------------------------------------------------------------------------------------------------"));
		    //document.add(new Paragraph("---------------------------------------------------------PAGE NO::"+document.getPageNumber()+"------------------------------------------------------"));
		    
		    document.close(); //document instance closed
		    
		}
		catch(Exception de)
		{
		        de.printStackTrace();
		            System.err.println("document: " + de.getMessage());
		           
		}
%>

</body>
</html>