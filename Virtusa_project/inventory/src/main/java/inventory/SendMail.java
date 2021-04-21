package inventory;

import java.io.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class SendMail{
	
    public static void send(String to, String sub, 
                         String msg, final String user,final String pass)
    { 
       System.out.println("function called ");
    	
        Properties props = System.getProperties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.user", user);
		props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");		
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
    

        Session session = Session.getDefaultInstance(props,new javax.mail.Authenticator()
        {
            protected PasswordAuthentication getPasswordAuthentication()
            {
            	 System.out.print("password correct");
  	 	         return new PasswordAuthentication(user,pass); 
            }
        });

        try {
        	
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
            message.setSubject(sub);
            message.setText(msg);

            Transport transport = session.getTransport("smtp");
    		transport.connect("smtp.gmail.com", user, pass);
            Transport.send(message);
            transport.close();
    		System.out.println("success");
        }
        catch(AddressException ae){
    		ae.printStackTrace();
    	}
        catch(MessagingException me){
    		me.printStackTrace();
    	}
        catch(Exception e) {
    	     e.printStackTrace();
        }
    }  
}














