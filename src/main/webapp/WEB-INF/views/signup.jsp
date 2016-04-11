<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Sign Up Page</title>

<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/resources/css/jquery.ketchup.css" />">


    <script type="text/javascript" src="<c:url value="/resources/js/jquery-1.4.4.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery.ketchup.all.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery.validate.js"/>"></script>
<script type="text/javascript">
window.onload= initPage;
function initPage(){
	$('#default-behavior').ketchup();
}
</script>

<script>


function registeruser(){
	
	  
	 var name = document.getElementById("name").value;
	 var email = document.getElementById("email").value;
	 var pass = document.getElementById("password").value;
	 var confirmpass = document.getElementById("confirmpass").value;
	 var state = document.getElementById("state").value;
	 var country = document.getElementById("country").value;
	 
	 alert(email);

		 if(!validateEmail(email)){
			 alert("Please enter valid email");
		 }
		 else{
			 if(pass!=confirmpass){
				 alert("password mismatch");
			 }
			 else{
				 alert("Matched");
				 document.getElementById("default-behavior").submit();// Form submission
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
<link href="<c:url value='/resources/favicon.ico'/>" rel="icon"> 
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/signin.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/ie-emulation-modes-warning.js" />"></script>
</head>
<body>
	<div class="container">
 	<img src="<c:url value="/resources/images/Resonance_Logo.jpg" />" alt="Smiley face" height="250" width="400" id="logo" >
	
	<form:form method="post" action="/resonance/user/signup" modelAttribute="user" class="form-signin" role="form" id="default-behavior">
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
		<h2 class="form-signin-heading">Please Sign Up</h2>
        <label for="inputEmail" class="sr-only">App Username</label>
        <form:input type="text" path="name" id="name" class="form-control" placeholder="App Username" data-validate="validate(required)" />
        <label for="inputPassword" class="sr-only">App Password</label>
        <form:input type="password" path="password" id="password" class="form-control" placeholder="App Password" data-validate="validate(required)"/>
        <input type="password"  id="confirmpass" class="form-control" placeholder="Confirm Password" data-validate="validate(required)"/>
        <form:input type="text" path="email" id="email" class="form-control" placeholder="Email" data-validate="validate(required)"/>
        <form:input type="text" path="state" id="state" class="form-control" placeholder="State" data-validate="validate(required)"/>
        <form:input type="text" path="country" id="country" class="form-control" placeholder="Country" data-validate="validate(required)"/>
        
        <button class="btn btn-lg btn-primary btn-block"  onclick="registeruser();">Signup</button>
		
	</form:form>
	</div>
	
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="<c:url value="/resources/js/ie10-viewport-bug-workaround.js" />"></script>
</body>
</html>