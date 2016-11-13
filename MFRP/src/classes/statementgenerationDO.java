package classes;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import pojo.loginpojo;
import pojo.transactionpojo;

public class statementgenerationDO {

	public ArrayList<transactionpojo> generateAll(loginpojo l, String from,
			String to) throws SQLException {
		// TODO Auto-generated method stub
		ArrayList<transactionpojo> ar = new ArrayList<transactionpojo>();

		try {

			Connection con = DAO.getConnection();
			Statement st = con.createStatement();
			String getdebit = "select * from transaction where account_number="
					+ l.getAccount_number() + " and dot between '" + from
					+ "' and '" + to + "'";
			ResultSet rs = st.executeQuery(getdebit);

			String getcredit = "select * from transaction where to_account_number="
					+ l.getAccount_number()
					+ " and dot between '"
					+ from
					+ "' and '" + to + "'";

			while (rs.next()) {
				transactionpojo t = new transactionpojo();
				t.setAmount(rs.getString(6));
				t.setTransaction_type(rs.getString(5));
				DateFormat f= new SimpleDateFormat("dd-MMM-yyyy");
				t.setTransactiondate(f.format(rs.getDate(3)));
				t.setTxnId(rs.getString(2));
				t.setTo_account(rs.getString(7));
				ar.add(t);
			}

			ResultSet rs1 = st.executeQuery(getcredit);

			while (rs1.next()) {
				transactionpojo t = new transactionpojo();
				t.setAmount(rs1.getString(6));
				t.setTransaction_type("CREDIT");
				t.setTransactiondate(rs1.getString(3));
				t.setTxnId(rs1.getString(2));
				t.setTo_account(rs1.getString(1));
				ar.add(t);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw e;
		}

		return ar;
	}

}
