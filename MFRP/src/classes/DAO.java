package classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAO {

	private static Connection con = null;

	public static Connection getConnection() throws SQLException {

		try {
			if (con == null) {
				con = DriverManager.getConnection(
						"jdbc:oracle:thin:@localhost:1521:XE", "system",
						"system");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw e;
		}

		return con;
	}

	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
