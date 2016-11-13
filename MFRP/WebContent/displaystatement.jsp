<%@page import="pojo.transactionpojo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>STATEMENT GENERATION</title>

</head>
<%
	HttpSession hs = request.getSession(false);
	if (hs.getAttribute("login") == null) {
		request.setAttribute("error", "Not logged in. Please log in.");
		RequestDispatcher rd = request
				.getRequestDispatcher("customer.jsp");
		rd.forward(request, response);

	} else {
		ArrayList<transactionpojo> ar = (ArrayList<transactionpojo>) request
				.getAttribute("list");
%>
<body>
	<jsp:include page="RegisteredCustomer1.jsp"></jsp:include>
	<form action="http://192.168.60.22:8090/MFRP/pdfdownload" name="export"
		id="export" onsubmit="return viewpdf()">
		<center>
			<b> STATEMENT GENERATED FROM <%=request.getAttribute("from")%>
				AND <%=request.getAttribute("to")%></b>
		</center>
		<table align="center" border="5">
			<tr>
				<th>Transaction ID:</th>
				<th>Transaction TYPE:</th>
				<th>Transaction DATE:</th>
				<th>Transaction AMOUNT:</th>
				<th>Other Account:</th>
			</tr>
			<%
				for (int i = 0; i < ar.size(); i++) {
			%>
			<tr>
				<td><%=ar.get(i).getTxnId()%></td>
				<td><%=ar.get(i).getTransaction_type()%></td>
				<td><%=ar.get(i).getTransactiondate()%></td>
				<td><%=ar.get(i).getAmount()%></td>
				<td><%=ar.get(i).getTo_account()%></td>
			</tr>
			<%
				}
			%>

		</table>
		<center>
			<input align="middle"
				style='padding: 10px 10px; font-size: 12px; text-align: center; cursor: pointer; outline: none; color: #fff; background-color: #4CAF50; border: none; border-radius: 15px; box-shadow: 0 9px #999;'
				type="submit" value="Download PDF">
		</center>
	</form>

</body>
<%
	}
%>
</html>