<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


	<a href="<c:url value = "/blog/create" /> ">Create Blog</a>


	<c:forEach items="${blog}" var="blog">
		<table>
			<tr>
				<th>Blog Title</th>
				<th>Uploaded By User</th>
				<th>Blog Content</th>
			</tr>
			<tr>
				<td><c:out value="${blog.blogTitle}" /></td>
				<td><c:out value="${blog.uploadedByUserId}" /></td>
				<td><c:out value="${blog.blogContent}"></c:out></td>
			</tr>
	</c:forEach>

	</table>
