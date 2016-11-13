function validatename() {
	var name = document.getElementById("name").value;
	var name1 = name.replace(/\w/g, "");
	var name2 = name1.replace(/\s/g, "");
	if (name != "") {
		if (name2.length == 0 && name.length >= 4 && name.search("[0-9]") < 0) {
			document.getElementById("n").innerHTML = " ";
		} else {
			document.getElementById("n").innerHTML = "Fill in with characters only";
		}
	} else {
		document.getElementById("n").innerHTML = "Fill in with characters only";
	}
}
function validateusername() {
	var username = document.getElementById("username").value;
	var username1 = username.replace(/\w/g, "");
	var username2 = username1.replace(/\s/g, "");
	if (username != "") {
		if (username2.length == 0 && username.search("[a-zA-z]") >= 0
				&& username.length >= 8 && username.search("[0-9]") >= 0) {
			document.getElementById("u").innerHTML = " ";

		} else {
			document.getElementById("u").innerHTML = "Fill in with characters,numbers and minimum 8 characters";

		}
	} else {
		document.getElementById("u").innerHTML = "Fill in with characters,numbers minimum 8 characters";

	}
}
function validatepassword() {
	var password = document.getElementById("password").value;
	if (password != "") {
		if (password.search("[a-z]") >= 0 && password.search("[A-Z]") >= 0
				&& password.length >= 8 && password.search("[0-9]") >= 0
				&& password.search("[@#$%^&*]") >= 0) {
			document.getElementById("p").innerHTML = " ";

		} else {
			document.getElementById("p").innerHTML = "Fill in with uppercase,characters and numbers and special characters(@,#,$,%,^,&,*)";

		}
	} else {
		document.getElementById("p").innerHTML = "Fill in with uppercase,characters and numbers and special characters(@,#,$,%,^,&,*)";

	}
}
function validaterpassword() {
	var rpassword0 = document.getElementById("password").value;
	var rpasssoword = document.getElementById("re-typepassword").value;
	if (rpasssoword == rpassword0 && rpasssoword != "" && rpassword0 != "") {
		document.getElementById("rt").innerHTML = " ";
	} else {
		document.getElementById("rt").innerHTML = "password mismatch";
	}
}
function validategtype() {
	var gtype = document.getElementById("gtype").value;
	if (gtype != "") {
		if (gtype.search("[a-zA-z]") >= 0 && gtype.length >= 4) {
			document.getElementById("gt").innerHTML = " ";

		} else {
			document.getElementById("gt").innerHTML = "Fill in with characters";

		}
	} else {
		document.getElementById("gt").innerHTML = "Fill in with characters";

	}
}
function validategname() {
	var gname = document.getElementById("gname").value;
	if (gname != "") {
		if (gname.search("[a-zA-z]") >= 0 && gname.length >= 4) {
			document.getElementById("gn").innerHTML = " ";

		} else {
			document.getElementById("gn").innerHTML = "Fill in with characters";

		}
	} else {
		document.getElementById("gn").innerHTML = "Fill in with characters";

	}
}
function validateaddress() {
	var address = document.getElementById("address").value;
	if (address != "") {
		if (address.search("[a-zA-z]") >= 0) {
			document.getElementById("a").innerHTML = " ";

		} else {
			document.getElementById("a").innerHTML = "Fill in with characters ";

		}
	} else {
		document.getElementById("a").innerHTML = "Fill in with characters ";

	}
}
function validatecitizenship() {
	var citizenship = document.getElementById("citizenship").value;
	if (citizenship != "") {
		if (citizenship.search("[a-zA-Z]") >= 0) {
			document.getElementById("c").innerHTML = " ";

		} else {
			document.getElementById("c").innerHTML = "Fill in with characters";

		}
	} else {
		document.getElementById("c").innerHTML = "Fill in with characters";

	}
}
function validateemail() {
	var email = document.getElementById("email").value;
	if (email != "") {
		if (email.search("[a-zA-z]") >= 0 && email.length >= 8
				&& email.search("[@]") > 0 && email.search("[.]") > 0) {
			document.getElementById("e").innerHTML = " ";

		} else {
			document.getElementById("e").innerHTML = "Fill in with characters and numbers and special characters(@,#,$,%,^,&,*)";

		}
	} else {
		document.getElementById("e").innerHTML = "Fill in with characters and numbers and special characters(@,#,$,%,^,&,*)";

	}
}
function validatecontactno() {
	var contactnumber = document.getElementById("contactnumber").value;
	var contactnumber1 = contactnumber.replace(/\d/g, "");
	if (contactnumber != "") {
		if (contactnumber.length == 10 && contactnumber1.length == 0) {
			document.getElementById("cno").innerHTML = " ";

		} else {
			document.getElementById("cno").innerHTML = "Fill in with numbers and length 10";

		}
	} else {
		document.getElementById("cno").innerHTML = "Fill in with numbers and length 10";

	}
}
function validatedepositamount() {
	var initialamount = document.getElementById("initialamount").value;
	var initialamount1 = initialamount.replace(/\d/g, "");
	if (initialamount != "") {
		if (initialamount.length >= 4 && initialamount1.length == 0) {
			document.getElementById("da").innerHTML = " ";

		} else {
			document.getElementById("da").innerHTML = "Fill in with numbers and minimum length 4";

		}
	} else {
		document.getElementById("da").innerHTML = "Fill in with numbers and minimum length 4";

	}
}
function validateiddocno() {
	var IDno = document.getElementById("IDno").value;
	if (IDno != "" && IDno.length >= 4) {
		if (IDno.search("[a-zA-z]") >= 0 || IDno.search("[0-9]") >= 0) {
			document.getElementById("i").innerHTML = " ";

		} else {
			document.getElementById("i").innerHTML = "Fill in with characters and numbers";

		}
	} else {
		document.getElementById("i").innerHTML = "Fill in with characters and numbers";

	}
}
function validateidptype() {
	var IDtype = document.getElementById("IDtype").value;
	if (IDtype != "") {
		if (IDtype.search("[a-zA-z]") >= 0 && IDtype.length >= 4) {
			document.getElementById("it").innerHTML = " ";

		} else {
			document.getElementById("it").innerHTML = "Fill in with characters";

		}
	} else {
		document.getElementById("it").innerHTML = "Fill in with characters";

	}
}
function validaterahn() {
	var referencename = document.getElementById("referencename").value;
	if (referencename != "") {
		if (referencename.length >= 4 && referenceaccno.search("[a-zA-Z]") >= 0) {
			document.getElementById("rn").innerHTML = " ";

		} else {
			document.getElementById("rn").innerHTML = "Fill in with characters";

		}
	} else {
		document.getElementById("rn").innerHTML = "Fill in with characters";

	}
}
function validaterahan() {
	var referenceaccno = document.getElementById("referenceaccno").value;
	var referenceaccno1 = referenceaccno.replace(/\d/g, "");
	if (referenceaccno != "") {
		if (referenceaccno.search("[a-zA-z]") < 0
				&& referenceaccno.length == 16 && referenceaccno1.length == 0
				&& referenceaccno.search("[0-9]") >= 0) {
			document.getElementById("rno").innerHTML = " ";

		} else {
			document.getElementById("rno").innerHTML = "Fill in with numbers and length 16";

		}
	} else {
		document.getElementById("rno").innerHTML = "Fill in with numbers and length 16";

	}
}
function validaterahaa() {
	var referenceaddress = document.getElementById("referenceaddress").value;
	if (referenceaddress != "") {
		if (referenceaddress.search("[a-zA-z]") >= 0
				&& referenceaddress.length >= 8) {
			document.getElementById("ra").innerHTML = " ";

		} else {
			document.getElementById("ra").innerHTML = "Fill in with characters";

		}
	} else {
		document.getElementById("ra").innerHTML = "Fill in with characters";
	}
}

