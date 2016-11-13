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
import classes.LoginDO;

/**
 * Servlet implementation class login
 */
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public static final Logger LOG = Logger.getLogger("login");

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
			loginpojo l = new loginpojo();
			l.setCustomer_id(request.getParameter("customer_id"));
			l.setPassword(request.getParameter("password"));
			boolean check = new LoginDO().validate(l);
			if (check == true) {
				HttpSession hs = request.getSession(true);
				hs.setMaxInactiveInterval(6000);
				hs.setAttribute("login", l);
				LOG.info(new Date() + "::" + "logged in");
				RequestDispatcher rd = request
						.getRequestDispatcher("RegisteredCustomer.jsp");
				rd.forward(request, response);
			} else {
				request.setAttribute("error",
						"Wrong username or password!! try again!!");
				RequestDispatcher rd = request
						.getRequestDispatcher("customer.jsp");
				rd.include(request, response);
			}
		} catch (SQLException e) {
			RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
			LOG.info(new Date() + "::" + e.getMessage());
			rd.forward(request, response);
		}
	}

}
