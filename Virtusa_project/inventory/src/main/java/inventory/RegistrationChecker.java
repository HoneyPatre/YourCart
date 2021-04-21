package inventory;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RegistrationChecker extends HttpServlet{
		
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String fname = (String) session.getAttribute("fnameC");
		String lname = (String) session.getAttribute("lnameC");
		String email = (String) session.getAttribute("emailC");
		String phone = (String) session.getAttribute("phoneC");
		String address = (String) session.getAttribute("addressC");
		String psw = (String) session.getAttribute("pswC");
		
		String enteredotp = req.getParameter("otpenteredC");
		String originalotp = (String) session.getAttribute("originalotpC");
		boolean isAuthorizedUser = false;
		PrintWriter out = res.getWriter();
		out.println(enteredotp);
		out.println(originalotp);
		try {
			
			if(enteredotp.equals(originalotp)) {
				isAuthorizedUser = true;
			}
			
			if(isAuthorizedUser) {
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				java.sql.Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","1234"); 
				Statement myStmt = myConn.createStatement();
				
				ResultSet myRs = myStmt.executeQuery("select Username from checkerinformation");
				String user= new String();
				while(myRs.next()) {
					user = myRs.getString("Username");	
				}
				String sub = user.substring(3,user.length());
				int subint = Integer.parseInt(sub);
				subint = subint+1;
				String uniqueid = String.format("%03d",subint);
				uniqueid = "YCC"+uniqueid;
				out.println(uniqueid);
				req.setAttribute("employeeidC", uniqueid);
				
				PreparedStatement myPs = myConn.prepareStatement("insert into checkerinformation values(?,?,?,?,?,?,?)");
				myPs.setString(1,uniqueid );
				myPs.setString(2, psw );
				myPs.setString(3, fname);
				myPs.setString(4, lname);
				myPs.setString(5, email);
				myPs.setString(6, phone);
				myPs.setString(7, address);
				if(myPs.executeUpdate()>0) {
					RequestDispatcher rd = req.getRequestDispatcher("RegistrationCompleteChecker.jsp");
					rd.forward(req, res);
					out.println("success");
				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
