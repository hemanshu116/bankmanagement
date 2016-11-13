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
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import pojo.loanpojo;
import classes.loanDO;


public class ApplyLoan extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ApplyLoan() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public static final Logger LOG = Logger.getLogger("ApplyLoan");

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
			HttpSession hs = request.getSession(false);

			if (hs == null) {
				request.setAttribute("error", "Not logged in. Please log in.");
				RequestDispatcher rd = request
						.getRequestDispatcher("customer.jsp");
				rd.forward(request, response);

			}

			else {
				DateFormat f = new SimpleDateFormat("dd-MMM-yy");
				DateFormat f1 = new SimpleDateFormat("dd/MM/yyyy");
				String ad = request.getParameter("adate");
				String id = request.getParameter("idate");
				String ad1 = null;
				String id1 = null;
				try {

					ad1 = f.format(f1.parse(ad));
					id1 = f.format(f1.parse(id));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				String loan_id = new loanDO().generateloanID();
				double EMI = Double.parseDouble(request.getParameter("emi"));

				loanpojo lp = new loanpojo();
				lp.setDuration_of_loan(request.getParameter("ddate"));
				lp.setEMI(EMI);
				lp.setLoanpaid(request.getParameter("loanpaid"));
				lp.setRoi(request.getParameter("roi"));
				lp.setLoan_ammount(request.getParameter("lamount"));
				lp.setLoan_apply_date(ad1);
				lp.setLoan_id(loan_id);
				lp.setLoan_issue_date(id1);
				lp.setLoan_type(request.getParameter("loan"));
				String check = request.getParameter("typecheck");
				hs.setAttribute("loan", lp);
				if (check.equals("SUBMIT")) {
					String type = request.getParameter("loan");

					if (type.equals("EL")) {
						RequestDispatcher rd = request
								.getRequestDispatcher("EducationalLoan.jsp");
						rd.forward(request, response);
					} else {
						RequestDispatcher rd = request
								.getRequestDispatcher("PersonalLoan.jsp");
						rd.forward(request, response);
					}
				}
			}
		} catch (SQLException e) {
			RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
			LOG.info(new Date() + "::" + e.getMessage());
			rd.forward(request, response);
		}
	}
}
