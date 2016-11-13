<%@page import="classes.transactionDO"%>
<%@page import="java.util.Date"%>
<%@page import="pojo.loginpojo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bank Management System</title>
<style type="text/css">
.button {
	padding: 10px 15px;
	font-size: 14px;
	text-align: center;
	cursor: pointer;
	outline: none;
	color: #fff;
	background-color: #4CAF50;
	border: none;
	border-radius: 15px;
	box-shadow: 0 9px #999;
	width: 200px;
}

.button:hover {
	background-color: #3e8e41
}

.button:active {
	background-color: #3e8e41;
	box-shadow: 0 5px #666;
	transform: translateY(4px);
}
</style>
</head>

<body style="background-color: #FFF8DC;">
	<%
		HttpSession hs = request.getSession(false);
		if (hs.getAttribute("login") == null) {
			request.setAttribute("error", "Not logged in. Please log in.");
			RequestDispatcher rd = request
					.getRequestDispatcher("customer.jsp");
			rd.forward(request, response);
		} else {
			loginpojo l = (loginpojo) hs.getAttribute("login");
			String name = l.getUsername();
			long account_number = l.getAccount_number();
			String acctype = l.getAcctype();
			long balance = new transactionDO().account_balance(l);
			Date date = new Date();
			if (request.getAttribute("message") == null) {
				request.setAttribute("message", "");
			}
	%>
	<jsp:include page="Header.jsp"></jsp:include>

	<h5>
		Welcome,<%=name%>
	</h5>
	<h5 style='position: absolute; top: 0px; right: 150px;'>
		Account number:
		<%=account_number%></h5>

	<a style='position: absolute; top: 20px; right: 60px;'
		href="http://192.168.60.22:8090/MFRP/logout"> <img alt="logout"
		src="logout.png" width="50" height="20">
	</a>
	<a style="position: absolute; top: 45px; right: 60px; size: '6';"
		href="http://192.168.60.22:8090/MFRP/updatepassword.jsp">UPDATE
		PASSWORD</a>
	<center>
		<p><%=request.getAttribute("message")%></p>
	</center>
	<form action="http://192.168.60.22:8090/MFRP/CustomerRequest"
		method="post">
		<table align="left">

			<tr>
				<td>
					<button style='color: black;' type="submit" value="apply_loan"
						name="butt" class="button">APPLY LOAN</button> <br> <br>
				</td>
			</tr>
			<tr>
				<td>
					<button style='color: black;' type="submit" value="transaction"
						name="butt" class="button">TRANSACTION</button> <br> <br>
				</td>
			</tr>
			<tr>
				<td><button style='color: black;' type="submit"
						value="account_updation" name="butt" class="button">ACCOUNT
						UPDATION</button> <br> <br></td>
			</tr>
			<tr>
				<td><button style='color: black;' type="submit"
						value="statement_generation" name="butt" class="button">STATEMENT
						GENERATION</button> <br> <br></td>
			</tr>
		</table>
	</form>

	<table align="center" border="5" style="top: 50px; right: 400px">
		<tr bgcolor="#4CAF50">
			<th>Account Holder Name</th>
			<th>Account Number</th>
			<th>Balance</th>
			<th>Balance last updated on</th>
		</tr>
		<tr>
			<td><%=name%></td>
			<td><%=account_number%>
			<td><p align="center" style="color: blue">
					Rs:<%=balance%>
				</p></td>
			<td><%=date%></td>

		</tr>
	</table>
	<%
		}
	%>
</body>


</html>