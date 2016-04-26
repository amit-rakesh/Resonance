
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

<link href="resources/css/elements.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/bootstrap.css" rel="stylesheet">

</head>
<!-- Body Starts Here -->
<body>
	<div class="uploadSongHead">
		<h1>UPLOAD</h1>
	</div>
	<div class="uploadSongForm">
		<form:form action="/resonance/song/upload" id="form" method="post"
			name="form" modelAttribute="song" enctype="application/json">
			<fieldset class="form-group">
				<label for="formGroupExampleInput">Song Title</label>
				<form:input path="songTitle" type="text" class="form-control"
					id="formGroupExampleInput" placeholder="Example input" />
			</fieldset>
			<fieldset class="form-group">
				<label for="formGroupExampleInput2">File </label>
				<form:input path="songPath" type="file" />
			</fieldset>
			<button type="submit" class="btn btn-inverse">Submit</button>
		</form:form>
	</div>

</body>
<!-- Body Ends Here -->
</html>

