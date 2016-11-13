<%@page import="java.util.Calendar"%>
<%@page import="pojo.loginpojo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Apply Loan</title>
<script type="text/javascript">
	function validate_p() {
		var p0 = document.getElementById("p").value;
		var p1 = p0.replace(/\d/g, "");
		if (p0 != "" && p1.length == 0 && p0 > 500000) {
			document.getElementById("loanp").innerHTML = " ";
		} else {
			document.getElementById("loanp").innerHTML = "fill in with amount greater than 500000";
		}
	}

	function calcemi() {
		var p = document.getElementById("p").value;
		var n = document.getElementById("n").value;
		var r0 = document.getElementById("r").value;
		validate_p();
		var r = (r0 / 12) / 100;
		var a = (p * r);
		var b = Math.pow(1 + r, n * 12);
		var d = (a * b) / (b - 1);
		var emi = d.toFixed(2);
		document.getElementById("emi").value = Math.ceil(emi);
		document.getElementById("loanpaid").value = Math.ceil(emi * n * 12);
	}
	function loanfinals() {
		validate_p();

		if (document.getElementById("loanp").innerHTML == " ") {
			return true;
		} else {
			return false;
		}
	}
</script>
</head>
<%
	Date d = new Date();
	SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
	String date = f.format(d);
	Calendar c = Calendar.getInstance();
	c.setTime(d); // Now use today date.
	c.add(Calendar.DATE, 5); // Adding 5 days
	String loanissuedate = f.format(c.getTime());
	HttpSession hs = request.getSession(false);
	if (hs.getAttribute("login") == null) {
		request.setAttribute("error", "Not logged in. Please log in.");
		RequestDispatcher rd = request
				.getRequestDispatcher("customer.jsp");
		rd.forward(request, response);
	} else {
		loginpojo l = (loginpojo) hs.getAttribute("login");
		String username = l.getUsername();
		long accout_number = l.getAccount_number();
%>
<body>

	<jsp:include page="RegisteredCustomer1.jsp"></jsp:include>
	<form action="http://192.168.60.22:8090/MFRP/ApplyLoan" method="post"
		id="loan" onsubmit="return loanfinals()">
		<table align="center">
			<tr>
				<td><h4>Loan Type:</h4></td>
				<td id="loantype"><select name="loan" id="loan">
						<option value="EL">Educational Loan</option>
						<option value="PHL">Personal/Housing Loan</option>
				</select></td>
			</tr>
			<tr>
				<td>
					<h4>Loan Amount:</h4>
				</td>
				<td><input type="text" name="lamount" id="p"
					onchange="calcemi()"><br> <br></td>
				<td width="250px"><div style="color: red;" id="loanp"></div></td>
			</tr>

			<tr>
				<td>
					<h4>Rate of Interest:</h4>
				</td>
				<td><input type="text" name="roi" id="r" readonly="readonly"
					value="12" onclick="validate_p()">%<br> <br></td>
				<td><p id="rate"></p></td>
			</tr>
			<tr>
				<td>
					<h4>Loan ApplyDate:</h4>
				</td>
				<td><input type="text" name="adate" value=<%=date%>
					accept="false" readonly="readonly"><br> <br></td>
			</tr>
			<tr>
				<td>
					<h4>Loan IssueDate:</h4>
				</td>
				<td><input type="text" name="idate" value=<%=loanissuedate%>
					accept="false" readonly="readonly"><br> <br></td>
			</tr>

			<tr>
				<td>
					<h4>Duration Of the Loan:</h4>
				</td>
				<td><select name="ddate" id="n" onchange="calcemi()">
						<option value="5">5</option>
						<option value="10">10</option>
						<option value="15">15</option>
						<option value="20">20</option>
				</select><br> <br></td>
			</tr>
			<tr>
				<td><h4>EMI:</h4></td>
				<td><input type="text" id="emi" name="emi" onclick="calcemi()"
					readonly="readonly">
			</tr>
			<tr>
				<td><h4>Loan to be Paid:</h4></td>
				<td><input type="text" id="loanpaid" name="loanpaid"
					readonly="readonly">
			</tr>
			<tr>
				<td><input
					style='padding: 10px 10px; font-size: 12px; text-align: center; cursor: pointer; outline: none; color: #fff; background-color: #4CAF50; border: none; border-radius: 15px; box-shadow: 0 9px #999;'
					type="submit" value="SUBMIT" name="typecheck"></td>
				<td><input
					style='padding: 10px 10px; font-size: 12px; text-align: center; cursor: pointer; outline: none; color: #fff; background-color: #4CAF50; border: none; border-radius: 15px; box-shadow: 0 9px #999;'
					type="reset" value="CLEAR" name="typecheck"></td>
			</tr>

		</table>
	</form>

</body>
<%
	}
%>
</html>