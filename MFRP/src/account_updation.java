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

import pojo.loginpojo;
import pojo.register;
import classes.UpdateDO;

/**
 * Servlet implementation class account_updation_check
 */
public class account_updation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public account_updation() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public static final Logger LOG = Logger.getLogger("account_updation");
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			HttpSession hs = request.getSession(false);
			if (hs != null) {
				String check = request.getParameter("updatecheck");
				if (check == null) {
					response.sendRedirect("account_updation.jsp");
				}

				else if (check.equals("UPDATE")) {
					loginpojo l = (loginpojo) hs.getAttribute("login");
					register r = new register();
					r.setName(request.getParameter("name"));
					r.setIdentification_proof_type(request
							.getParameter("IDproof"));
					r.setIdentification_document_number(request
							.getParameter("IDnumber"));
					r.setReference_account_holder_address(request
							.getParameter("referenceadd"));
					r.setAddress(request.getParameter("address"));
					r.setContact_no(request.getParameter("contactnumber"));
					r.setEmail_address(request.getParameter("email"));
					r.setCitizenship(request.getParameter("citizenship"));
					boolean flag = new UpdateDO().update(r, l);
					if (flag == true) {
						request.setAttribute("message",
								"Updated Successfully!!");
						RequestDispatcher rd = request
								.getRequestDispatcher("RegisteredCustomer.jsp");
						rd.forward(request, response);
					} else {
						RequestDispatcher rd = request
								.getRequestDispatcher("error.jsp");
						rd.forward(request, response);
					}
				}
			} else {
				request.setAttribute("error", "Not logged in. Please log in.");
				RequestDispatcher rd = request
						.getRequestDispatcher("customer.jsp");
				rd.forward(request, response);
			}
		} catch (SQLException e) {
			RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
			LOG.info(new Date() + "::" + e.getMessage());
			rd.forward(request, response);
		}
	}
}
