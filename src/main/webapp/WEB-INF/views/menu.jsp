<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script>
var user;
user = request.getSession().getAttribute(user);
</script>

<div id="sidebar-wrapper">
	<ul class="sidebar-nav">
		<li class="sidebar-brand"><a href="#"> What do you want </a></li>
		<li><a href="#">User Profile</a>
		</li>
		<li><a href="<c:url value="/song/get10LatestSongs" />">Albums</a>
		</li>
		<li><a href="<c:url value="/song/getUploadSong" />">Upload</a></li>
		
	</ul>

<<<<<<< HEAD


</div>
=======
<ul>
    <li><a href="<c:url value="" /> "> User Profile </a></li>
    <li><a href="<c:url value="/song/get10LatestSongs" /> ">Songs</a></li>
    <li><a href="<c:url value="/user/myFriends" /> ">Friends</a></li>
    <li><a href="<c:url value="/user/search" /> ">Search</a></li>
</ul>
>>>>>>> master
