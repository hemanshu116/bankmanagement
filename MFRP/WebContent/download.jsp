<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Download</title>
<script type="text/javascript">
	function viewpdf() {
		var i = 15;
		var mydelay = setInterval(delay, 1000);
		function delay() {
			document.getElementById("download").disabled = true;
			i--;
			document.getElementById("d").innerHTML = "Your PDF will be ready in "
					+ i + " Seconds";
			if (i < 0) {
				document.getElementById("d").innerHTML = "your pdf is ready";
				window.open("download.pdf");
				clearInterval(mydelay);
				document.getElementById("download").disabled = false;

			}
		}
	}
</script>
</head>
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
	<center>
		<input type="image" alt="download" src="download.png" id="download"
			onclick="viewpdf()" style="width: 200px; height: 80px;">
		<p id="d"></p>
		<a href="http://192.168.60.22:8090/MFRP/RegisteredCustomer.jsp"><img
			width="50" height="50" alt="homepage" src="Back_Arrow.svg[1].png">
		</a>
	</center>
	<%
		}
	%>
</body>
</html>