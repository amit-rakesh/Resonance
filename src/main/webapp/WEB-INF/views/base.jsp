<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html>
<head>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/sidebar.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/dashboard.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css" />">
<script src="<c:url value="resource/js/bootstrap.min.js"/>"></script>

<!-- <script src="<c:url value="/resources/js/audioTag.js" />"></script> -->
</head>
<body>
	<nav class="navbar navbar-inverse navbar-absolute-bottom" style="">
		<tiles:insertAttribute name="header" />
	</nav>

	<div class="body">
		<tiles:insertAttribute name="body" />
	</div>
	



</body>
</html>