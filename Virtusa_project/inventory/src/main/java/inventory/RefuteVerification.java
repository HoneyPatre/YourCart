package inventory;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RefuteVerification extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter out = res.getWriter();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			java.sql.Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","1234");
			Statement myStmt = myConn.createStatement();
			
			String transactionid = req.getParameter("myText");
			System.out.println(transactionid);
			boolean isIncoming = transactionid.contains("TI");
			boolean isOutgoing = transactionid.contains("TO");
			if(isIncoming){
				String updatequery = "update dailystockfill set IsVerified = null where TransactionID= ?";
				PreparedStatement myPs4 = myConn.prepareStatement(updatequery);
				myPs4.setString(1, transactionid);
				if(myPs4.executeUpdate()>0){
					out.println("Data of incoming stock refuted");
				}
			}
			else if(isOutgoing){
				String updatequery = "update dailysale set IsVerified = null where TransactionID= ?";
				PreparedStatement myPs4 = myConn.prepareStatement(updatequery);
				myPs4.setString(1, transactionid);
				if(myPs4.executeUpdate()>0){
					out.println("Data of outgoing stock refuted");
				}
			}
			else{
					out.println("Data refute was inturrpted");
				}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher rd = req.getRequestDispatcher("DashboardForChecker.jsp");
		rd.forward(req, res);
	}
}
