package conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static Connection initializeDatabase() throws SQLException{
		// Initialize all the information regarding 
		// Database Connection
		
		String dbDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String dbURL = "jdbc:sqlserver://LAPTOP-KHS2AVOG\\SQLEXPRESS01:1433;databaseName=QUANLYBANSACHONLINE;integratedSecurity=true"; 
		// Database name to access 
		//String dbName = "QUANLYBANSACHONLINE"; 
		String dbUsername = "sa";
		String dbPassword = "0945926575a"; 
		//String connectionURL = dbURL + "/" + dbName;
		Connection conn = null;
		try { 
			Class.forName(dbDriver);
			conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
			System.out.println("connect successfully!");
		}catch (Exception ex) {
			System.out.println("connect failure!" ) ; 
			ex.printStackTrace();
		}
		return conn; 
	}
	public static void main(String[] args) throws SQLException {
		Connection connection = DBConnection.initializeDatabase();
		
	}
}
