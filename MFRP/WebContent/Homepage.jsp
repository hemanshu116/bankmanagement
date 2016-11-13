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

<body style="background-color:	#FFF8DC ;">
	<jsp:include page="Header.jsp"></jsp:include><br><br><br>
	<form action="http://localhost:8080/MFRP/check" method="post">
		<table align="left">
			<tr>
				<td>
					<button style='color: black;' type="submit" value="CUSTOMER"
						name="butt" class="button">CUSTOMER</button> <br> <br>
				</td>
			</tr>

			<tr>
				<td><button style='color: black;' type="submit" value="aboutus"
						name="butt" class="button">ABOUT US</button> <br> <br></td>
			</tr>
			<tr>
				<td><button style='color: black;' type="submit"
						value="CONTACT US" name="butt" class="button">CONTACT US
					</button> <br> <br></td>
			</tr>
		</table>
	</form>
</body>

</html>