package inventory;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UploadSalesInformation extends HttpServlet {
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		PrintWriter out = res.getWriter();
		HttpSession session = req.getSession();
		String ProductId = req.getParameter("productidforsale");
		String ProductName = req.getParameter("productnameforsale");
		String DateOfSale = req.getParameter("dateofsale");
		int NoOfCartons = 	Integer.parseInt(req.getParameter("noofcartonsforsale"));
		int PricePerCarton = 	Integer.parseInt(req.getParameter("pricepercarton"));
		String DistributorId = req.getParameter("distributorid");
		String EmpUsername = req.getParameter("empunameforsale");
		String TransactionId = new String();
		
		ArrayList<String> DistributorFirstName = new ArrayList<String>();
		ArrayList<String> DistributorLastName = new ArrayList<String>();
		ArrayList<String> DistributorEmail = new ArrayList<String>();
		ArrayList<String> DistributorPhone = new ArrayList<String>();
		ArrayList<String> DistributorAddress = new ArrayList<String>();
		

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			java.sql.Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","1234");
			Statement myStmt = myConn.createStatement();
			
			
			ResultSet myRs10 = myStmt.executeQuery("select TransactionId from dailysale order by TransactionId");
			String user= new String();
			while(myRs10.next()) {
				user = myRs10.getString("TransactionId");
			}
			
			String sub = user.substring(2,user.length());
			int subint = Integer.parseInt(sub);
			subint = subint+1;
			String uniqueid = String.format("%03d",subint);
			
			uniqueid = "TO"+uniqueid;
			out.println(uniqueid);
			TransactionId = uniqueid;
			
			
			PreparedStatement myPs1 = myConn.prepareStatement("select * from distributorinformation where DistributorId = ?");
			myPs1.setString(1, DistributorId);
			ResultSet myRs = myPs1.executeQuery();
			
			while(myRs.next()) {
				DistributorFirstName.add(myRs.getString(2));
				DistributorLastName.add(myRs.getString(3));
				DistributorEmail.add(myRs.getString(4));
				long i = myRs.getLong("DistributorPhone");
				String Phone = Long.toString(i);
				DistributorPhone.add(Phone);
				DistributorAddress.add(myRs.getString(6));
			}
			
			PreparedStatement myPs = myConn.prepareStatement("insert into dailysale values(?,?,?,?,?,?,?,?,?)");
			myPs.setString(1,ProductId);
			myPs.setString(2, ProductName);
			myPs.setString(3, DateOfSale);
			myPs.setInt(4, NoOfCartons);
			myPs.setInt(5, PricePerCarton);
			myPs.setString(6, DistributorId);
			myPs.setString(7, EmpUsername);
			myPs.setString(8, null);
			myPs.setString(9, TransactionId);
			int i = myPs.executeUpdate();
            if(i > 0) {
            	RequestDispatcher rd = req.getRequestDispatcher("alertgenerator");
				rd.forward(req, res);
            }
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		
		String to = DistributorEmail.get(0);
        String subject = "YourCart Digital Invoice";
        String message = "YourCart Digital Invoice\n\n"+"Indira Nagar\nNashik, Maharashtra 499001\nPhone:(000) 000-000\n\n"+"-----------------------------------------------------------------------\n"+"Distributor details:\n"+DistributorFirstName.get(0)+" "+DistributorLastName.get(0)+"\n"+DistributorPhone.get(0)+"\n"+DistributorEmail.get(0)+"\n"+DistributorAddress.get(0)+"\n\n\n-----------------------------------------------------------------------\n"+"Product Details:\n"+"Product ID: "+ProductId+"\nProduct Name: "+ProductName+"\nDate Of Sale: "+DateOfSale+"\nNo. of Cartons: "+NoOfCartons+"\nPrice(Per Carton): "+PricePerCarton+"\nTransaction ID: "+TransactionId;
        
        String user = "yourcartinventory@gmail.com";
        String pass = "yourcart@123";
        
        SendMail.send(to,subject, message, user, pass);
		
		
	}
}
