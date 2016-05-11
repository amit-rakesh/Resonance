<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Friends</title>
</head>
<body>

	<div class="conatiner">

		<div class="row">
			<div class="">
				<div class="col-sm-6">
					<div class="header">

						<h3 class="text-center text-muted">
							<strong>Followers</strong>
						</h3>
					</div>
					<div class="col-sm-6 center outbox bright center">
						<table class="table table-user-information">
							<tbody>
								<c:forEach items="${users}" var="user">

									<tr>
										<td><a
											href="<c:url value="/user/otherUser/${user.userid}" /> "><c:out
													value="${user.name}" /></a></td>

									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</div>

				<div class="col-sm-6">
					<div class="header">

						<h3 class="text-center text-muted">
							<strong>Following</strong>
						</h3>
					</div>
					<div class="col-sm-6 center outbox bright center">
						<table class="table table-user-information">
							<tbody>
								<c:forEach items="${usersIFollow}" var="user">

									<tr>
										<td><a
											href="<c:url value="/user/otherUser/${user.userid}" /> "><c:out
													value="${user.name}" /></a></td>

									</tr>
								</c:forEach>
							</tbody>

						</table>
					</div>

				</div>
			</div>
		</div>
	</div>







</body>
</html>