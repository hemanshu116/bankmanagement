<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CUSTOMER LOGIN</title>
<script type="text/javascript">
	window.history.forward(1);
</script>
</head>

<body>
	<jsp:include page="Homepage.jsp"></jsp:include>
	<%
		HttpSession hs = request.getSession(false);
		if (hs.getAttribute("login") != null) {
			RequestDispatcher rd = request
					.getRequestDispatcher("RegisteredCustomer.jsp");
			rd.forward(request, response);
		} else {
			if (request.getAttribute("error") == null) {
				request.setAttribute("error", "");
			}
	%>
	<fieldset>
		<form method="post" name="F1"
			action="http://localhost:8083/MFRP/customercheck">
			<table align="center">
				<tr>
					<td>
						<h3>Enter Customer Id:</h3>
					</td>
					<td><input type="text" name="customer_id" id="customer_id"><br>
						<br></td>

				</tr>
				<tr>
					<td>
						<h3>Enter Password:</h3>
					</td>
					<td><input type="password" name="password"><br> <br></td>
				</tr>
				<tr>
					<td><p><%=request.getAttribute("error")%></p></td>

				</tr>
				<tr>
					<td><input
						style='padding: 10px 10px; font-size: 12px; text-align: center; cursor: pointer; outline: none; color: #fff; background-color: #4CAF50; border: none; border-radius: 15px; box-shadow: 0 9px #999;'
						type="submit" value="LOGIN" name="custcheck"> <input
						style='padding: 10px 10px; font-size: 12px; text-align: center; cursor: pointer; outline: none; color: #fff; background-color: #4CAF50; border: none; border-radius: 15px; box-shadow: 0 9px #999;'
						type="submit" value="REGISTER" name="custcheck">
			</table>
		</form>
	</fieldset>
	<%
		}
	%>
</body>
</html>