function finals() {
	validatename();
	validateusername();
	validatepassword();
	validaterpassword();
	validategtype();
	validategname();
	validateaddress();
	validatecitizenship();
	validatecontactno();
	validatedepositamount();
	validateiddocno();
	validateidptype();
	validaterahn();
	validateemail();
	validaterahan();
	validaterahaa();
	if (document.getElementById("n").innerHTML == " "
			&& document.getElementById("u").innerHTML == " "
			&& document.getElementById("p").innerHTML == " "
			&& document.getElementById("rt").innerHTML == " "
			&& document.getElementById("gt").innerHTML == " "
			&& document.getElementById("gn").innerHTML == " "
			&& document.getElementById("a").innerHTML == " "
			&& document.getElementById("c").innerHTML == " "
			&& document.getElementById("e").innerHTML == " "
			&& document.getElementById("cno").innerHTML == " "
			&& document.getElementById("da").innerHTML == " "
			&& document.getElementById("i").innerHTML == " "
			&& document.getElementById("it").innerHTML == "  "
			&& document.getElementById("rn").innerHTML == ""
			&& document.getElementById("rno").innerHTML == " "
			&& document.getElementById("ra").innerHTML == " ") {
		return true;
	} else {

		return false;
	}
}

function updatecitizenstatus() {
	var date = document.getElementById("dob").value;
	var today = document.getElementById("rd").value;

	var array1 = new Array();
	var array = new Array();
	array = date.split("-");
	array1 = today.split("-");

	var year = parseInt(array[0]);
	var presentyear = parseInt(array1[2]) + 2000;

	if (presentyear - year < 18) {
		document.getElementById("citizenstatus").value = "MINOR";
	} else if (presentyear - year > 18 && presentyear - year <= 60) {
		document.getElementById("citizenstatus").value = "NORMAL";
	} else if (presentyear - year > 60) {
		document.getElementById("citizenstatus").value = "SENIOR";
	}
}

