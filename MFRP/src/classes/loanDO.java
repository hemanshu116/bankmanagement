package classes;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import pojo.educationalpojo;
import pojo.loanpojo;
import pojo.loginpojo;
import pojo.perosnalpojo;
import pojo.transactionpojo;

public class loanDO  {
	public String generateloanID() throws SQLException {
		String loanid = null;

		try {

			Connection con = DAO.getConnection();
			Statement st = con.createStatement();
			String q = "select * from loan";
			ResultSet rs = st.executeQuery(q);
			int n = 100;
			while (rs.next()) {
				n++;
			}
			loanid = "L-" + n;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw e;
		}
		return loanid;
	}

	public boolean applyloaneducational(loanpojo lp, educationalpojo ep,
			loginpojo l) throws SQLException {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {

			Connection con = DAO.getConnection();
			Statement st = con.createStatement();
			String q = "insert into loan values('" + lp.getLoan_id() + "','"
					+ l.getCustomer_id() + "','" + lp.getLoan_type() + "',"
					+ lp.getLoan_ammount() + ",'" + lp.getLoan_apply_date()
					+ "','" + lp.getLoan_issue_date() + "'," + lp.getRoi()
					+ ",'" + lp.getDuration_of_loan() + "'," + lp.getEMI()
					+ "," + lp.getLoanpaid() + ")";

			int n = st.executeUpdate(q);
			if (n != 1) {
				flag = false;
				return flag;
			} else {
				flag = true;
				String query = "insert into educational_loan values('"
						+ lp.getLoan_id() + "','" + l.getCustomer_id() + "',"
						+ ep.getCourse_fee() + ",'" + ep.getCourse() + "','"
						+ ep.getFather_name() + "','"
						+ ep.getFather_occupation() + "',"
						+ ep.getFather_experience() + ","
						+ ep.getFather_current_experience() + ",'"
						+ ep.getRation_number() + "'," + ep.getAnnual_income()
						+ ")";
				int n1 = st.executeUpdate(query);
				if (n1 != 1) {
					flag = false;
					return flag;
				} else {
					flag = true;
					return flag;
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw e;
		}
	}

	public boolean applyloanpersonal(loanpojo lp, perosnalpojo pp, loginpojo l) throws SQLException {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {

			Connection con = DAO.getConnection();
			Statement st = con.createStatement();
			String q = "insert into loan values('" + lp.getLoan_id() + "','"
					+ l.getCustomer_id() + "','" + lp.getLoan_type() + "',"
					+ lp.getLoan_ammount() + ",'" + lp.getLoan_apply_date()
					+ "','" + lp.getLoan_issue_date() + "'," + lp.getRoi()
					+ ",'" + lp.getDuration_of_loan() + "'," + lp.getEMI()
					+ "," + lp.getLoanpaid() + ")";

			int n = st.executeUpdate(q);
			if (n != 1) {
				flag = false;
				return flag;
			} else {
				flag = true;
				String query = "insert into personal_housing_loan values('"
						+ lp.getLoan_id() + "','" + l.getCustomer_id() + "',"
						+ pp.getAnnual_income() + ",'" + pp.getCompany_name()
						+ "','" + pp.getDesignation() + "',"
						+ pp.getTotal_exp() + "," + pp.getCurrent_experience()
						+ ")";
				int n1 = st.executeUpdate(query);
				if (n1 != 1) {
					flag = false;
					return flag;
				} else {
					flag = true;
					return flag;
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw e;
		}
	}

	public boolean loanemi(loginpojo l, transactionpojo tp) throws SQLException {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {

			Connection con = DAO.getConnection();
			Statement st = con.createStatement();
			// insert the debit money in transaction table
			String query = "insert into transaction values("
					+ l.getAccount_number() + ",'" + tp.getTxnId() + "','"
					+ tp.getTransactiondate() + "','cash','"
					+ tp.getTransaction_type() + "'," + tp.getAmount()
					+ ",1000)";
			int n = st.executeUpdate(query);
			String debit = "update account_master set initial_Deposit_amount=(select initial_deposit_amount-"
					+ tp.getAmount()
					+ " from account_master where account_number="
					+ l.getAccount_number()
					+ ") where account_number="
					+ l.getAccount_number();
			int n1 = st.executeUpdate(debit);
			String loanupdate = "update loan set amount_to_be_paid=(select amount_to_be_paid-"
					+ tp.getAmount()
					+ " from loan where customer_id='"
					+ l.getCustomer_id()
					+ "') where customer_id='"
					+ l.getCustomer_id() + "'";
			int n2 = st.executeUpdate(loanupdate);

			if (n != 1 && n1 != 1 && n2 != 1) {
				flag = false;
			} else {
				flag = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw e;
		}

		return flag;
	}
}
