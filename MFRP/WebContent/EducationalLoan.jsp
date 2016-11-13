<%@page import="pojo.loanpojo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Educational Loan</title>
<script type="text/javascript">
	window.history.forward(1);
</script>
</head>
<script type="text/javascript">
	function valiadatecf() {
		var coursefee = document.getElementById("coursefee").value;
		var cf1 = coursefee.replace(/\d/g, "");
		if (coursefee != "" && cf1.length == 0) {
			document.getElementById("cf").innerHTML = " ";
		} else {
			document.getElementById("cf").innerHTML = "fill in only with numbers";
		}
	}
	function validatecn() {
		var cno = document.getElementById("coursename").value;
		if (cno != "") {
			document.getElementById("cn").innerHTML = " ";
		} else {
			document.getElementById("cn").innerHTML = "fill in this field";
		}
	}
	function validatefn() {
		var fn = document.getElementById("fathername").value;
		if (fn != "") {
			document.getElementById("fn").innerHTML = " ";
		} else {
			document.getElementById("fn").innerHTML = "fill in this field";
		}
	}
	function validatefo() {
		var fo = document.getElementById("foccupation").value;
		if (fo != "") {
			document.getElementById("fo").innerHTML = " ";
		} else {
			document.getElementById("fo").innerHTML = "fill in this field";
		}
	}
	function validatefe() {
		var fe = document.getElementById("fewcc").value;
		var fe1 = fe.replace(/\d/g, "");
		if (fe != "" && fe1.length == 0) {
			document.getElementById("fe").innerHTML = " ";
		} else {
			document.getElementById("fe").innerHTML = "fill in only with numbers";
		}
	}
	function validatefe1() {
		var fe2o = document.getElementById("experience").value;
		var fe3o = fe2o.replace(/\d/g, "");
		if (fe2o != "" && fe3o.length == 0) {
			document.getElementById("fe1").innerHTML = " ";
		} else {
			document.getElementById("fe1").innerHTML = "fill in only with numbers";
		}
	}
	function validaterc() {
		var rc = document.getElementById("rcnumber").value;
		var rc1 = rc.replace(/\d/g, "");
		if (rc != "" && rc1.length == 0) {
			document.getElementById("rc").innerHTML = " ";
		} else {
			document.getElementById("rc").innerHTML = "fill in only with numbers";
		}
	}
	function validateai() {
		var ai = document.getElementById("annualincome").value;
		var ai1 = ai.replace(/\d/g, "");
		if (ai != "" && ai1.length == 0) {
			document.getElementById("ai").innerHTML = " ";
		} else {
			document.getElementById("ai").innerHTML = "fill in only with numbers";
		}
	}
	function finals3() {
		valiadatecf();
		validatecn();
		validatefn();
		validatefo();
		validatefe();
		validatefe1();
		validaterc();
		validateai();
		if (document.getElementById("cf").innerHTML == " "
				&& document.getElementById("cn").innerHTML == " "
				&& document.getElementById("fn").innerHTML == " "
				&& document.getElementById("fo").innerHTML == " "
				&& document.getElementById("fe").innerHTML == " "
				&& document.getElementById("fe1").innerHTML == " "
				&& document.getElementById("rc").innerHTML == " "
				&& document.getElementById("ai").innerHTML == " ") {
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
			loanpojo lp = (loanpojo) hs.getAttribute("loan");
	%>
	<jsp:include page="RegisteredCustomer1.jsp"></jsp:include>
	<form action="http://192.168.60.22:8090/MFRP/ApplyLoanEducatonal"
		method="post" id="educationloan" onsubmit="return finals3()">
		<table align="center">
			<tr>
				<td><h4>EMI</h4></td>
				<td><%=lp.getEMI()%></td>
			</tr>
			<tr>
				<td><h4>Course Fee:</h4></td>
				<td>Rs:<input type="text" name="coursefee" id="coursefee"><br>
					<br></td>
				<td width="250"><div id="cf"></div></td>
			</tr>
			<tr>
				<td>
					<h4>Course Name:</h4>
				</td>
				<td><input type="text" name="coursename" id="coursename"
					onclick="valiadatecf()"><br> <br></td>
				<td width="250"><div id="cn"></div></td>
			</tr>

			<tr>
				<td>
					<h4>Father's Name:</h4>
				</td>
				<td>Mr. <input type="text" name="fathername" id="fathername"
					onclick="validatecn()"><br> <br></td>
				<td width="250"><div id="fn"></div></td>
			</tr>

			<tr>
				<td>
					<h4>Father's Occupation:</h4>
				</td>
				<td><input type="text" name="foccupation" id="foccupation"
					onclick="validatefn()"><br> <br></td>
				<td width="250"><div id="fo"></div></td>
			</tr>
			<tr>
				<td>
					<h4>Father's experience with current company:</h4>
				</td>
				<td><input type="text" name="fewcc" id="fewcc"
					onclick="validatefo()"><br> <br></td>
				<td width="250"><div id="fe"></div></td>
			</tr>
			<tr>
				<td>
					<h4>Father's overall experience:</h4>
				</td>
				<td><input type="text" name="experience" id="experience"
					onclick="validatefe()"><br> <br></td>
				<td width="250"><div id="fe1"></div></td>
			</tr>
			<tr>
				<td>
					<h4>Ration Card Number:</h4>
				</td>
				<td><input type="text" name="rcnumber" id=rcnumber
					onclick="validatefe1()"><br> <br></td>
				<td width="250"><div id="rc"></div></td>
			</tr>
			<tr>
				<td>
					<h4>Annual Income:</h4>
				</td>
				<td><input type="text" name="annualincome" id="annualincome"
					onclick="validaterc()"><br> <br></td>
				<td width="250"><div id="ai"></div></td>
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
​
