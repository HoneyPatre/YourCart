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

public class updateOutgoingData extends HttpServlet {

	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		PrintWriter out = res.getWriter();
		HttpSession session = req.getSession();
		String TransactionId = (String) session.getAttribute("transactionidupload");
		out.print(TransactionId);
		String ProductId = req.getParameter("productidforoutgoupdate");
		String ProductName = req.getParameter("productnameforoutgoupdate");
		String DateOfSale = req.getParameter("dateofsale");
		int NoOfCartons = 	Integer.parseInt(req.getParameter("noofcartonsforoutgoupdate"));
		int PricePerCarton = 	Integer.parseInt(req.getParameter("pricepercartonforoutgoupdate"));
		String DistributorId = req.getParameter("distributoridforoutgoupdate");
		String EmpUsername = req.getParameter("empunameforoutgoupdate");
		out.print(ProductId);
		out.print(ProductName);
		out.print(DateOfSale);
		out.print(NoOfCartons);
		out.print(PricePerCarton);
		out.print(DistributorId);
		out.print(EmpUsername);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			java.sql.Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","1234");
			Statement myStmt = myConn.createStatement();
			
			
			PreparedStatement myPs = myConn.prepareStatement("update dailysale set ProductId=?, ProductName=?, DateOfSale=?, NoOfCartons=?, PricePerCarton=?,DistributorId=?,Username=?,IsVerified=NULL where TransactionId=?");
			myPs.setString(1,ProductId);
			myPs.setString(2, ProductName);
			myPs.setString(3, DateOfSale);
			myPs.setInt(4, NoOfCartons);
			myPs.setInt(5, PricePerCarton);
			myPs.setString(6, DistributorId);
			myPs.setString(7, EmpUsername);
			myPs.setString(8, TransactionId);
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
