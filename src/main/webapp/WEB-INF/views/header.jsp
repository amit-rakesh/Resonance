<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<ul class="nav navbar-nav navbar-left">
	<li>
		<!-- <a href="#">Home</a> -->
	</li>
	<li>
		<!-- <a href="#about">About</a> -->
	</li>
	<li>
		<!-- <a href="#contact">Contact</a> -->
	</li>
	<li></li>
	<li style="text-align: center; padding-left: 40%; color: black"><h3>RESONANCE</h3></li>
</ul>

<ul class="nav navbar-nav navbar-right">
	<!--  <li><a href="../navbar/">Default</a></li>
            <li><a href="../navbar-static-top/">Static top</a></li>
             -->
	<li><a href="<c:url value="/user/logout" />" >Logout</a></li>
</ul>

