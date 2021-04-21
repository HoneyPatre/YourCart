package inventory;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Reader;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.opencsv.CSVReader;

//this file uploads csv to database dailystockfill

@WebServlet(name = "upload", urlPatterns = { "/upload" })
@MultipartConfig
public class UploadToServlet extends HttpServlet {

    public UploadToServlet() {
        super();
    }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
	    PrintWriter out = response.getWriter();
        Part filePart = request.getPart("file"); 
        InputStream fileContent = filePart.getInputStream();
        int counter=0;
        
        Reader in = new InputStreamReader(fileContent);

        CSVReader reader;
        Iterator<String[]> iterator;
        ArrayList<ArrayList<String>> outer = new ArrayList<ArrayList<String>>();
        
        try {
            reader = new CSVReader(new InputStreamReader(fileContent));
            iterator = reader.iterator();
            String[] nextline;
            int noOfRows = 0;
            
            while((nextline = reader.readNext())!=null) {
            	
            	String[] row = iterator.next();
                ArrayList<String> inner = new ArrayList();
            	for(int i = 0; i < row.length; i++){
            				inner.add(row[i]);
            				noOfRows++;
                }
                //out.println(inner);
                outer.add(inner);
            } 
        }catch(Exception e) {}
        in.close();
        
        //out.println(outer);
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        for(int j=1; j<outer.size();j++) {
        	
        	ArrayList<String> resultArray = new ArrayList<String>();
        	resultArray = outer.get(j);
        	String ProductID = (String) resultArray.get(0);
        	out.println("ProductId :"+ProductID);
        	String ProductName = (String) resultArray.get(1);
        	out.println("ProductName :"+ProductName);
        	String DateOfArrival = (String) resultArray.get(2);
        	out.println("DateOfArrival :"+DateOfArrival);
        	int NoOfCartons = Integer.parseInt(resultArray.get(3));
        	out.println("NoOfCartons :"+NoOfCartons);
        	int PricePerCarton = Integer.parseInt(resultArray.get(4));
        	out.println("PricePerCarton :"+PricePerCarton);
        	String VendorId = (String) resultArray.get(5);
        	out.println("VendorId :"+VendorId);
        	String ExpiryDate = (String) resultArray.get(6);
        	out.println("ExpiryDate :"+ExpiryDate);
        	String EmpUsername = (String) resultArray.get(7);
        	out.println("EmpUsername :"+EmpUsername);
        	
        	try {
    			Class.forName("com.mysql.cj.jdbc.Driver");
    			java.sql.Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","1234");
    			Statement myStmt = myConn.createStatement();
    			
    			
    			ResultSet myRs = myStmt.executeQuery("select TransactionId from dailystockfill order by TransactionId");
    			String user= new String();
    			while(myRs.next()) {
    				user = myRs.getString("TransactionId");
    			}
    			
    			String sub = user.substring(2,user.length());
    			int subint = Integer.parseInt(sub);
    			subint = subint+1;
    			String uniqueid = String.format("%03d",subint);
    			
    			uniqueid = "TI"+uniqueid;
    			out.println(uniqueid);
    			
    			String TransactionId = uniqueid;
    			
    			
    			PreparedStatement myPs = myConn.prepareStatement("insert into dailystockfill values(?,?,?,?,?,?,?,?,?,?)");
    			myPs.setString(1,ProductID);
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
                	counter++;
                	out.println("data uploaded------------------------------------------------");	
                }
    		} catch (ClassNotFoundException | SQLException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
        	
        	out.println(counter);
        	if(counter==outer.size()-1) {
        		RequestDispatcher rd = request.getRequestDispatcher("alertgenerator");
    			rd.forward(request, response);
        	}
        	
        }
        
        
        
        
        
        
        
    }
   	 
}
