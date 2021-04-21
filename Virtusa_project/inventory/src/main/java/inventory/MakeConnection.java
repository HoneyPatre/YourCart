package inventory;
import java.sql.Connection;
import java.sql.DriverManager;

public class MakeConnection {
            public static Connection getConnection() {
            Connection connection = null;
            try {
	            Class.forName("com.mysql.jdbc.Driver").newInstance();
	            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","1234");
            } catch (Exception e) {
                  e.printStackTrace();
            }
            return connection;
      }
}