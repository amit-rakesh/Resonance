<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Sign Up Resonance</title>

        <!-- CSS -->
           <link rel="stylesheet" href="<c:url value='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500'/>">
        <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>">
        <link rel="stylesheet" href="<c:url value='/resources/css/font-awesome.min.css'/>">
		<link rel="stylesheet" href="<c:url value='/resources/css/form-elements.css'/>">
        <link rel="stylesheet" href="<c:url value='/resources/css/signUpstyle.css'/>">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons -->
         <link rel="shortcut icon" href="<c:url value='/resources/images/favicon.png'/>">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<c:url value='/resources/images/apple-touch-icon-144-precomposed.png'/>">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<c:url value='/resources/images/apple-touch-icon-114-precomposed.png'/>">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<c:url value='/resources/images/apple-touch-icon-72-precomposed.png'/>">
        <link rel="apple-touch-icon-precomposed" href="<c:url value='/resources/images/apple-touch-icon-57-precomposed.png'/>">

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
           
        <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>Resonance</strong> Sign Up</h1>
                            <div class="description">
                            	<!--<p>
	                            	This is a free responsive colored login form made with Bootstrap. 
	                            	Download it on <a href="http://azmind.com"><strong>AZMIND</strong></a>, customize and use it as you like!
                            	</p>-->
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>Sign Up Now</h3>
                            		<p>Fill in the form below to get instant access:</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-lock"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" action="" method="post" class="signup-form">
                                    
                                    <div class="form-group">
			                    		<label class="sr-only" for="form-name">Name</label>
			                        	<form:input path="name" type="text" name="form-username" placeholder="Name..." class="form-username form-control" id="form-name" data-validate="validate(required)"/>
			                        
			                        </div>
                                    
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-email">Email</label>
			                        	<form:input path="email" type="text" name="form-username" placeholder="Email..." class="form-username form-control" id="form-username" data-validate="validate(required)"/>
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">Password</label>
			                        	<form:input path="password" type="password" name="form-password" placeholder="Password..." class="form-password form-control" id="form-password" data-validate="validate(required)"/>
			                        </div>
                                    
                                    <div class="form-group">
			                        	<label class="sr-only" for="form-password">Re-enter Password</label>
			                        	<form:input path="password" type="password" name="form-password" placeholder="Re-enter Password..." class="form-password form-control" id="form-password" data-validate="validate(required)"/>
			                        </div>
                                    
                                    <div class="form-group">
			                    		<label class="sr-only" for="form-country">Country</label>
			                        	<form:input path="country" type="text" name="form-username" placeholder="Country..." class="form-username form-control" id="form-username"/>
			                        </div>
                                    
                                    <div class="form-group">
			                    		<label class="sr-only" for="form-state">State</label>
			                        	<form:input path="state" type="text" name="form-username" placeholder="State..." class="form-username form-control" id="form-username"/>
			                        </div>
                                    
			                        <button type="submit" class="btn" onclick="registeruser();">Sign me up!</button>
			                    </form>
		                    </div>
                        </div>
                    </div>
                 <!--   <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 social-login">
                        	<h3>...or login with:</h3>
                        	<div class="social-login-buttons">
	                        	<a class="btn-link-1" href="#"><i class="fa fa-facebook"></i></a>
	                        	<a class="btn-link-1" href="#"><i class="fa fa-twitter"></i></a>
	                        	<a class="btn-link-1" href="#"><i class="fa fa-google-plus"></i></a>
                        	</div>
                        </div>
                    </div>-->
                </div>
            </div>
            
        </div>

</form:form>
        <!-- Javascript -->
          <script src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
        <script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/resources/js/jquery.backstretch.min.js'/>"></script>
        <script src="<c:url value='/resources/js/scripts.js'/>"></script>
        
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
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

    </body>

</html>