<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Blog</title>
</head>
<body>
	<h1>Create Your Blog</h1>
	<form:form method="post" action="/resonance/blog/create"
		modelAttribute="blog" class="form-signin" role="form" id="blog">
		<form:input type="text" path="blogTitle" id="title"
			class="form-control" placeholder="Title"
			 /> <p>
		<form:textarea rows="10" cols="60"  path="blogContent" id="blogContent"
			class="form-control" placeholder="Write Your Blog Here...."
			 /> <p>
		<button type="submit" ">upload</button>
	</form:form>

</body>
</html>