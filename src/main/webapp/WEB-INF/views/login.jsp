<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<title>Resonance</title>

<!-- Google Fonts -->


<link rel="stylesheet"
	href="<c:url value='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900'/>"
	type='text/css'>


<link rel="stylesheet"
	href="<c:url value="/resources/css/animatelogin.css" />">
<!-- Custom Stylesheet -->

<link rel="stylesheet"
	href="<c:url value="/resources/css/stylelogin.css" />">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
</head>
<body>


	<c:out value="${error}"></c:out>
	<form:form method="post" action="/resonance/user/login"
		modelAttribute="user" enctype="application/json">

		<div class="container">
			<div class="top">
				<h1 id="title" class="hidden">
					<span id="logo"> <span>RESONANCE</span></span>
				</h1>
			</div>
			<div class="login-box animated fadeInUp">
				<div class="box-header">
					<h2>Log In</h2>
				</div>
				<label>Email</label> <br />
				<form:input path="email" type="text" name="email" />
				<br /> <label for="password">Password</label> <br />

				<form:input path="password" type="password" name="pass" />
s
				<br />
				<button type="submit">Sign In</button>
				<br /> <a href="#"><p class="small">Forgot your password?</p></a>
			</div>
		</div>



	</form:form>


<script>
	$(document).ready(function () {
    	$('#logo').addClass('animated fadeInDown');
    	$("input:text:visible:first").focus();
	});
	$('#username').focus(function() {
		$('label[for="username"]').addClass('selected');
	});
	$('#username').blur(function() {
		$('label[for="username"]').removeClass('selected');
	});
	$('#password').focus(function() {
		$('label[for="password"]').addClass('selected');
	});
	$('#password').blur(function() {
		$('label[for="password"]').removeClass('selected');
	});
</script>
</body>
</html>