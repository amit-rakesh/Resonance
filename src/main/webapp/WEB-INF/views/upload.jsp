<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<META http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>Upload Example</title>
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
		<form:form class="form-horizontal col-sm-6 center" modelAttribute="user" name="frm"
			enctype="multipart/form-data" method="post"
			onSubmit="return Validate();">
			<fieldset>
				<legend>Upload File</legend>
				<table>
					<tr>
						<td><label>File</label><br /></td>
						<td><input id="image" name="file" type="file" /> <br /></td>
						<td><form:input name="userid" path="userid" type="text" /><br /></td>
					</tr>
					<tr>
						<td><br /></td>
						<td><input type="submit" value="Upload" /></td>
					</tr>
				</table>
			</fieldset>
		</form:form>
	</div>
</body>
</html>