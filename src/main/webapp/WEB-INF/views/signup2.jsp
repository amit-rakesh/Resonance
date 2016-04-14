
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Resonance-Sign Up</title>



<link rel="stylesheet"
	href="<c:url value="/resources/css/resosignup.css" />">




<script>
	function registeruser() {

		var name = document.getElementById("name").value;
		var email = document.getElementById("email").value;
		var pass = document.getElementById("password").value;
		var confirmpass = document.getElementById("confirmpass").value;
		var state = document.getElementById("state").value;
		var country = document.getElementById("country").value;

		alert(email);

		if (!validateEmail(email)) {
			alert("Please enter valid email");
		} else {
			if (pass != confirmpass) {
				alert("password mismatch");
			} else {
				alert("Matched");
				document.getElementById("default-behavior").submit(); // Form submission
			}
		}
	}

	function validateEmail(useremail) {
		var reg = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/;

		if (reg.test(useremail)) {
			return true;

		}
		return false;
	}
</script>

</head>

<body>
<form:form method="post" action="/resonance/user/signup" modelAttribute="user" class="form-signin" role="form" id="signup">
	<c:if test="${signupError ne null && not empty signupError}">
			<div class="alert alert-danger" role="alert">
				<div align="center">
					<strong style="color: red;">
						<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						<spring:message code="${signupError}"/>
					</strong>
				</div>
			</div>
		</c:if>
	

		<h1>RESONANCE</h1>


		<form:input type="text" path="name" id="name" class="form-control"
			placeholder="Name" data-validate="validate(required)" />
		<form:input type="email" path="email" id="email" class="form-control"
			placeholder="john.doe@email.com" data-validate="validate(required)" />
		<form:input type="password" path="password" id="password"
			class="form-control" placeholder="Choose your password"
			data-validate="validate(required)" />
		<input type="password" id="confirmpass" class="form-control"
			placeholder="Confirm Password" data-validate="validate(required)" />
		<form:input type="text" path="country" id="country"
			class="form-control" placeholder="Country"
			data-validate="validate(required)" />
		<form:input type="text" path="state" id="state" class="form-control"
			placeholder="State" data-validate="validate(required)" />
		<button type="submit" onclick="registeruser();">Sign Up</button>

	</form:form>





</body>

</html>