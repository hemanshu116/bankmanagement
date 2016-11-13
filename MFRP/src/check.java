import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class check
 */
public class check extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public check() {
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String check = request.getParameter("butt");
		if (check == null) {
			RequestDispatcher rd = request.getRequestDispatcher("Homepage.jsp");
			rd.forward(request, response);
		} else if (check.equals("CUSTOMER")) {
			RequestDispatcher rd = request.getRequestDispatcher("customer.jsp");
			rd.forward(request, response);
		} else if (check.equals("aboutus")) {
			RequestDispatcher rd = request.getRequestDispatcher("AboutUs.jsp");
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request
					.getRequestDispatcher("ContactUs.jsp");
			rd.forward(request, response);
		}
		doGet(request, response);
	}

}
