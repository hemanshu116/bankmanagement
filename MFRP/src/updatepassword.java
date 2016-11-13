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
import classes.UpdateDO;

/**
 * Servlet implementation class updatepassword
 */
public class updatepassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public updatepassword() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public static final Logger LOG = Logger.getLogger("updatepassword");

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
				String check = request.getParameter("abcd");
				if (check.equals("UPDATE")) {
					loginpojo l = (loginpojo) hs.getAttribute("login");
					String newpassword = request.getParameter("new");
					String oldpassword = request.getParameter("old");
					boolean flag = new UpdateDO().updatepassword(l,
							newpassword, oldpassword);
					if (flag == true) {
						request.setAttribute("error",
								"Updated Successfully. Please login again.");
						RequestDispatcher rd = request
								.getRequestDispatcher("customer.jsp");
						rd.forward(request, response);
					} else {
						request.setAttribute("error", "Wrong old password");
						RequestDispatcher rd = request
								.getRequestDispatcher("updatepassword.jsp");
						rd.include(request, response);
					}

				} else if (check.equals("CANCEL")) {
					RequestDispatcher rd = request
							.getRequestDispatcher("RegisteredCustomer.jsp");
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
