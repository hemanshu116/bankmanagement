package classes;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import pojo.loginpojo;

public class LoginDO {

	public boolean validate(loginpojo l) throws SQLException {
		boolean check = false;

		try {

			Connection con = DAO.getConnection();
			Statement st = con.createStatement();
			String query = "select customer_master"
					+ "where customer_id='"
					+ l.getCustomer_id()
					+ "' "
					+ "and password='" + l.getPassword() + "'";
			int n=st.executeUpdate(query);
			if (n==1) {
			
				check = true;
			} else {
				check = false;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw e;
		}
		return check;
	}
}
