<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<div class="outbox bright">

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


	<div>
		<div class="container">
			<c:forEach items="${blog}" var="blog">
				<div class="row">

					<div class="col-md-12 col-sm-9">
						<h3>
							<c:out value="${blog.blogTitle}" />
						</h3>
						by
						<h4>
							<a
								href="<c:url value="/user/otherUser/${blog.uploadedByUserId}" /> ">
								<c:out value="${blog.uploadedByUserName}" />
							</a>
						</h4>
						<div class="row">
							<div class="col-xs-12 col-md-12 col-lg-12">
								<p>
									<strong><c:out value="${blog.blogContent}"></c:out></strong>
								</p>
							</div>
						</div>
						<br>
					</div>
				</div>
				<hr>
			</c:forEach>
		</div>
	</div>
</div>

