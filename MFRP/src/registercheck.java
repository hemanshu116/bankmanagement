import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import pojo.register;
import classes.registerDO;

/**
 * Servlet implementation class registercheck
 */
public class registercheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public registercheck() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public static final Logger LOG = Logger.getLogger("registercheck");

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String check = request.getParameter("butt");
			if (check == null) {
				request.setAttribute("error",
						"Something went wrong please try again!!");
				RequestDispatcher rd = request
						.getRequestDispatcher("register.jsp");
				rd.forward(request, response);
			} else if (check.equals("Submit")) {
				register r = new register();

				String customer_id = new registerDO().generateCustomerID();
				long account_number = new registerDO().generateAccountNumber();
				String branch_id = new registerDO().getBranchID(request
						.getParameter("branchname"));

				DateFormat f = new SimpleDateFormat("dd-MMM-yy");
				DateFormat f1 = new SimpleDateFormat("yyyy-MM-dd");
				String dob = request.getParameter("dob");
				String dob1 = null;
				try {

					dob1 = f.format(f1.parse(dob));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				String date = f.format(new Date());

				r.setCustomer_id(customer_id);
				r.setName(request.getParameter("name"));
				r.setUsername(request.getParameter("username"));
				r.setPassword(request.getParameter("password"));
				r.setGuardian_type(request.getParameter("gtype"));
				r.setGuardian_name(request.getParameter("gname"));
				r.setAddress(request.getParameter("address"));
				r.setCitizenship(request.getParameter("citizenship"));
				r.setState(request.getParameter("state"));
				r.setCountry(request.getParameter("country"));
				r.setEmail_address(request.getParameter("email"));
				r.setGender(request.getParameter("gender"));
				r.setMarital_status(request.getParameter("mstatus"));
				r.setContact_no(request.getParameter("contactnumber"));
				r.setDate_of_birth(dob1);
				// r.setRegistration_date(request.getParameter("rd"));
				// r.setAccount_type(request.getParameter("acctype"));
				r.setBranch_name(request.getParameter("branchname"));
				r.setCitizen_status(request.getParameter("citizenstatus"));
				// r.setInitial_amount(request.getParameter("initialamount"));
				r.setIdentification_proof_type(request.getParameter("IDtype"));
				r.setIdentification_document_number(request
						.getParameter("IDno"));
				r.setReference_account_holder_name(request
						.getParameter("referencename"));
				r.setReference_account_holder_account_number(request
						.getParameter("referenceaccno"));
				r.setReference_account_holder_address(request
						.getParameter("referenceaddress"));
				// ACCOUNT TABLE DETAILS
				r.setAccount_number(account_number);
				r.setAcctype(request.getParameter("acctype"));
				r.setBranch_id(branch_id);
				r.setIntial_depost(Integer.parseInt(request
						.getParameter("initialamount")));

				r.setRegistration_date(date);
				boolean validate = new registerDO().register(r);
				if (validate == true) {
					RequestDispatcher rd = request
							.getRequestDispatcher("successfullyreg.jsp");
					request.setAttribute("custid", r.getCustomer_id());
					request.setAttribute("accno", r.getAccount_number());
					rd.forward(request, response);
				} else {
					RequestDispatcher rd = request
							.getRequestDispatcher("error.jsp");
					rd.forward(request, response);

				}
			}

		} catch (SQLException e) {
			RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
			LOG.info(new Date() + "::" + e.getMessage());
			rd.forward(request, response);
		}
	}
}