function validateIDA() {
	var country = document.getElementById("country").value;
	var acctype = document.getElementById("acctype").value;
	if (acctype == "SALARY") {
		document.getElementById("initialamount").value = "0";
	} else if (country == "INDIA" && acctype == "SAVINGS") {
		document.getElementById("initialamount").value = "5000";
	} else if (country == "UK" && acctype == "SAVINGS") {
		document.getElementById("initialamount").value = "14000";
	} else if (country == "USA" && acctype == "SAVINGS") {
		document.getElementById("initialamount").value = "15000";
	} else if (country == "ITALY" && acctype == "SAVINGS") {
		document.getElementById("initialamount").value = "13000";
	}

}

function printStateMenu(country) {
	var stateSelect = '';
	if (country == 'INDIA') {
		stateSelect = '<select name="state" id="state" onchange="document.getElementById(\'stateValue\').innerHTML = this.value;">'
				+ '<option value="TAMILNADU">TAMILNADU</option>'
				+ '<option value="KERALA">KERALA</option>'
				+ '<option value="KARNATAKA">KARNATAKA</option>'
				+ '<option value="AP">ANDHRA PRADESH</option>' + '</select>';
	} else if (country == 'UK') {
		stateSelect = '<select name="state" id="state" onchange="document.getElementById(\'stateValue\').innerHTML = this.value;">'
				+ '<option value="SCOTLAND">SCOTLAND</option>' + '</select>';
	} else if (country == 'USA') {
		stateSelect = '<select name="state" id="state" onchange="document.getElementById(\'stateValue\').innerHTML = this.value;">'
				+ '<option value="NJ">NEW JERSEY</option>' + '</select>';
	} else if (country == "ITALY") {
		stateSelect = '<select name="state" id="state" onchange="document.getElementById(\'stateValue\').innerHTML = this.value;">'
				+ '<option value="ROME">ROME</option>' + '</select>';
	}

	document.getElementById('stateSelect').innerHTML = stateSelect;
}