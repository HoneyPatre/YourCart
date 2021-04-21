package inventory;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class updateIncomingData extends HttpServlet {

	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		PrintWriter out = res.getWriter();
		HttpSession session = req.getSession();
		String TransactionId = (String) session.getAttribute("transactionidupload");
		out.print(TransactionId);
		String ProductId = req.getParameter("productidforincomeupdate");
		String ProductName = req.getParameter("productnameforincomeupdate");
		String DateOfArrival = req.getParameter("dateofarrival");
		int NoOfCartons = 	Integer.parseInt(req.getParameter("noofcartonsforincomeupdate"));
		int PricePerCarton = 	Integer.parseInt(req.getParameter("pricepercartonforincomeupdate"));
		String ExpiryDate = req.getParameter("expirydate");
		String VendorId = req.getParameter("vendoridforincomeupdate");
		String EmpUsername = req.getParameter("empunameforincomeupdate");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			java.sql.Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","1234");
			Statement myStmt = myConn.createStatement();
			
			
			PreparedStatement myPs = myConn.prepareStatement("update dailystockfill set ProductId=?, ProductName=?, DateOfArrival=?, NoOfCartons=?, PricePerCarton=?,ExpiryDate=?,VendorId=?,Username=?,IsVerified=NULL where TransactionId=?");
			myPs.setString(1,ProductId);
			myPs.setString(2, ProductName);
			myPs.setString(3, DateOfArrival);
			myPs.setInt(4, NoOfCartons);
			myPs.setInt(5, PricePerCarton);
			myPs.setString(6, ExpiryDate);
			myPs.setString(7, VendorId);
			myPs.setString(8, EmpUsername);
			myPs.setString(9, TransactionId);
			int i = myPs.executeUpdate();
            if(i > 0) {
            	out.println("-----------------------");
            	RequestDispatcher rd = req.getRequestDispatcher("alertgenerator");
				rd.forward(req, res);
            }
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
