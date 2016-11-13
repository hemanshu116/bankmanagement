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
 * Servlet implementation class account_updation_serv
 */
public class account_retrival extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public account_retrival() {
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
	public static final Logger LOG = Logger.getLogger("account_retrival");
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
				loginpojo l = (loginpojo) hs.getAttribute("login");
				UpdateDO ob = new UpdateDO();

				register lo = ob.retrive(l);
				request.setAttribute("update", lo);
				RequestDispatcher rd = request
						.getRequestDispatcher("account_updation.jsp");
				rd.forward(request, response);
			}

		} catch (SQLException e) {
			RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
			 LOG.info(new Date()+"::"+e.getMessage());
			rd.forward(request, response);
		}

	}
}
