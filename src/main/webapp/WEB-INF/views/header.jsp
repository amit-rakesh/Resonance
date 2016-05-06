<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid">
	<div class="navbar-header">
		<a class="navbar-brand" href="<c:url value="/user/getDashboard" />">Resonance</a>
	</div>
	<ul class="nav navbar-nav navbar-left">

		<li><a href="<c:url value="/user/getDashboard" />">User
				Profile</a></li>
		<li><a href="<c:url value="/song/get10LatestSongs" />">Songs</a></li>
		<li><a href="<c:url value="/song/getUploadSong" />">Upload</a></li>
		<li><a href="<c:url value="/user/myFriends" /> ">Friends</a></li>
		<li><a href="<c:url value="/user/search" /> ">Search</a></li>

		<li><a href="<c:url value="/blog/create" /> ">Blog</a></li>

		<li><a href="<c:url value="/user/createEvent" /> ">Create Event</a></li>
		<li><a href="<c:url value="/user/getNearEvents" /> ">Events Near you</a></li>

		<li><a href="<c:url value="/user/getTrending" /> ">Trending</a></li>

	
	</ul>
	<ul class="nav navbar-nav navbar-right">
		<li><a href="<c:url value="/user/logout" />">Logout</a></li>
	</ul>
</div>


