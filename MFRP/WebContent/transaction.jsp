<%@page import="pojo.transactionpojo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="pojo.loginpojo"%>
<%@page import="classes.transactionDO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transaction</title>
</head>
<body>
	<%
		Date d = new Date();
			DateFormat f = new SimpleDateFormat("dd/MMM/yyyy");
			String date = f.format(d);
			HttpSession hs = request.getSession(false);
			if (hs.getAttribute("login") == null) {
		request.setAttribute("error", "Not logged in. Please log in.");
		RequestDispatcher rd = request
				.getRequestDispatcher("customer.jsp");
		rd.forward(request, response);
			} else {
		loginpojo l = (loginpojo) hs.getAttribute("login");
		String username = l.getUsername();
		long account_number = l.getAccount_number();
		String acctype = l.getAcctype();
		String txnId = new transactionDO().generateTxnId();
		long balance=new transactionDO().account_balance(l);
		ArrayList<String> accountlist= new transactionDO().getAccountNumbers(account_number);
		ArrayList<String> loanlist= new transactionDO().getLoanDetails(l.getCustomer_id());
	%>
	<script type="text/javascript">
		window.history.forward(1);
		function validateamount() {
			var amount = parseInt(document.getElementById("amount").value);
			var amount2 = document.getElementById("amount").value;
			var amount1 = amount2.replace(/\d/g, "");
			var balance = parseInt(document.getElementById("balance").value);

			if (amount != "" && amount <= balance) {
				if (amount1.length == 0) {
					document.getElementById("valamount").innerHTML = " ";
					return true;
				} else {
					document.getElementById("valamount").innerHTML = "Enter valid amount";
					return false;

				}
			} else {
				document.getElementById("valamount").innerHTML = "Enter numbers and less than balance amount";
				return false;
			}
		}
		function disable() {
			var ttype = document.getElementById("ttype").value;
			if (ttype == "Loan_EMI") {
				document.getElementById("to_account").disabled = true;
				document.getElementById("loan").disabled = false;
				document.getElementById("amount").readOnly = true;
				var amount = document.getElementById("loan").value;
				var loan = amount.split("-")
				document.getElementById("amount").value = loan[2];
			} else {
				document.getElementById("amount").value = "";
				document.getElementById("to_account").disabled = false;
				document.getElementById("loan").disabled = true;
				document.getElementById("amount").readOnly = false;
			}
		}
	</script>
	<jsp:include page="RegisteredCustomer1.jsp"></jsp:include>
	<form action="http://192.168.60.22:8090/MFRP/transaction" method="post"
		onsubmit="return validateamount()">
		<table align="center">
			<tr>
				<td>
					<h4>Account Number:</h4>
				</td>
				<td><input style="color: black" type="text"
					value=<%=account_number%> disabled="disabled" name="account_number"><br>
				</td>
			</tr>
			<tr>
				<td>
					<h4>Account Name:</h4>
				</td>
				<td><input type="text" value=<%=username%> disabled="disabled"
					name="username"> <br></td>
			</tr>
			<tr>
				<td>
					<h4>Account Type:</h4>
				</td>
				<td><input type="text" value=<%=acctype%> disabled="disabled"
					name="acctype"> <br></td>
			</tr>
			<tr>
				<td><h4>Available Balance:</h4></td>
				<td><input type="text" value=<%=balance%> name="balance"
					id="balance" readonly="readonly"></td>

			</tr>
			<tr>
				<td>
					<h4>Transaction ID:</h4>
				</td>
				<td><input type="text" value=<%=txnId%> name="tid"> <br></td>
			<tr>
				<td><h4>Transaction Type:</h4></td>
				<td><select name="ttype" id="ttype" onchange="disable()">
						<option value="Debit">DEBIT</option>
						<option value="Loan_EMI">LOAN EMI</option>

				</select><br></td>
			</tr>
			<tr>
				<td><h4>To Account:</h4></td>
				<td><select name="to_account" id="to_account">
						<%
							for (int i = 0; i < accountlist.size(); i++) {
						%>

						<option value=<%=accountlist.get(i)%>><%=accountlist.get(i)%></option>
						<%
							}
						%>
				</select></td>
			</tr>

			<tr>
				<td><h4>Loan Details:</h4></td>
				<td><select name="loan" id="loan" disabled="disabled">
						<%
							for (int i = 0; i < loanlist.size(); i++) {
						%>

						<option value=<%=loanlist.get(i)%>><%=loanlist.get(i)%></option>
						<%
							}
						%>
				</select></td>
			</tr>

			<tr>
				<td>
					<h4>Transaction Date:</h4>
				</td>
				<td><input type="text" name="tdate" value=<%=date%>
					accept="false" readonly="readonly"> <br></td>
			</tr>
			<tr>
				<td>
					<h4>Amount:</h4>
				</td>
				<td><input type="text" name="amount" id="amount"><br>
					<br></td>
				<td><p id="valamount"></p></td>
			</tr>

			<tr>
				<td><input
					style='padding: 10px 10px; font-size: 12px; text-align: center; cursor: pointer; outline: none; color: #fff; background-color: #4CAF50; border: none; border-radius: 15px; box-shadow: 0 9px #999;'
					type="submit" value="TRANSACT" name="transact"></td>
				<td><input
					style='padding: 10px 10px; font-size: 12px; text-align: center; cursor: pointer; outline: none; color: #fff; background-color: #4CAF50; border: none; border-radius: 15px; box-shadow: 0 9px #999;'
					type="reset" value="CLEAR" name="transact"></td>
			</tr>

		</table>
	</form>
	<%
		}
	%>
</body>
</html>