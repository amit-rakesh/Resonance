
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Popup contact form</title>

<link href="<c:url value="/resources/css/dashboard.css" />"
	rel="stylesheet">
</head>
<!-- Body Starts Here -->
<body>
	<div class="container-fluid" id="userprofile">
		<div class="header">
			<h3 class="text-center text-muted">
				<strong>User</strong> Profile
			</h3>
		</div>
		<section id="profile" class="center col-sm-6 outbox bright">
		<div id="actions">
			<div class="text-right">
				<a href="<c:url value="/user/editInformation" />" type="button"
					class="btn btn-success btn-small"><i
					class="glyphicon glyphicon-pencil"></i>EDIT</a>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="text-center center col-sm-6 well well-small">
			<img alt="User Pic" src="data:image/jpeg;base64,${userimage}"
				class="img-thumbnail">
			<div class="clearfix"></div>
			<div class="text-center lead">
				<c:out value="${user.name}" />
			</div>

		</div>
		<div id="description" class="col-sm-6 center">

			<div class="row">
				<label for="email" class="col-sm-4">Email</label>
				<div id="email" class="col-sm-8">
					<c:out value="${user.email}" />
				</div>
			</div>
			<div class="row">
				<label for="state" class="col-sm-4">State</label>
				<div id="state" class="col-sm-8">
					<c:out value="${user.state}" />
				</div>
			</div>
			<div class="row">
				<label for="sex" class="col-sm-4">Sex</label>
				<div id="sex" class="col-sm-8">
					<c:out value="${user.sex}" />
				</div>
			</div>
			<div class="row">
				<label for="age" class="col-sm-4">Age</label>
				<div id="age" class="col-sm-8">
					<c:out value="${user.age}" />
				</div>
			</div>
			<div class="clearfix"></div>
		</div>




		<div class="clearfix"></div>
		</section>
	</div>


</body>
<!-- Body Ends Here -->
</html>

