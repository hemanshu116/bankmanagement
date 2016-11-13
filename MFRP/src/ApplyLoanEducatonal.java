import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import pojo.educationalpojo;
import pojo.loanpojo;
import pojo.loginpojo;
import classes.loanDO;

/**
 * Servlet implementation class ApplyLoanEducatonal
 */
public class ApplyLoanEducatonal extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ApplyLoanEducatonal() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public static final Logger LOG = Logger.getLogger("ApplyLoanEducational");

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
			} else {
				String check = request.getParameter("loancheck");
				if (check.equals("SUBMIT")) {
					loginpojo l = (loginpojo) hs.getAttribute("login");
					loanpojo lp = (loanpojo) hs.getAttribute("loan");
					educationalpojo ep = new educationalpojo();
					ep.setAnnual_income(request.getParameter("annualincome"));
					ep.setCourse(request.getParameter("coursename"));
					ep.setCourse_fee(request.getParameter("coursefee"));
					ep.setFather_current_experience(request
							.getParameter("fewcc"));
					ep.setFather_experience(request.getParameter("experience"));
					ep.setFather_name(request.getParameter("fathername"));
					ep.setFather_occupation(request.getParameter("foccupation"));
					ep.setRation_number(request.getParameter("rcnumber"));

					boolean flag = new loanDO().applyloaneducational(lp, ep, l);
					if (flag == true) {
						request.setAttribute("loanid", lp.getLoan_id());
						request.setAttribute("amount", lp.getLoanpaid());
						RequestDispatcher rd = request
								.getRequestDispatcher("SuccessLoan.jsp");
						rd.forward(request, response);
					} else {
						RequestDispatcher rd = request
								.getRequestDispatcher("error.jsp");
						rd.forward(request, response);
					}
				} else {
					RequestDispatcher rd = request
							.getRequestDispatcher("ApplyLoan.jsp");
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
