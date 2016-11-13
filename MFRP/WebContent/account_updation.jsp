<%@page import="pojo.register"%>
<%@page import="pojo.loginpojo"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
	window.history.forward(1);
	function validatename() {
		var name = document.getElementById("name").value;
		var name1 = name.replace(/\w/g, "");
		var name2 = name1.replace(/\s/g, "");
		if (name != "") {
			if (name2.length == 0 && name.length >= 4
					&& name.search("[0-9]") < 0) {
				document.getElementById("n1").innerHTML = " ";
			} else {
				document.getElementById("n1").innerHTML = "Fill in with characters only";
			}
		} else {
			document.getElementById("n1").innerHTML = "Fill in with characters only";
		}
	}
	function validateaddress() {
		var address = document.getElementById("address").value;
		if (address != "") {
			if (address.search("[a-zA-z]") >= 0) {
				document.getElementById("a1").innerHTML = " ";

			} else {
				document.getElementById("a1").innerHTML = "Fill in with characters";

			}
		} else {
			document.getElementById("a1").innerHTML = "Fill in with characters";

		}
	}
	function validatecitizenship() {
		var citizenship = document.getElementById("citizenship").value;
		if (citizenship != "") {
			if (citizenship.search("[a-zA-Z]") >= 0) {
				document.getElementById("c1").innerHTML = " ";
			} else {
				document.getElementById("c1").innerHTML = "Fill in with characters";
			}
		} else {
			document.getElementById("c1").innerHTML = "Fill in with characters";
		}
	}
	function validateemail() {
		var email1 = document.getElementById("email").value;
		if (email1 != "") {
			if (email1.search("[a-zA-z]") >= 0 && email1.length >= 8
					&& email1.search("[@]") > 0 && email1.search("[.]") > 0) {
				document.getElementById("e1").innerHTML = " ";

			} else {
				document.getElementById("e1").innerHTML = "Fill in with characters and numbers and special characters(@,#,$,%,^,&,*)";

			}
		} else {
			document.getElementById("e1").innerHTML = "Fill in with characters and numbers and special characters(@,#,$,%,^,&,*)";

		}
	}
	function validatecontactno() {
		var contactnumber = document.getElementById("contactnumber").value;
		var contactnumber1 = contactnumber.replace(/\d/g, "");
		if (contactnumber != "") {
			if (contactnumber.length == 10 && contactnumber1.length == 0) {
				document.getElementById("cno1").innerHTML = " ";

			} else {
				document.getElementById("cno1").innerHTML = "Fill in with numbers and length 10";

			}
		} else {
			document.getElementById("cno1").innerHTML = "Fill in with numbers and length 10";

		}
	}
	function validateiddocno() {
		var IDno = document.getElementById("IDno").value;
		if (IDno != "" && IDno.length >= 4) {
			if (IDno.search("[a-zA-z]") >= 0 || IDno.search("[0-9]") >= 0) {
				document.getElementById("i1").innerHTML = " ";

			} else {
				document.getElementById("i1").innerHTML = "Fill in with characters or numbers";

			}
		} else {
			document.getElementById("i1").innerHTML = "Fill in with characters or numbers";

		}
	}
	function validateidptype() {
		var IDtype = document.getElementById("IDtype").value;
		if (IDtype != "") {
			if (IDtype.search("[a-zA-z]") >= 0 && IDtype.length >= 4) {
				document.getElementById("it1").innerHTML = " ";

			} else {
				document.getElementById("it1").innerHTML = "Fill in with characters";

			}
		} else {
			document.getElementById("it1").innerHTML = "Fill in with characters";

		}
	}
	function validaterahaa() {
		var referenceaddress = document.getElementById("referenceaddress").value;
		if (referenceaddress != "") {
			if (referenceaddress.search("[a-zA-z]") >= 0) {
				document.getElementById("ra1").innerHTML = " ";

			} else {
				document.getElementById("ra1").innerHTML = "Fill in with characters";

			}
		} else {
			document.getElementById("ra1").innerHTML = "Fill in with characters";
		}
	}
	function finals2() {
		validatename();
		validateidptype();
		validateiddocno();
		validaterahaa();
		validateaddress();
		validatecontactno();
		validateemail();
		validatecitizenship();
		if (document.getElementById("n1").innerHTML == " "
				&& document.getElementById("a1").innerHTML == " "
				&& document.getElementById("c1").innerHTML == " "
				&& document.getElementById("e1").innerHTML == " "
				&& document.getElementById("cno1").innerHTML == " "
				&& document.getElementById("i1").innerHTML == " "
				&& document.getElementById("it1").innerHTML == " "
				&& document.getElementById("ra1").innerHTML == " ") {

			return true;
		} else {

			return false;
		}
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Updation</title>
<%
	HttpSession hs = request.getSession(false);
	if (hs.getAttribute("login") == null) {
		request.setAttribute("error", "Not logged in. Please log in.");
		RequestDispatcher rd = request
				.getRequestDispatcher("customer.jsp");
		rd.forward(request, response);

	} else {
		if (request.getAttribute("update") == null) {
			response.sendRedirect("RegisteredCustomer.jsp");

		} else {
			register r = (register) request.getAttribute("update");
%>
</head>
<body>

	<jsp:include page="RegisteredCustomer1.jsp"></jsp:include>
	<form action="http://192.168.60.22:8090/MFRP/account_updation"
		method="post" onsubmit="return finals2()">
		<table>
			<tr>
				<td>CUST ID:</td>
				<td><input type="text" disabled="disabled" name="custid"
					value=<%=r.getCustomer_id()%>></td>
			</tr>
			<tr>
				<td>NAME:</td>
				<td><input type="text" name="name" id="name"
					value=<%=r.getName()%>></td>
				<td width="250"><div style="color: red;" id="n1"></div></td>
			</tr>
			<tr>
				<td>USERNAME:</td>
				<td><input type="text" disabled="disabled" name="username"
					value=<%=r.getUsername()%>></td>
			</tr>
			<tr>
				<td>ACCOUNT NUMBER:</td>
				<td><input type="text" disabled="disabled" name="accountnumber"
					value=<%=r.getAccount_number()%>></td>
			</tr>
			<tr>
				<td>COUNTRY:</td>
				<td><input type="text" disabled="disabled" name="country"
					value=<%=r.getCountry()%>></td>
			</tr>
			<tr>
				<td>STATE:</td>
				<td><input type="text" disabled="disabled" name="state"
					value=<%=r.getState()%>></td>
			</tr>
			<tr>
				<td>GENDER:</td>
				<td><input type="text" disabled="disabled" name="gender"
					value=<%=r.getGender()%>></td>
			</tr>
			<tr>
				<td>DOB:</td>
				<td><input type="text" disabled="disabled" name="dob"
					value=<%=r.getDate_of_birth()%>></td>
			</tr>
			<tr>
				<td>REGISTRATION DATE:</td>
				<td><input type="text" disabled="disabled" name="rd"
					value=<%=r.getRegistration_date()%>></td>
			</tr>
			<tr>
				<td>BANK BRANCH:</td>
				<td><input type="text" disabled="disabled" name="branchname"
					value=<%=r.getBranch_name()%>></td>
			</tr>
			<tr>
				<td>IDENTIFICATION PROOF:</td>
				<td><input type="text" name="IDproof" id="IDtype"
					onclick="validatename()"
					value=<%=r.getIdentification_proof_type()%>></td>
				<td width="250" s><div style="color: red;" id="it1"></div></td>
			</tr>
			<tr>
				<td>IDENTIFICATION DOC NUMBER:</td>
				<td><input type="text" name="IDnumber" id="IDno"
					onclick="validateidptype()"
					value=<%=r.getIdentification_document_number()%>></td>
				<td width="250"><div style="color: red;" id="i1"></div></td>
			</tr>
			<tr>
				<td>REFERENCE : ACCOUNT HOLDER NAME:</td>
				<td><input type="text" disabled="disabled" name="referencename"
					value=<%=r.getReference_account_holder_name()%>></td>
			</tr>
			<tr>
				<td>REFERENCE : ACCOUNT HOLDER ACCOUNT NUMBER:</td>
				<td><input type="text" disabled="disabled"
					name="referencenumber"
					value=<%=r.getReference_account_holder_account_number()%>></td>
			</tr>
			<tr>
				<td>REFERENCE : ACCOUNT HOLDER ADDRESS:</td>
				<td><input type="text" name="referenceadd"
					id="referenceaddress" onclick="validateiddocno()"
					value=<%=r.getReference_account_holder_address()%>></td>
				<td><div style="color: red;" id="ra1"></div></td>
			</tr>
			<tr>
				<td>ADDRESS:</td>
				<td><input type="text" name="address" onclick="validaterahaa()"
					id="address" value=<%=r.getAddress()%>></td>
				<td width="250"><div style="color: red;" id="a1"></div></td>
			</tr>
			<tr>
				<td>CONTACT NUMBER:</td>
				<td><input type="text" name="contactnumber"
					onclick="validateaddress()" id="contactnumber"
					value=<%=r.getContact_no()%>></td>
				<td width="250"><div style="color: red;" id="cno1"></div></td>
			</tr>
			<tr>
				<td>MAIL ID:</td>
				<td><input type="text" name="email" id="email"
					onclick="validatecontactno()" value=<%=r.getEmail_address()%>></td>
				<td width="250"><div style="color: red;" id="e1"></div></td>
			</tr>
			<tr>
				<td>MARITIAL STATUS:</td>
				<td><input type="text" disabled="disabled" name="mstatus"
					value=<%=r.getMarital_status()%>></td>
			</tr>
			<tr>
				<td>ACCOUNT TYPE:</td>
				<td><input type="text" disabled="disabled" name="acctype"
					value=<%=r.getAcctype()%>></td>
			</tr>
			<tr>
				<td>CITIZENSHIP:</td>
				<td><input type="text" name="citizenship" id="citizenship"
					onclick="validateemail()" value=<%=r.getCitizenship()%>></td>
				<td width="250"><div style="color: red;" id="c1"></div></td>
			</tr>
			<tr>
				<td>CITIZEN STATUS:</td>
				<td><input type="text" disabled="disabled" name="citizenstatus"
					value=<%=r.getCitizen_status()%>></td>
			</tr>
			<tr>
				<td>GUARDIAN TYPE:</td>
				<td><input type="text" disabled="disabled" name="gtype"
					value=<%=r.getGuardian_type()%>></td>
			</tr>
			<tr>
				<td>GUARDIAN NAME:</td>
				<td><input type="text" disabled="disabled" name="gname"
					value=<%=r.getGuardian_name()%>></td>
			</tr>

			<tr>
				<td><input
					style='padding: 10px 10px; font-size: 12px; text-align: center; cursor: pointer; outline: none; color: #fff; background-color: #4CAF50; border: none; border-radius: 15px; box-shadow: 0 9px #999;'
					type="submit" name="updatecheck" value="UPDATE"></td>
			</tr>
		</table>
	</form>
</body>
<%
	}
	}
%>
</html>