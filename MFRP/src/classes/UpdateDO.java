package classes;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import pojo.loginpojo;
import pojo.register;

public class UpdateDO {

	public boolean updatepassword(loginpojo l, String password,
			String oldpassword) throws SQLException {

		boolean flag = false;
		try {

			Connection con = DAO.getConnection();
			Statement st = con.createStatement();
			String q = "select password from customer_master where customer_id='"
					+ l.getCustomer_id() + "'";
			ResultSet rs = st.executeQuery(q);
			if (rs.next()) {
				// System.out.println(oldpassword);
				if (rs.getString(1).equals(oldpassword)) {
					String updatepassword = "update customer_master set password='"
							+ password
							+ "'"
							+ "where customer_id='"
							+ l.getCustomer_id() + "'";
					int n = st.executeUpdate(updatepassword);
					if (n != 1) {
						flag = false;
					} else {
						flag = true;
					}
					// System.out.println("match");
					flag = true;
				}

				else {
					flag = false;
				}
			} else {
				flag = false;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw e;
		}

		return flag;
	}

	public register retrive(loginpojo l) throws SQLException {
		register r = new register();
		try {

			Connection con = DAO.getConnection();
			Statement st = con.createStatement();
			String q = "select * from customer_master where customer_id='"
					+ l.getCustomer_id() + "'";
			ResultSet rs = st.executeQuery(q);

			while (rs.next()) {

				r.setCustomer_id(rs.getString(1));
				r.setName(rs.getString(2));
				r.setUsername(rs.getString(3));
				r.setPassword(rs.getString(4));
				r.setGuardian_type(rs.getString(5));
				r.setGuardian_name(rs.getString(6));
				r.setAddress(rs.getString(7));
				r.setCitizenship(rs.getString(8));
				r.setState(rs.getString(9));
				r.setCountry(rs.getString(10));
				r.setEmail_address(rs.getString(11));
				r.setGender(rs.getString(12));
				r.setMarital_status(rs.getString(13));
				r.setContact_no(rs.getString(14));
				r.setDate_of_birth(rs.getString(15));
				r.setBranch_name(rs.getString(16));
				r.setCitizen_status(rs.getString(17));
				r.setIdentification_proof_type(rs.getString(18));
				r.setIdentification_document_number(rs.getString(19));
				r.setReference_account_holder_name(rs.getString(20));
				r.setReference_account_holder_account_number(rs.getString(21));
				r.setReference_account_holder_address(rs.getString(22));

			}

			ResultSet rs1 = st
					.executeQuery("select * from account_master where customer_id='"
							+ l.getCustomer_id() + "'");

			while (rs1.next()) {
				r.setAccount_number(Long.parseLong(rs1.getString(3)));
				r.setAcctype(rs1.getString(4));
				r.setIntial_depost(Integer.parseInt(rs1.getString(5)));
				r.setRegistration_date(rs1.getString(6));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw e;
		}
		return r;
	}

	public boolean update(register r, loginpojo l) throws SQLException {
		boolean flag = false;
		try {

			Connection con = DAO.getConnection();
			Statement st = con.createStatement();
			String q = "update customer_master set name='" + r.getName()
					+ "',identification_proof_type='"
					+ r.getIdentification_proof_type()
					+ "',identification_document_number='"
					+ r.getIdentification_document_number() + "',"
					+ "ref_acc_hol_add='"
					+ r.getReference_account_holder_address() + "',address='"
					+ r.getAddress() + "',contact_no=" + r.getContact_no()
					+ " , email_address='" + r.getEmail_address()
					+ "',citizenship='" + r.getCitizenship()
					+ "' where customer_id='" + l.getCustomer_id() + "'";
			System.out.println(q);
			int n = st.executeUpdate(q);
			if (n != 1) {
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
