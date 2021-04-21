package inventory;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// This is a file which is called by every file which has to redirect to profile

public class AlertGenerator extends HttpServlet {
	public void doDelete(HttpServletRequest req, HttpServletResponse res)throws ServletException,java.io.IOException{}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		
		PrintWriter out = res.getWriter();
		HttpSession session = req.getSession();
		ArrayList<String> ProductNamesToBeAlerted = new ArrayList<String>();  
		ArrayList<Integer> NoOfItemsToBeAlerted = new ArrayList<Integer>();
		ArrayList<String> NameOfProductsGettingExpired = new ArrayList<String>();  
		ArrayList<Integer> NoOfCartonsGettingExpired = new ArrayList<Integer>();
		
		ArrayList<String> ProductNamesToBeAlerted1 = new ArrayList<String>();
		//ArrayList<String> NameOfProductsGettingExpired1 = new ArrayList<String>();
		
		try {	
			Class.forName("com.mysql.cj.jdbc.Driver");
			java.sql.Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","1234");
			Statement myStmt = myConn.createStatement();
			boolean flag = false;
			
			
			int noOfTotalProducts = 0;
			LocalDate CurrentDate= java.time.LocalDate.now();
			String CurrentDate1 = CurrentDate.toString();
			
			ResultSet myRs4=myStmt.executeQuery("select distinct DateOfConsideration from dailystockremaining");
			while(myRs4.next()) {
				if(CurrentDate1.equals(myRs4.getString(1))) {
					flag = true;
				}
			}
			if(flag==true) {
				out.println("today's data already uploaded so it must be deleted first");
				PreparedStatement myPs3 = myConn.prepareStatement("delete from dailystockremaining where DateOfConsideration = ?");
				myPs3.setString(1, CurrentDate1);
				int j = myPs3.executeUpdate();
	            if(j > 0) {
	            	out.println("data deleted"+j);
	            }
			}
			
			ResultSet myRs=myStmt.executeQuery("select count(*) from productdetail");
			while(myRs.next()) {
				noOfTotalProducts = myRs.getInt(1);
			}
			
			
			String ProductSet[]= new String[noOfTotalProducts];
			String ProductNameSet[]= new String[noOfTotalProducts];
			String ProductId = new String();
			String ProductName = new String();
			String DateOfConsideration1 = new String();
			
			ResultSet myRs3=myStmt.executeQuery("select * from productdetail");
			int i=0;
			while(myRs3.next()&&i<noOfTotalProducts) {
				ProductSet[i] = myRs3.getString(1);
				ProductNameSet[i] = myRs3.getString(2);
				i++;
			}
			
			StringBuilder builder = new StringBuilder();
			LocalDate startDate = LocalDate.parse("2020-08-01");
			LocalDate endDate = LocalDate.parse(CurrentDate1);
			//LocalDate endDate = LocalDate.parse("2020-08-04");
			LocalDate NextDate= endDate.plusDays(1);
			LocalDate d = startDate;
			String DateOfConsideration = new String();
			
			int NoOfCartons[] = new int[noOfTotalProducts];
			
			while (d.isBefore(endDate) || d.equals(endDate) || d.equals(NextDate)) {

				  builder.append(d.format(DateTimeFormatter.ISO_DATE)).append(" ");
				  DateOfConsideration = builder.toString();
				  builder.setLength(0);
				  d = d.plusDays(1);
			  
					for(int k=0; k<noOfTotalProducts; k++) {
							String abc = ProductSet[k];
							String ProductNameForStock = ProductNameSet[k];
							String querydailystockfill = "select * from dailystockfill where DateOfArrival = ? and ProductId = ?";
							PreparedStatement myPs1 = myConn.prepareStatement(querydailystockfill);
							String querydailysale = "select * from dailysale where DateOfSale = ? and ProductId = ?";
							PreparedStatement myPs2 = myConn.prepareStatement(querydailysale);
							myPs1.setString(1,DateOfConsideration);
							myPs2.setString(1,DateOfConsideration);
							myPs1.setString(2,abc);
							myPs2.setString(2,abc);
							ResultSet myRs1 = myPs1.executeQuery();
							int TotalStock = 0;
							while(myRs1.next()) {
								TotalStock = TotalStock + myRs1.getInt("NoOfCartons");
							}
							ResultSet myRs2 = myPs2.executeQuery();
							int TotalSale = 0;
							while(myRs2.next()) {
								TotalSale = TotalSale + myRs2.getInt("NoOfCartons");
							}
							
							ProductId = abc;
							ProductName = ProductNameForStock;
							DateOfConsideration1 = DateOfConsideration;
							NoOfCartons[k] = NoOfCartons[k] + TotalStock - TotalSale;
							
							
							if(d.equals(NextDate)) {
								
								PreparedStatement myPs = myConn.prepareStatement("insert into dailystockremaining values(?,?,?,?)");
								myPs.setString(1, ProductId);
								myPs.setString(2, ProductName);
								myPs.setString(3, DateOfConsideration1);
								myPs.setInt(4, NoOfCartons[k]);
								
								
								
								int j = myPs.executeUpdate();
					            if(j > 0) {
					            	out.println("success");
					            }
					            
							}
							else {
								//out.println("today's data already uploaded");
							}
							
					}
					
			}
			
				String alertquery = "select * from dailystockremaining where DateOfConsideration = ?";
				PreparedStatement myPs3 = myConn.prepareStatement(alertquery);
				myPs3.setString(1, CurrentDate1);
				ResultSet myRs5 = myPs3.executeQuery();
				while(myRs5.next()) {
					int noOfCartonsLeft = myRs5.getInt(4);
					String ProductNameOfItemsLeft = myRs5.getString(2);
					if(noOfCartonsLeft<60 ) {
						ProductNamesToBeAlerted.add(ProductNameOfItemsLeft);
						NoOfItemsToBeAlerted.add(noOfCartonsLeft);
					}
					if(noOfCartonsLeft<30 ) {
						ProductNamesToBeAlerted1.add(ProductNameOfItemsLeft);
					}
				}
				
			req.setAttribute("productNamesToBeAlerted", ProductNamesToBeAlerted);
			req.setAttribute("noOfItemsToBeAlerted", NoOfItemsToBeAlerted);
			
			//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
			ResultSet myRs8 = myStmt.executeQuery("select count(*) from damagegoods");
			int countOfDamageGood = 0;
			while(myRs8.next()) {
				countOfDamageGood = myRs8.getInt(1);
			}
			String countOfDamageGoods = Integer.toString(countOfDamageGood);
			req.setAttribute("countOfDamageGoods", countOfDamageGoods);
			
			/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
			LocalDate ExpiryDate= endDate.plusDays(2);
			String ExpiryDate1 = ExpiryDate.toString();
			String alertexpiryquery = "select * from dailystockfill where ExpiryDate = ?";
			String alertexpiryquerycount = "select count(*) from dailystockfill where ExpiryDate = ?";
			
			PreparedStatement myPs5 = myConn.prepareStatement(alertexpiryquerycount);
			myPs5.setString(1, ExpiryDate1);
			ResultSet myRs7=myPs5.executeQuery();
			int NoOfCartonsGettingExpired1 = 0;
			while(myRs7.next()){
				NoOfCartonsGettingExpired1 = myRs7.getInt(1);
			}
			out.print(NoOfCartonsGettingExpired1);
			
			PreparedStatement myPs4 = myConn.prepareStatement(alertexpiryquery);
			myPs4.setString(1, ExpiryDate1);
			ResultSet myRs6=myPs4.executeQuery();
			
			
			int p = 0;
			while(myRs6.next()&&p<NoOfCartonsGettingExpired1) {
				NameOfProductsGettingExpired.add(myRs6.getString(2));
				NoOfCartonsGettingExpired.add(myRs6.getInt(4));
			}
			
			for(int j=0; j<NoOfCartonsGettingExpired1; j++) {
				//out.println(NameOfProductsGettingExpired[j]);
				//out.println(NoOfCartonsGettingExpired[j]);
			}
			
			req.setAttribute("nameOfProductsGettingExpired", NameOfProductsGettingExpired);
			req.setAttribute("noOfCartonsGettingExpired", NoOfCartonsGettingExpired);
						
        	RequestDispatcher rd = req.getRequestDispatcher("profile.jsp");
			rd.forward(req, res);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss");
		String strDate= formatter.format(date);
		
		if(ProductNamesToBeAlerted1.isEmpty()==false && strDate.equals("16:20:00")) {
			String to = "honeypatre019@gmail.com";
	        String subject = "YourCart Alert";
	        String message = "Dear Administrator,\n\nProducts needing a refill :\n"+ProductNamesToBeAlerted1.toString()+"\n\nProducts about to expire: \n"+NameOfProductsGettingExpired.toString();
	        String user = "yourcartinventory@gmail.com";
	        String pass = "yourcart@123";
	        
	        SendMail.send(to,subject, message, user, pass);
		}
				
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
}
