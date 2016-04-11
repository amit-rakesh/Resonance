<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<h1>Your Profile</h1>
<c:out value="${user.name}" /><br/>
<c:out value="${user.country}" />
<c:out value="${user.state}" />
<a href="<c:url value="/song/id" />">Song</a>
