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

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UploadNewDistributor extends HttpServlet {
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		PrintWriter out = res.getWriter();
		HttpSession session = req.getSession();
		String distributorid = req.getParameter("distributorid");
		String distributorfname = req.getParameter("distributorfname");
		String distributorlname = req.getParameter("distributorlname");
		String distributoremail = req.getParameter("distributoremail");
		String distributorphone = req.getParameter("distributorphone");
		String distributoraddress = req.getParameter("distributoraddress");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			java.sql.Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","1234");
			Statement myStmt = myConn.createStatement();
			PreparedStatement myPs = myConn.prepareStatement("insert into distributorinformation values(?,?,?,?,?,?)");
			
			myPs.setString(1,distributorid);
			myPs.setString(2,distributorfname);
			myPs.setString(3,distributorlname);
			myPs.setString(4,distributoremail);
			myPs.setString(5,distributorphone);
			myPs.setString(6,distributoraddress);
			
			int i = myPs.executeUpdate();
            if(i > 0) {
            	RequestDispatcher rd = req.getRequestDispatcher("DashboardForChecker.jsp");
				rd.forward(req, res);
            }
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
