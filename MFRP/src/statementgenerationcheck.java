import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import pojo.loginpojo;
import pojo.transactionpojo;
import classes.statementgenerationDO;

/**
 * Servlet implementation class statementgenerationcheck
 */
public class statementgenerationcheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public statementgenerationcheck() {
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
	public static final Logger LOG = Logger.getLogger("statementgenerationcheck");

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
				String check = request.getParameter("button");
				if (check.equals("GENERATE")) {
					DateFormat f = new SimpleDateFormat("dd-MMM-yy");
					DateFormat f1 = new SimpleDateFormat("yyyy-MM-dd");
					String start = request.getParameter("startdate");
					String end = request.getParameter("enddate");

					String startdate = null;
					String enddate = null;
					try {

						startdate = f.format(f1.parse(start));
						enddate = f.format(f1.parse(end));
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						LOG.info(new Date() + "::" + e.getMessage());
					}

					String from = startdate;
					String to = enddate;
					loginpojo l = (loginpojo) hs.getAttribute("login");

					ArrayList<transactionpojo> ar = new statementgenerationDO()
							.generateAll(l, from, to);
					request.setAttribute("list", ar);
					hs.setAttribute("list", ar);
					request.setAttribute("from", from);
					request.setAttribute("to", to);
					RequestDispatcher rd = request
							.getRequestDispatcher("displaystatement.jsp");
					rd.forward(request, response);
				} else {
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
