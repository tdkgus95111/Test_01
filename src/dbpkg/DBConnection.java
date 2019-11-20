package dbpkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnection {
	public Connection getConnection() throws SQLException{
		String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
		String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
		try {
			Class.forName(jdbc_driver);
			Connection conn = DriverManager.getConnection(db_url, "system", "1111");
			return conn;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void closeDBResources(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void closeDBResources(PreparedStatement pstmt, Connection conn) {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
}
