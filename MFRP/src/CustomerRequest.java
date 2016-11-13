import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CustomerRequest
 */
public class CustomerRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CustomerRequest() {
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
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession hs = request.getSession(false);

		if (hs == null) {
			request.setAttribute("error", "Not logged in. Please log in.");
			RequestDispatcher rd = request.getRequestDispatcher("customer.jsp");
			rd.forward(request, response);
		} else {
			String check = request.getParameter("butt");
			if (check == null) {
				RequestDispatcher rd = request.getRequestDispatcher("RegisteredCustomer.jsp");
				rd.forward(request, response);
			} else if (check.equals("apply_loan")) {
				RequestDispatcher rd = request
						.getRequestDispatcher("ApplyLoan.jsp");
				rd.forward(request, response);
			} else if (check.equals("transaction")) {
				RequestDispatcher rd = request
						.getRequestDispatcher("transaction.jsp");
				rd.forward(request, response);
			} else if (check.equals("account_updation")) {
				RequestDispatcher rd = request
						.getRequestDispatcher("account_retrival");
				rd.forward(request, response);
			} else if (check.equals("statement_generation")) {
				RequestDispatcher rd = request
						.getRequestDispatcher("statementgeneration.jsp");
				rd.forward(request, response);
			}
		}

	}

}
