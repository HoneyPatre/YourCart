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

public class UploadStockInformation extends HttpServlet {
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		PrintWriter out = res.getWriter();
		HttpSession session = req.getSession();
		String ProductId = req.getParameter("productid");
		String ProductName = req.getParameter("productname");
		String DateOfArrival = req.getParameter("dateofarrival");
		int NoOfCartons = 	Integer.parseInt(req.getParameter("noofcartons"));
		int PricePerCarton = 	Integer.parseInt(req.getParameter("pricepercarton"));
		String ExpiryDate = req.getParameter("expirydate");
		String VendorId = req.getParameter("vendorid");
		String EmpUsername = req.getParameter("empuname");
		String TransactionId = new String();
		
		ArrayList<String> VendorFirstName = new ArrayList<String>();
		ArrayList<String> VendorLastName = new ArrayList<String>();
		ArrayList<String> VendorEmail = new ArrayList<String>();
		ArrayList<String> VendorPhone = new ArrayList<String>();
		ArrayList<String> VendorAddress = new ArrayList<String>();
		

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			java.sql.Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","1234");
			Statement myStmt = myConn.createStatement();
			
			ResultSet myRs10 = myStmt.executeQuery("select TransactionId from dailystockfill order by TransactionId");
			String user= new String();
			while(myRs10.next()) {
				user = myRs10.getString("TransactionId");
			}
			
			String sub = user.substring(2,user.length());
			int subint = Integer.parseInt(sub);
			subint = subint+1;
			String uniqueid = String.format("%03d",subint);
			
			uniqueid = "TI"+uniqueid;
			out.println(uniqueid);
			TransactionId = uniqueid;
			
			PreparedStatement myPs1 = myConn.prepareStatement("select * from vendorinformation where VendorId = ?");
			myPs1.setString(1, VendorId);
			ResultSet myRs = myPs1.executeQuery();
			
			while(myRs.next()) {
				VendorFirstName.add(myRs.getString(2));
				VendorLastName.add(myRs.getString(3));
				VendorEmail.add(myRs.getString(4));
				long i = myRs.getLong("VendorPhone");
				String Phone = Long.toString(i);
				VendorPhone.add(Phone);
				VendorAddress.add(myRs.getString(6));
			}
			
			
			PreparedStatement myPs = myConn.prepareStatement("insert into dailystockfill values(?,?,?,?,?,?,?,?,?,?)");
			myPs.setString(1,ProductId);
			myPs.setString(2, ProductName);
			myPs.setString(3, DateOfArrival);
			myPs.setInt(4, NoOfCartons);
			myPs.setInt(5, PricePerCarton);
			myPs.setString(6, ExpiryDate);
			myPs.setString(7, VendorId);
			myPs.setString(8, EmpUsername);
			myPs.setString(9, null);
			myPs.setString(10, TransactionId);
			int i = myPs.executeUpdate();
            if(i > 0) {
            	RequestDispatcher rd = req.getRequestDispatcher("alertgenerator");
				rd.forward(req, res);
            }
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		String to = VendorEmail.get(0);
        String subject = "YourCart Digital Invoice";
        String message = "YourCart Digital Invoice\n\n"+"Indira Nagar\nNashik, Maharashtra 499001\nPhone:(000) 000-000\n\n"+"-----------------------------------------------------------------------\n"+"Vendor details:\n"+VendorFirstName.get(0)+" "+VendorLastName.get(0)+"\n"+VendorPhone.get(0)+"\n"+VendorEmail.get(0)+"\n"+VendorAddress.get(0)+"\n\n\n-----------------------------------------------------------------------\n"+"Product Details:\n"+"Product ID: "+ProductId+"\nProduct Name: "+ProductName+"\nDate Of Sale: "+DateOfArrival+"\nNo. of Cartons: "+NoOfCartons+"\nPrice(Per Carton): "+PricePerCarton+"\nTransaction ID:"+TransactionId;
        
        String user = "yourcartinventory@gmail.com";
        String pass = "yourcart@123";
        
        SendMail.send(to,subject, message, user, pass);
		
	}
}
