<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>

<head>
<META http-equiv="Content-Type" content="text/html;charset=UTF-8">

<title>Edit Information</title>
<link href="<c:url value="/resources/css/dashboard.css" />"
	rel="stylesheet">
<script>
	function Validate() {
		var image = document.getElementById("image").value;
		if (image != '') {
			var checkimg = image.toLowerCase();
			if (!checkimg.match(/(\.jpg|\.png|\.JPG|\.PNG|\.jpeg|\.JPEG)$/)) {
				alert("Please enter Image File Extensions .jpg,.png,.jpeg");
				document.getElementById("image").focus();
				return false;
			}
		}
		return true;
	}
</script>
</head>


<body>
	<div class="container-fluid">
		<div class="header">
			<h3 class="text-center text-muted">
				<strong>Edit</strong> Information
			</h3>
		</div>
		<form:form class="form-horizontal col-sm-6 outbox bright center"
			action="/resonance/user/edit" id="form" method="post" name="form"
			modelAttribute="user" enctype="multipart/form-data"
			onSubmit="return Validate();">
			<header>

				<div class="col-sm-6 center">
					<div class="img-wrapper">
						<img alt="User Pic" src="data:image/jpeg;base64,${userimage}"
							class="img-responsive" id="userimage" />
						<div class="clearfix"></div>
					</div>
					<input class="filestyle" id="image" name="file" type="file"
						data-buttonText="Upload Image" data-buttonName="btn-primary"
						data-iconName="glyphicon glyphicon-camera" />
					<div class="clearfix"></div>
				</div>
			</header>

			<div class="form-content m-t-40">
				<div class="form-group">
					<label for="formGroupUsername" class="col-sm-3 control-label">Username:</label>
					<div class="col-sm-6">
						<form:input class="form-control" path="name" type="text"
							id="formGroupUsername" value="${user.name}" />
					</div>
				</div>

				<div class="form-group">
					<label for="formGroupEmail" class="col-sm-3 control-label">Email:</label>
					<div class="col-sm-8">
						<form:input class="form-control" path="email" type="text"
							id="formGroupEmail" value="${user.email}" />
					</div>
				</div>

				<div class="form-group">
					<label for="formGroupState" class="col-sm-3 control-label">State:</label>
					<div class="col-sm-6">
						<form:input class="form-control" path="state" type="text"
							id="formGroupState" value="${user.state}" />
					</div>
				</div>

				<div class="form-group">
					<label for="formGroupCountry" class="col-sm-3 control-label">Country:</label>
					<div class="col-sm-6">
						<form:input class="form-control" path="country" type="text"
							id="formGroupCountry" value="${user.country}" />
					</div>
				</div>

				<div class="form-group">
					<label for="formGroupSex" class="col-sm-3 control-label">Sex:</label>
					<div class="col-sm-4">
						<form:input class="form-control" path="sex" type="text"
							id="formGroupSex" value="${user.sex}" />
					</div>
				</div>

				<div class="form-group">
					<label for="formGroupAge" class="col-sm-3 control-label">Age:</label>
					<div class="col-sm-4">
						<form:input class="form-control" path="age" type="text"
							id="formGroupAge" value="${user.age}" />
					</div>
				</div>


				<div id="actions" class="text-right">
					<button type="submit" value="upload" class="btn btn btn-success">Save</button>
					<div class="clearfix"></div>
				</div>
			</div>
		</form:form>
	</div>
</body>


</html>