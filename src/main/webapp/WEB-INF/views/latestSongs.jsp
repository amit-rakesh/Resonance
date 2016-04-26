<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PlayLists</title>
<script>
	function myFunctionLatest() {

		//document.getElementById('selection').style.display = 'none';
		document.getElementById('latestsongs').style.display = 'block';
		document.getElementById('uploadedByMe').style.display = 'none';
	}
	function myFunctionUpload() {
		//document.getElementById('selection').style.display = 'none';
		document.getElementById('latestsongs').style.display = 'none';
		document.getElementById('uploadedByMe').style.display = 'block';

	}
</script>
</head>
<body>

	<div class="container-fluid">
		<div class="col-md-4 col-sm-4 col-xs-4">
			<button type="button" class="btn btn-info" name="select" id="1"
				value="1" onclick="myFunctionLatest();">Latest Song</button>
		</div>
		<div class="col-md-4 col-sm-4 col-xs-4">
			<button type="button" class="btn btn-info" name="select" id="2"
				value="2" onclick="myFunctionUpload();">My Uploads</button>
		</div>
	</div>
	<div class="panel panel-info" id="latestsongs" style="display: none;">
		<div class="panel-heading">
			<h3 class="panel-title">Latest Songs</h3>
		</div>
		<div class="panel-body">
			<div class="row">
				<div class=" col-md-12 col-lg-12 ">
					<table class="table table-user-information">
						<tbody>
							<tr>
								<td>Song Title</td>
								<td>Uploaded By</td>
								<td>Play Song</td>
								<td>Like</td>
							</tr>
							<c:forEach items="${songs}" var="song">
								<tr>
									<td><c:out value="${song.songTitle}" /></td>
									<td><c:out value="${song.uploadedByUserId}" /></td>
									<td><audio controls> <source
											src="<c:url value ="${song.playingUrl}" /> "
											type="audio/mpeg"></audio></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>


	<div class="panel panel-info" id="uploadedByMe" style="display: none;">
		<div class="panel-heading">
			<h3 class="panel-title">My Uploads</h3>
		</div>
		<div class="panel-body">
			<div class="row">
				<div class=" col-md-12 col-lg-12 ">
					<table class="table table-user-information">
						<tbody>
							<tr>
								<td>Song Title</td>
								<td>Play Song</td>
								<td>Like</td>
							</tr>
							<c:forEach items="${mysongs}" var="song">
								<tr>
									<td><c:out value="${song.songTitle}" /></td>
									<td><audio controls> <source
											src="<c:url value ="${song.playingUrl}" /> "
											type="audio/mpeg"></audio></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>