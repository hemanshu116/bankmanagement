<%@page import="pojo.loginpojo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Password</title>
</head>
<script type="text/javascript">
	function updatepassword() {
		var password = document.getElementById("new").value;
		var oldpassword = document.getElementById("old").value;
		if (password != "" && oldpassword != password) {
			if (password.search("[a-z]") >= 0 && password.search("[A-Z]") >= 0
					&& password.length >= 8 && password.search("[0-9]") >= 0
					&& password.search("[@#$%^&*]") >= 0) {

				document.getElementById("newpassword").innerHTML = " ";

			} else {
				document.getElementById("newpassword").innerHTML = "Fill in with characters and numbers and special characters(@,#,$,%,^,&,*)";

			}
		} else {
			document.getElementById("newpassword").innerHTML = "New password should not be same as old password";

		}
	}
	function updaterpassword() {
		var rpassword0 = document.getElementById("new").value;
		var rpasssoword = document.getElementById("confirmnew").value;
		if (rpasssoword == rpassword0 && rpasssoword != "" && rpassword0 != "") {
			document.getElementById("newconpassword").innerHTML = " ";
		} else {
			document.getElementById("newconpassword").innerHTML = "password mismatch";
		}
	}
	function finals() {
		updatepassword();
		updaterpassword();
		if (document.getElementById("newpassword").innerHTML == " "
				&& document.getElementById("newconpassword").innerHTML == " ") {
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
			loginpojo l = (loginpojo) hs.getAttribute("login");
			if (request.getAttribute("error") == null) {
				request.setAttribute("error", "");
			}
	%>
	<jsp:include page="RegisteredCustomer1.jsp"></jsp:include>
	<form action="http://192.168.60.22:8090/MFRP/updatepassword"
		onsubmit="return finals()">
		<table align="center">
			<tr>
				<td>Old Password:</td>
				<td><input type="text" name="old" id="old"></td>
			</tr>
			<tr>
				<td>New Password:</td>
				<td><input type="text" name="new" id="new"></td>
				<td><p id="newpassword"></p></td>
			</tr>
			<tr>
				<td>Confirm New Password:</td>
				<td><input type="text" name="confirmnew" id="confirmnew"
					onclick="updatepassword()"></td>
				<td><p id="newconpassword"></p></td>
			</tr>
			<tr>
				<td><p><%=request.getAttribute("error")%></p></td>
			</tr>
			<tr>
				<td><input
					style='padding: 10px 10px; font-size: 12px; text-align: center; cursor: pointer; outline: none; color: #fff; background-color: #4CAF50; border: none; border-radius: 15px; box-shadow: 0 9px #999;'
					type="submit" name="abcd" value="UPDATE"></td>
				<td><a href="RegisteredCustomer.jsp.jsp"> <input
						style='padding: 10px 10px; font-size: 12px; text-align: center; cursor: pointer; outline: none; color: #fff; background-color: #4CAF50; border: none; border-radius: 15px; box-shadow: 0 9px #999;'
						type="button" value="GO BACK" name="loancheck"></a></td>
			</tr>
		</table>

	</form>
</body>
<%
	}
%>
</html>