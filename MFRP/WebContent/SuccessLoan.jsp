<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Successfully Applied.</title>
</head>
<body bgcolor="#66CDAA">
	<br>
	<br>
	<br>
	<br>
	<p align="center">
		<img alt="transaction successful" src="Money-512.png" width="165"
			height="165" align="middle">
	</p>
	<p align="center" style="font-size: 30px;">LOAN APPLIED SUCCESSFULLY</p>
	<p align="center" style="font-size: 20px;">
		YOUR LOAN ID IS:
		<%=request.getAttribute("loanid")%></p>
	<p align="center" style="font-size: 20px;">
		YOUR TOTAL LOAN PAYMENT IS :<%=request.getAttribute("amount")%>
	</p>
	<center>
		<a href="http://192.168.60.22:8090/MFRP/RegisteredCustomer.jsp"> <img
			alt="go back" src="Back_Arrow.svg[1].png" width="50" height="50"
			align="middle">
		</a>
		<p>CLICK HERE TO GO BACK</p>
	</center>
</body>
</html>