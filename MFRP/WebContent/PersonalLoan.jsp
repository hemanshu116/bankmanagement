<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Personal Loan</title>
</head>
<script type="text/javascript">
	window.history.forward(1);
</script>
<script type="text/javascript">
	function valannualincome() {
		var annualincome = document.getElementById("annualincome").value;
		var annualincome1 = annualincome.replace(/\d/g, "");
		if (annualincome != "" && annualincome1.length == 0) {
			document.getElementById("ai").innerHTML = " ";
		} else {
			document.getElementById("ai").innerHTML = "fill in with numbers";
		}
	}
	function validatecompany() {
		var companyname = document.getElementById("companyname").value;
		if (companyname != "") {
			document.getElementById("cn").innerHTML = " ";
		} else {
			document.getElementById("cn").innerHTML = "fill in this field";
		}
	}
	function validatedesignation() {
		var designation = document.getElementById("designation").value;
		if (designation != "") {
			document.getElementById("dn").innerHTML = " ";
		} else {
			document.getElementById("dn").innerHTML = "fill in this field";
		}
	}
	function validateexp() {
		var experience = document.getElementById("experience").value;
		var experience1 = experience.replace(/\d/g, "");
		if (experience != "" && experience.search(/\d/g) == 0
				&& experience1.length == 0) {
			document.getElementById("exp").innerHTML = " ";
		} else {
			document.getElementById("exp").innerHTML = "fill in this field";
		}
	}
	function validateewcc() {
		var ewcc = document.getElementById("ewcc").value;
		var ewcc1 = ewcc.replace(/\d/g, "");
		if (ewcc != "" && ewcc.search(/\d/g) == 0 && ewcc1.length == 0) {
			document.getElementById("ewccp").innerHTML = " ";
		} else {
			document.getElementById("ewccp").innerHTML = "fill in this field";
		}
	}
	function finals() {
		validatecompany();
		validatedesignation();
		validateewcc();
		validateexp();
		valannualincome();
		if (document.getElementById("ewccp").innerHTML == " "
				&& document.getElementById("ai").innerHTML == " "
				&& document.getElementById("cn").innerHTML == " "
				&& document.getElementById("dn").innerHTML == " "
				&& document.getElementById("exp").innerHTML == " ") {
			return true;
		} else {
			return false;
		}
	}
</script>
<body>

	<%
		HttpSession hs = request.getSession(false);
		if (hs.getAttribute("login") == null) {
			request.setAttribute("error", "Not logged in. Please log in.");
			RequestDispatcher rd = request
					.getRequestDispatcher("customer.jsp");
			rd.forward(request, response);

		} else {
	%>
	<jsp:include page="RegisteredCustomer1.jsp"></jsp:include>
	<form action="http://192.168.60.22:8090/MFRP/ApplyLoanPersonal"
		method="post" id="personalloan" onsubmit="return finals()">
		<table align="center">
			<tr>
				<td><h4>Annual Income:</h4></td>
				<td>Rs:<input type="text" name="annualincome" id="annualincome"><br>
					<br></td>
				<td width="250"><div id="ai"></div></td>
			</tr>
			<tr>
				<td>
					<h4>Company Name:</h4>
				</td>
				<td><input type="text" name="companyname" id="companyname"
					onclick="valannualincome()"><br> <br></td>
				<td width="250"><div id="cn"></div></td>
			</tr>

			<tr>
				<td>
					<h4>Designation:</h4>
				</td>
				<td><input type="text" name="designation" id="designation"
					onclick="validatecompany()"><br> <br></td>
				<td width="250"><div id="dn"></div></td>
			</tr>

			<tr>
				<td>
					<h4>Total Experience:</h4>
				</td>
				<td><input type="text" name="experience" id="experience"
					onclick="validatedesignation()"><br> <br></td>
				<td width="250"><div id="exp"></div></td>
			</tr>
			<tr>
				<td>
					<h4>Experience with current company:</h4>
				</td>
				<td><input type="text" name="ewcc" id="ewcc"
					onclick="validateexp()"><br> <br></td>
				<td width="250"><div id="ewccp"></div></td>
			</tr>
			<tr>
				<td><input
					style='padding: 10px 10px; font-size: 12px; text-align: center; cursor: pointer; outline: none; color: #fff; background-color: #4CAF50; border: none; border-radius: 15px; box-shadow: 0 9px #999;'
					type="submit" value="SUBMIT" name="loancheck"></td>
				<td><a href="ApplyLoan.jsp"> <input
						style='padding: 10px 10px; font-size: 12px; text-align: center; cursor: pointer; outline: none; color: #fff; background-color: #4CAF50; border: none; border-radius: 15px; box-shadow: 0 9px #999;'
						type="button" value="GO BACK" name="loancheck"></a></td>
			</tr>

		</table>
	</form>

	<%
		}
	%>
</body>
</html>