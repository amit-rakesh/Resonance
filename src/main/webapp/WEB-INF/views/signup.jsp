<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page session="false" %>

<html>

<head>


</head>

<body>

<form:form method="post" action = "/resonance/user/signup" modelAttribute = "user" enctype="application/json">
Name: <form:input path="name" type="text" name="name" id="name"/><br>
Email: <form:input path="email" type="text" name="email"/><br>
Password: <form:input path="password" type="text" name="pass"/><br>
State: <form:input path="state" type="text" name="state"/><br>
Country: <form:input path="country" type="text" name="country"/><br>

<button type="submit">create user</button>
</form:form>

</body>
</html>