package classes;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.StringTokenizer;

import pojo.loginpojo;
import pojo.transactionpojo;

public class transactionDO {

	public String generateTxnId() throws SQLException {

		String txnId = null;
		try {

			Connection con = DAO.getConnection();
			Statement st = con.createStatement();
			int n = 100;
			String q = "select * from transaction";
			ResultSet rs = st.executeQuery(q);
			while (rs.next()) {
				n++;
			}
			txnId = "Txn" + n;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw e;
		}
		return txnId;

	}

	public boolean trasact(loginpojo l, transactionpojo tp) throws SQLException {
		boolean check = false;
		try {

			Connection con = DAO.getConnection();
			Statement st = con.createStatement();
			StringTokenizer stoken = new StringTokenizer(tp.getTo_account(),
					"-");
			String to_account = stoken.nextToken();
			// insert the debit money in transaction table
			if (tp.getTransaction_type().equalsIgnoreCase("DEBIT")) {
				String query = "insert into transaction values("
						+ l.getAccount_number() + ",'" + tp.getTxnId() + "','"
						+ tp.getTransactiondate() + "','cash','"
						+ tp.getTransaction_type() + "'," + tp.getAmount()
						+ ",'" + to_account + "')";
				int n = st.executeUpdate(query);

				int n1 = 0;
				int n2 = 0;
				if (tp.getTransaction_type().equalsIgnoreCase("DEBIT")) {
					String debit = "update account_master set initial_Deposit_amount=(select initial_deposit_amount-"
							+ tp.getAmount()
							+ " from account_master where account_number="
							+ l.getAccount_number()
							+ ") where account_number="
							+ l.getAccount_number();
					n1 = st.executeUpdate(debit);
					String credit = "update account_master set initial_Deposit_amount=(select initial_deposit_amount+"
							+ tp.getAmount()
							+ " from account_master where account_number="
							+ to_account
							+ ") where account_number="
							+ to_account;
					n2 = st.executeUpdate(credit);
				}
				if (n != 1 && n1 != 1 && n2 != 1) {
					check = false;
				} else {
					check = true;
				}
			}

			else {
				String query = "insert into transaction values("
						+ l.getAccount_number() + ",'" + tp.getTxnId() + "','"
						+ tp.getTransactiondate() + "','cash','"
						+ tp.getTransaction_type() + "'," + tp.getAmount()
						+ ",'loan to bank')";
				int n = st.executeUpdate(query);
				String loanEmiQuery = "select * from loan where customer_id='"
						+ l.getCustomer_id() + "'";
				ResultSet rs = st.executeQuery(loanEmiQuery);
				if (rs.next()) {
					check = true;
				} else {
					check = false;
				}
				if (check == true) {
					String loanpaid = "update account_master set initial_Deposit_amount=(select initial_deposit_amount-"
							+ tp.getAmount()
							+ " from account_master where account_number="
							+ l.getAccount_number()
							+ ") where account_number="
							+ l.getAccount_number();
					int n3 = 0;
					n3 = st.executeUpdate(loanpaid);
					if (n != 0 && n3 != 0) {
						check = false;
					} else {
						check = true;
					}
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw e;
		}

		return check;
	}

	public long account_balance(loginpojo l) throws SQLException {
		long balance = 0l;
		try {

			Connection con = DAO.getConnection();
			Statement st = con.createStatement();

			String query = "select initial_deposit_amount from account_master where account_number="
					+ l.getAccount_number();
			ResultSet rs = st.executeQuery(query);
			if (rs.next()) {
				balance = rs.getLong(1);
			} else {
				balance = 0l;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw e;
		}

		return balance;
	}

	public ArrayList<String> getAccountNumbers(long account_number) throws SQLException {
		ArrayList<String> list = new ArrayList<String>();
		try {

			Connection con = DAO.getConnection();
			Statement st = con.createStatement();

			String query = "select am.account_number,cm.name from account_master am join customer_master cm on cm.customer_id=am.customer_id where account_number not in("
					+ account_number + ")";
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				String account = rs.getLong(1) + "-" + rs.getString(2);
				list.add(account);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw e;
		}

		return list;
	}

	public ArrayList<String> getLoanDetails(String customerid) throws SQLException {
		ArrayList<String> loan = new ArrayList<String>();
		try {

			Connection con = DAO.getConnection();
			Statement st = con.createStatement();

			String query = "select loan_id,emi,loan_type from loan where customer_id='"
					+ customerid + "'";
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				String loanDetail = rs.getString(1) + "-" + rs.getLong(2) + "-"
						+ rs.getString(3);
				loan.add(loanDetail);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw e;
		}

		return loan;
	}
}
