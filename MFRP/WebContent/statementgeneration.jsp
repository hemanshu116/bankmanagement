<%@page import="pojo.loginpojo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>STATEMENT GENERATION</title>
<script type="text/javascript">
function validatedate()
{
var start=document.getElementById("startdate").value;
var end=document.getElementById("enddate").value;
if(start=="" && end=="")
	{
		document.getElementById("mess").innerHTML="enter the from and to date";
		return false;
	}
else
	{
	document.getElementById("mess").innerHTML=" ";
	return true;
	}
}
</script>
</head>
<%
	HttpSession hs = request.getSession(false);
	if (hs.getAttribute("login") == null) {
		request.setAttribute("error", "Not logged in. Please log in.");
		RequestDispatcher rd = request
				.getRequestDispatcher("customer.jsp");
		rd.forward(request, response);
	} else {
		loginpojo l = (loginpojo) hs.getAttribute("login");
%>
<body>
	<jsp:include page="RegisteredCustomer1.jsp"></jsp:include>
	<fieldset>
		<form action="http://192.168.60.22:8090/MFRP/statementgenerationcheck"
			method="post" onsubmit="return validatedate()">
			<table align="center">

				<tr>
					<td><h4>STARTING FROM &nbsp &nbsp</h4></td>
					<td><input type="date" name="startdate" id="startdate">&nbsp
						&nbsp &nbsp &nbsp &nbsp &nbsp</td>
					<td><h4>TILL&nbsp &nbsp</h4></td>
					<td><input type="date" name="enddate" id="enddate"></td>
				</tr>
				<tr>
					<td><p id="mess"></p></td>
				</tr>
				<tr>
					<td></td>
					<td><input
						style='padding: 10px 10px; font-size: 12px; text-align: center; cursor: pointer; outline: none; color: #fff; background-color: #4CAF50; border: none; border-radius: 15px; box-shadow: 0 9px #999;'
						type="submit" name="button" value="GENERATE"></td>
					<td></td>
					<td><a href="RegisteredCustomer.jsp"> <input
						style='padding: 10px 10px; font-size: 12px; text-align: center; cursor: pointer; outline: none; color: #fff; background-color: #4CAF50; border: none; border-radius: 15px; box-shadow: 0 9px #999;'
						type="button" value="GO BACK" name="cancel"></a></td>
				</tr>



			</table>

		</form>


	</fieldset>
</body>
<%
	}
%>
</html>