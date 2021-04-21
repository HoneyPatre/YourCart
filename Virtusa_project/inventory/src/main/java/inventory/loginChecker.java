package inventory;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class loginChecker extends HttpServlet
{
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String uname = req.getParameter("unameC");
		String psw = req.getParameter("pswC");
		boolean isAuthorizedUser = false;
		PrintWriter out = res.getWriter();
		out.println(psw);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			java.sql.Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","1234"); 
			Statement myStmt = myConn.createStatement();
			ResultSet myRs = myStmt.executeQuery("select * from checkerinformation");
			while(myRs.next()) {
				String username = myRs.getString("Username");
				String password = myRs.getString("Password");
				String firstname = myRs.getString("Firstname");
				String lastname = myRs.getString("Lastname");
				String email = myRs.getString("Email");
				String phone = myRs.getString("Phone");
				
				HttpSession session = req.getSession();
				
				if(uname.equals(username) && psw.equals(password)) {
					isAuthorizedUser = true;
					System.out.println("something is  not wrong");
					session.setAttribute("firstnameC", firstname);
					session.setAttribute("lastnameC", lastname);
					session.setAttribute("emailC", email);
					session.setAttribute("phoneC", phone);
					RequestDispatcher rd = req.getRequestDispatcher("DashboardForChecker.jsp");
					rd.forward(req, res);
					break;
				}
			}
			if(isAuthorizedUser == false) {
				System.out.println("something is wrong");
				RequestDispatcher rd = req.getRequestDispatcher("logout.html");
				rd.forward(req, res);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
		
	}
}
