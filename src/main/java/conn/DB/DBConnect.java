package conn.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	 private static Connection conn;
     public static Connection getConn() {
   	  try {
   		  Class.forName("com.mysql.cj.jdbc.Driver");
   		  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Callege_Library_Managment","root","ravi@rupa@1234");
   	  }catch(Exception e) {
   		  e.printStackTrace();
   	  }
		return conn;
     }
}
