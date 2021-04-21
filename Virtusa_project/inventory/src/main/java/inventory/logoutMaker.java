package inventory;

import java.io.IOException;  
import java.io.PrintWriter;  
  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  



public class logoutMaker extends HttpServlet {  
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        	HttpSession session=request.getSession();
            response.setContentType("text/html");  
            PrintWriter out=response.getWriter();  
             
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            session.invalidate();
            response.sendRedirect(request.getContextPath() + "/index.jsp");
              
            out.print("You are successfully logged out!");  
              
            out.close();  
    }  
}  