<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html>
<head>

<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>

<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/sidebar.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/dashboard.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css" />">
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>


</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" style="">
		<tiles:insertAttribute name="header" />
	</nav>

	<div class="body">
		<tiles:insertAttribute name="body" />
	</div>
	
	<nav class="navbar navbar-inverse navbar-fixed-bottom" style="">
		<tiles:insertAttribute name="footer" />
	</nav>



</body>
</html>