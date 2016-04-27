<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>

<head>
<META http-equiv="Content-Type" content="text/html;charset=UTF-8">

<title>Edit Information</title>


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

<script>
function Validate()
{
var image =document.getElementById("image").value;
if(image!=''){
var checkimg = image.toLowerCase();
if (!checkimg.match(/(\.jpg|\.png|\.JPG|\.PNG|\.jpeg|\.JPEG)$/)){
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

<div class="panel panel-info">
		<div class="panel-heading">
			<h3 class="panel-title">Edit Information</h3>
		</div>
		<div class="panel-body">
			<div class="row">
				
				<form:form action="/resonance/user/edit" id="form" method="post"
			name="form" modelAttribute="user" enctype="multipart/form-data" onSubmit="return Validate();">
				<div class=" col-md-9 col-lg-9 col-sm-9">
				
					<table class="table table-user-information">
						<tbody>
							<tr>
							
								<td>UserName</td>
								<td><form:input path="name" type="text" class="form-control"
					id="formGroupExampleInput" value="${user.name}" /></td>
							</tr>
							<tr>
								<td>Email</td>
								<td><form:input path="email" type="text" class="form-control"
					id="formGroupExampleInput" value="${user.email}" /></td>
							</tr>
							<tr>
								<td>State</td>
								<td><form:input path="state" type="text" class="form-control"
					id="formGroupExampleInput" value="${user.state}" /></td>
							</tr>
							<tr>
								<td>Country</td>
								<td><form:input path="country" type="text" class="form-control"
					id="formGroupExampleInput" value="${user.country}" /></td>
							</tr>
							<tr>
								<td>Age</td>
								<td><form:input path="age" type="text" class="form-control"
					id="formGroupExampleInput" value="${user.age}" /></td>
							</tr>
							<tr>
								<td>Sex</td>
								<td><form:input path="sex" type="text" class="form-control"
					id="formGroupExampleInput" value="${user.sex}" /></td>
							</tr>
						</tbody>
					</table>
					
				</div>
				<div class=" col-md-3 col-lg-3 col-sm-3">
				<table>
				<tr><td><img alt="User Pic"
						src="data:image/jpeg;base64,${userimage}"
						class="img-responsive">
						</td></tr>
						<tr><td>
					<input id="image" name = "file" type="file" />
					</td></tr>
					</table>
				</div>
				<div class="container-fluid">
				<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
				<button type="submit" value = "upload" class="btn btn-inverse">Submit</button>
					 
					<!--  <a href="<c:url value="/user/getDashboard" />" class="btn btn-success" type="submit">Submit</a>
					 -->
					</div>
					</div>
					</div>
				</form:form>
			</div>
		</div>


	</div>
</body>


</html>