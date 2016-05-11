<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<div class="panel panel-info">
	<div class="panel-heading">

		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6">
					<h4>
						<b>Blogs</b>
					</h4>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6">
					<a href="<c:url value = "/blog/create" />" type="button"
						class="btn btn-success" style="float: right">Create Blogs</a>
				</div>
			</div>
		</div>

	</div>
	<div class="panel-body">
		<div class="row">

			<div class=" col-md-12 col-lg-12 col-sm-12 ">
				<table class="table table-user-information">
					<tbody>
						<tr>
							<th>Blog Title</th>
							<th>Uploaded By User</th>
							<th>Blog Content</th>
							<th>Written on</th>
						</tr>
						<c:forEach items="${blog}" var="blog">


							<tr>
								<td><c:out value="${blog.blogTitle}" /></td>
								<td><c:out value="${blog.uploadedByUserId}" /></td>
								<td><c:out value="${blog.blogContent}"></c:out></td>
								<td><c:out value="${blog.date}"></c:out></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>


			</div>
		</div>
	</div>


</div>





