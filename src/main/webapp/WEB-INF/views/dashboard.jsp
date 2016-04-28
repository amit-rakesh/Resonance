
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

<link href="<c:url value="resources/css/elements.css" />"
	rel="stylesheet">
<link href="<c:url value = "resources/css/style.css" />"
	rel="stylesheet">
<link href="<c:url value="resources/css/bootstrap.css" />"
	rel="stylesheet">
<link href="<c:url value="resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<c:url value="resources/css/sidebar.css" />"
	rel="stylesheet">

</head>
<!-- Body Starts Here -->
<body>


	<div class="panel panel-info">
		<div class="panel-heading">

		<div class="container-fluid">
		<div class="row">
			<div class="col-lg-6 col-md-6 col-sm-6">
			
			
			<h4><b><c:out value="${user.name}" /></b></h4>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6">
			
			<a href="<c:url value="/user/editInformation" />" type="button" class="btn btn-success" style="float:right">EDIT</a>
			
			</div>
		</div>
		</div>

		</div>
		<div class="panel-body">
			<div class="row">
				<div class="col-md-3 col-lg-3 " align="center">
					<img alt="User Pic" src="data:image/jpeg;base64,${userimage}"
						class="img-responsive">
				</div>


				<div class=" col-md-9 col-lg-9 ">
					<table class="table table-user-information">
						<tbody>
							<tr>
								<td>email</td>
								<td><c:out value="${user.email}" /></td>
							</tr>
							<tr>
								<td>State</td>
								<td><c:out value="${user.state}" /></td>
							</tr>
							<tr>
								<td>Country</td>
								<td><c:out value="${user.country}" /></td>
							</tr>
							<tr>
								<td>Age</td>
								<td><c:out value="${user.age}" /></td>
							</tr>
							<tr>
								<td>Sex</td>
								<td><c:out value="${user.sex}" /></td>
							</tr>
						</tbody>
					</table>


				</div>
			</div>
		</div>


	</div>
	<!-- old dashboard 
	<div>
		<br>
		<h1>Here's something about you</h1>

		<img alt="Generic placeholder thumbnail"
			src="data:image/jpeg;base64,${userimage}"
			class="img-circle center-block" height="200" width="200" />


		<h1>
			Well, Hello
			<c:out value="${user.name}" />
		</h1>
		<br />

		<h2>
			I've heard you are from
			<c:out value="${user.state}" />

			<c:out value="${user.country}" />
		</h2>


		<div class="row">
			<div class="col-xs-5 col-sm-12">
				<h3>General Information</h3>

				<ul class="profile-details">
					<li>
						<div>
							<i class="fa fa-briefcase"></i> position
						</div> CEO
					</li>
					<li>
						<div>
							<i class="fa fa-building-o"></i> company
						</div> creativeLabs
					</li>
				</ul>

				<h3>Contact Information</h3>

				<ul class="profile-details">
					<li>
						<div>
							<i class="fa fa-phone"></i> phone
						</div> +48 123 456 789
					</li>
					<li>
						<div>
							<i class="fa fa-tablet"></i> mobile phone
						</div> +48 123 456 789
					</li>
					<li>
						<div>
							<i class="fa fa-envelope"></i> e-mail
						</div> lukasz@bootstrapmaster.com
					</li>
					<li>
						<div>
							<i class="fa fa-map-marker"></i> address
						</div> Konopnickiej 42<br /> 43-190 Mikolow<br /> Slask, Poland
					</li>
				</ul>
			</div>
		</div>
		/row
	</div>



old dashboard end
-->

</body>
<!-- Body Ends Here -->
</html>

