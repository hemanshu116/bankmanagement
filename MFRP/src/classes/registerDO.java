package classes;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import pojo.register;

public class registerDO {

	public String getBranchID(String branchname) throws SQLException {
		String branchid = null;
		try {

			Connection con = DAO.getConnection();
			Statement st = con.createStatement();
			String q = "select branch_id from branch where branch_name='"
					+ branchname + "'";

			ResultSet rs = st.executeQuery(q);
			if (rs.next()) {
				branchid = rs.getString(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw e;
		}
		return branchid;
	}

	public String generateCustomerID() throws SQLException {
		String customer_id = null;

		try {

			Connection con = DAO.getConnection();
			Statement st = con.createStatement();
			int n = 100;
			String q = "select * from customer_master";
			ResultSet rs = st.executeQuery(q);
			while (rs.next()) {
				n++;
			}
			customer_id = "R-" + n;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw e;
		}

		return customer_id;
	}

	public long generateAccountNumber() throws SQLException {
		long accno = 0;
		try {

			Connection con = DAO.getConnection();
			Statement st = con.createStatement();
			long n = 1000000000000000l;
			String q = "select * from account_master";
			ResultSet rs = st.executeQuery(q);
			while (rs.next()) {
				n++;
			}
			accno = n;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw e;
		}

		return accno;
	}

	public boolean register(register r) throws SQLException {
		boolean b = false;
		try {

			Connection con = DAO.getConnection();
			Statement st = con.createStatement();

			String query = "insert into customer_master values('"
					+ r.getCustomer_id() + "','" + r.getName() + "','"
					+ r.getUsername() + "','" + r.getPassword() + "','"
					+ r.getGuardian_type() + "','" + r.getGuardian_name()
					+ "','" + r.getAddress() + "','" + r.getCitizenship()
					+ "','" + r.getState() + "','" + r.getCountry() + "','"
					+ r.getEmail_address() + "','" + r.getGender() + "','"
					+ r.getMarital_status() + "'," + r.getContact_no() + ",'"
					+ r.getDate_of_birth() + "','" + r.getBranch_name() + "','"
					+ r.getCitizen_status() + "','"
					+ r.getIdentification_proof_type() + "','"
					+ r.getIdentification_document_number() + "','"
					+ r.getReference_account_holder_name() + "',"
					+ r.getReference_account_holder_account_number() + ",'"
					+ r.getReference_account_holder_address() + "')";

			int check = st.executeUpdate(query);
			// String branch =
			// "select branch_id from branch where branch_city='chennai' and banch_name='shollingnallur'";

			String insert_account = "insert into account_master values('"
					+ r.getBranch_id() + "','" + r.getCustomer_id() + "',"
					+ r.getAccount_number() + ",'" + r.getAcctype() + "',"
					+ r.getIntial_depost() + ",'" + r.getRegistration_date()
					+ "')";
			System.out.println("acc insert " + insert_account);
			int check1 = st.executeUpdate(insert_account);

			if (check != 1 && check1 != 1) {
				b = false;
			} else {
				b = true;
			}

		} catch (SQLException e) {
			throw e;
		}

		return b;
	}
}
