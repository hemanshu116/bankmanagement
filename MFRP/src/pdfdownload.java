import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pojo.transactionpojo;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

/**
 * Servlet implementation class pdfdownload
 */
public class pdfdownload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public pdfdownload() {
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

		response.setContentType("text/html");
		HttpSession hs = request.getSession(false);
		if (hs == null) {
			request.setAttribute("error", "Not logged in. Please log in.");
			RequestDispatcher rd = request.getRequestDispatcher("customer.jsp");
			rd.forward(request, response);
		} else {
			@SuppressWarnings("unchecked")
			ArrayList<transactionpojo> ld1 = (ArrayList<transactionpojo>) hs
					.getAttribute("list");
			Document document = new Document(PageSize.A4, 25, 25, 25, 25);
			RequestDispatcher rdisp = null;

			try {
				PdfWriter writer = PdfWriter.getInstance(document,
						new FileOutputStream(
								"D:/projects/MFRP/WebContent/download.pdf"));
				document.open();
				document.add(new Paragraph("Bank Statement for your Account."));

				PdfPTable t = new PdfPTable(5);
				t.setSpacingBefore(25);
				t.setSpacingAfter(25);
				PdfPCell c1 = new PdfPCell(new Phrase("TRANSACTION ID"));
				t.addCell(c1);
				PdfPCell c2 = new PdfPCell(new Phrase("ACCOUNT TYPE"));
				t.addCell(c2);

				PdfPCell c3 = new PdfPCell(new Phrase("TRANSACTION DATE"));
				t.addCell(c3);
				PdfPCell c4 = new PdfPCell(new Phrase("AMOUNT"));
				t.addCell(c4);
				PdfPCell c5 = new PdfPCell(new Phrase("OTHER ACCOUNT"));
				t.addCell(c5);

				Iterator<transactionpojo> it = ld1.iterator();
				while (it.hasNext()) {
					transactionpojo temp = (transactionpojo) it.next();
					t.addCell(temp.getTxnId());
					t.addCell(temp.getTransaction_type());
					t.addCell(temp.getTransactiondate());
					t.addCell(temp.getAmount());
					t.addCell(temp.getTo_account());

				}
				document.add(t);
				document.close();
				writer.close();
				response.sendRedirect("download.jsp");

			} catch (DocumentException e) {
				rdisp = request.getRequestDispatcher("displaystatement.jsp");
				request.setAttribute("error", e.getMessage());
				rdisp.forward(request, response);
			}

		}
	}

}
