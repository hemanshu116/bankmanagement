
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
window.history.forward(1);
</script>
<title>Registration</title>

<script type="text/javascript" src="validation.js">
	
</script>

</head>
<%
	DateFormat f = new SimpleDateFormat("dd-MMM-yy");
	String date = f.format(new Date());
	if (request.getAttribute("error") == null) {
		request.setAttribute("error", "");
	}
%>
<body>
	<jsp:include page="Homepage.jsp"></jsp:include>
	<a href="http://192.168.60.22:8090/MFRP/Homepage.html"> <img
		style='position: absolute; top: 0px; right: 0px;' border="0"
		alt="homepage" src="homepage.png" width="50" height="50">
	</a>
	<center>
		<p>
			<%=request.getAttribute("error")%>
		</p>
	</center>
	<form action="registercheck" method="post" onsubmit="return finals();">
		<table align="center">
			<tr>
				<td>Name:</td>
				<td><input type="text" id="name" id="name" name="name"><br>
					<br></td>
				<td width="250"><div style="color: red;" id="n"></div></td>
			</tr>
			<tr>
				<td>Username:</td>
				<td><input type="text" id="username" name="username"
					onclick="validatename()"><br> <br></td>
				<td width="250"><div style="color: red;" id="u"></div></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" id="password" name="password"
					onclick="validateusername()"><br> <br></td>
				<td width="250"><div style="color: red;" id="p"></div></td>
			</tr>
			<tr>
				<td>Re-type Password:</td>
				<td><input type="password" id="re-typepassword"
					name="re-typepassword " onclick="validatepassword()"><br>
					<br></td>
				<td width="250"><div style="color: red;" id="rt"></div></td>
			</tr>
			<tr>
				<td>Guardian Type:</td>
				<td><input type="text" id="gtype" name="gtype"
					onclick="validaterpassword()"><br> <br></td>
				<td width="250"><div style="color: red;" id="gt"></div></td>
			</tr>
			<tr>
				<td>Guardian Name:</td>
				<td><input type="text" id="gname" name="gname"
					onclick="validategtype()"><br> <br></td>
				<td width="250"><div style="color: red;" id="gn"></div></td>
			</tr>
			<tr>
				<td>Address:</td>
				<td><textarea style="resize: vertical;" cols="18" rows="2" id="address" name="address"
						onclick="validategname()"> </textarea><br> <br></td>
				<td width="250"><div style="color: red;" id="a"></div></td>
			</tr>
			<tr>
				<td>Citizenship:</td>
				<td><input type="text" id="citizenship" name="citizenship"
					onclick="validateaddress()"><br> <br></td>
				<td width="250"><div style="color: red;" id="c"></div></td>
			</tr>

			<tr>
				<td>Country:</td>
				<td><select name="country"
					onChange="printStateMenu(this.value);" id="country">
						<option value="INDIA">INDIA</option>
						<option value="UK">UK</option>
						<option value="USA">USA</option>
						<option value="ITALY">ITALY</option>
				</select><br> <br></td>
			</tr>

			<tr>
				<td>State:</td>
				<td>
					<div id="stateSelect">
						<select name="state" id="state"
							onchange="document.getElementById(\'stateValue\').innerHTML = this.value;">
							<option value="TAMILNADU">TAMILNADU</option>
							<option value="KERALA">KERALA</option>
							<option value="KARNATAKA">KARNATAKA</option>
							<option value="AP">ANDHRA PRADESH</option>
						</select>
					</div>
				</td>
			</tr>


			<tr>
				<td>Email Address:</td>
				<td><input type="text" id="email" name="email"
					onclick="validatecitizenship()"><br> <br></td>
				<td width="250"><div style="color: red;" id="e"></div></td>
			</tr>

			<tr>
				<td>Gender:</td>
				<td><input type="radio" id="gender" name="gender"
					onclick="validateemail()" value="M">Male <input
					type="radio" id="gender" name="gender" onclick="validateemail()"
					value="F"> Female <br> <br></td>

			</tr>

			<tr>
				<td>Marital Status:</td>
				<td><select name="mstatus" id="mstatus">
						<option value="SINGLE">SINGLE</option>
						<option value="MARRIED">MARRIED</option>
						<option value="DIVORCEE">DIVORCEE</option>
				</select><br> <br></td>
				<td width="250"><div style="color: red;" id="m"></div></td>
			</tr>

			<tr>
				<td>Contact no:</td>
				<td><input type="text" id="contactnumber" name="contactnumber"
					maxlength="10"><br> <br></td>
				<td width="250"><div style="color: red;" id="cno"></div></td>
			</tr>

			<tr>
				<td>Date of Birth:</td>
				<td><input type="date" id="dob" name="dob"
					onclick="validatecontactno()" onchange="updatecitizenstatus()"><br>
					<br></td>
				<td width="250"><div style="color: red;" id="dob"></div></td>
			</tr>

			<tr>
				<td>Registration Date:</td>
				<td><input type="text" readonly="readonly" value=<%=date%>
					id="rd" name="rd"><br> <br></td>
			</tr>

			<tr>
				<td>Account type:</td>
				<td><select name="acctype" id="acctype" onclick="validatedob()"
					onchange="validateIDA()">
						<option value="SAVINGS">SAVINGS</option>
						<option value="SALARY">SALARY</option>
				</select><br> <br></td>
			</tr>

			<tr>
				<td>Branch Name:</td>
				<td><select name="branchname">
						<option value="VALASARVAKKAM">VALASARAVAKKAM</option>
						<option value="TNAGAR">TNAGAR</option>
						<option value="TNAGAR-ABC">TNAGAR-ABC</option>
						<option value="PERUNGUDI">PERUNGUDI</option>
						<option value="SAIDAPET">SAIDAPET</option>
						<option value="TNAGAR-XYZ">TNAGAR-XYZ</option>
						<option value="SHOLLINGNALLUR">SHOLLINGNALLUR</option>
						<option value="PERUNGUDI">PERUNGUDI</option>
						<option value="NUMGAMBAKKAM">NUMGAMBAKKAM</option>
				</select> <br> <br> <br></td>
			</tr>

			<tr>
				<td>Citizen status:</td>
				<td><input type="text" id="citizenstatus" readonly="readonly"
					name="citizenstatus"><br> <br></td>
			</tr>

			<tr>
				<td>Initial Deposit Amount:</td>
				<td><input type="text" id="initialamount" name="initialamount"
					readonly="readonly"><br> <br></td>
				<td width="250"><div style="color: red;" id="da"></div></td>
			</tr>
			<tr>
				<td>Identification Document No.:</td>
				<td><input type="text" id="IDno" name="IDno"
					onclick="validatedepositamount()"><br> <br></td>
				<td width="250"><div style="color: red;" id="i"></div></td>
			</tr>

			<tr>
				<td>Identification Proof Type:</td>
				<td><input type="text" id="IDtype" name="IDtype"
					onclick="validateiddocno()"><br> <br></td>
				<td width="250" s><div style="color: red;" id="it"></div></td>
			</tr>

			<tr>
				<td>Reference account holder name:</td>
				<td><input type="text" id="referencename" name="referencename"
					onclick="validateidptype()"><br> <br></td>
				<td><div style="color: red;" id="rn"></div></td>
			</tr>

			<tr>
				<td>Reference account holder acc. No.:</td>
				<td><input type="text" id="referenceaccno"
					name="referenceaccno" onclick="validaterahn()"><br> <br></td>
				<td><div style="color: red;" id="rno"></div></td>
			</tr>

			<tr>
				<td>Reference account holder address:</td>
				<td><input type="text" id="referenceaddress"
					name="referenceaddress" onclick="validaterahan()"><br>
					<br></td>
				<td><div style="color: red;" id="ra"></div></td>
			</tr>

			<tr>
				<td><input
					style='padding: 10px 10px; font-size: 12px; text-align: center; cursor: pointer; outline: none; color: #fff; background-color: #4CAF50; border: none; border-radius: 15px; box-shadow: 0 9px #999;'
					type="submit" value="Submit" name="butt"></td>
				<td><input
					style='padding: 10px 10px; font-size: 12px; text-align: center; cursor: pointer; outline: none; color: #fff; background-color: #4CAF50; border: none; border-radius: 15px; box-shadow: 0 9px #999;'
					type="reset" value="Reset" name="butt"></td>


			</tr>
		</table>
	</form>

</body>
</html>
​​
