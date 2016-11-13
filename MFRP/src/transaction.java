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
import pojo.transactionpojo;
import classes.loanDO;
import classes.transactionDO;

/**
 * Servlet implementation class transaction
 */
public class transaction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public transaction() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public static final Logger LOG = Logger.getLogger("transaction");

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
				loginpojo l = (loginpojo) hs.getAttribute("login");
				transactionpojo tp = new transactionpojo();

				tp.setAmount(request.getParameter("amount"));
				tp.setTransactiondate(request.getParameter("tdate"));
				tp.setTransaction_type(request.getParameter("ttype"));
				tp.setTxnId(request.getParameter("tid"));
				tp.setTo_account(request.getParameter("to_account"));

				l.setBalance(Long.parseLong(request.getParameter("balance")));

				boolean check = false, loancheck = false;
				if (request.getParameter("ttype").equalsIgnoreCase("DEBIT")) {
					check = new transactionDO().trasact(l, tp);
				} else if (request.getParameter("ttype").equalsIgnoreCase(
						"LOAN_EMI")) {
					loancheck = new loanDO().loanemi(l, tp);
				}

				long balance = new transactionDO().account_balance(l);
				if (check == true || loancheck == true) {
					RequestDispatcher rd = request
							.getRequestDispatcher("TransactionSuccessfull.jsp");
					request.setAttribute("balance", balance);
					request.setAttribute("txnID", tp.getTxnId());
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
