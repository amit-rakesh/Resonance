<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Popup contact form</title>

<link href="resources/css/elements.css" rel="stylesheet">

<script >
//Validating Empty Field
function check_empty() {
if (document.getElementById('name').value == "" || document.getElementById('email').value == "" || document.getElementById('msg').value == "") {
alert("Fill All Fields !");
} else {
document.getElementById('form').submit();
alert("Form Submitted Successfully...");
}
}
//Function To Display Popup
function div_show() {
document.getElementById('abc').style.display = "block";
}
//Function to Hide Popup
function div_hide(){
document.getElementById('abc').style.display = "none";
}
</script>
</head>
<!-- Body Starts Here -->
<body id="body" style="overflow:hidden;">
<div id="abc">
<!-- Popup Div Starts Here -->
<div id="popupContact">
<!-- Contact Us Form -->
<form:form action="/resonance/song/upload" id="form" method="post" name="form" modelAttribute = "song" enctype="application/json">
<img id="close" src="images/3.png" onclick ="div_hide()">
<h2>Upload</h2>
<hr>
<form:input path="songTitle" id="title" name="title"  type="text"/>
<form:input path="uploadedByUserId" id="user" name="user"  type="text"/>

<form:input path="songPath" type="file"/>
<button type="submit"  id="submit">submit</button>
</form:form>
</div>
<!-- Popup Div Ends Here -->
</div>
<!-- Display Popup Button -->
<h1>Click Button To upload</h1>
<button id="popup" onclick="div_show()">Upload</button>
</body>
<!-- Body Ends Here -->
</html>