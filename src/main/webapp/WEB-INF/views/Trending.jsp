<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Trending</title>

<link rel="stylesheet" href="<c:url value='/resources/css/songs.css' />" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>

<script type="text/javascript">
	function submitRating(t, i) {
		alert(t);
		alert(i);
		$.ajax({
			type : "POST",
			url : "http://localhost:8080/resonance/song/rating/" + t + "/" + i,
			success : function(res) {

				alert(res);
			}
		});
	}

	function getRating() {
		var length = $
		{
			songs.size()
		}

		<c:forEach items="${songs}" var="song" varStatus="i">
		var songid = $
		{
			song.songId
		}
		;
		$.ajax({
			type : "GET",
			url : "http://localhost:8080/resonance/song/rating/" + songid,
			success : function(res) {
				if (res === "0") {
					console.log(res);
				} else {
					console.log(res);
					document.getElementById(res).checked = true;
				}

			}

		});

		</c:forEach>

	}
</script>

</head>
<body onLoad="getRating()">
	<div class="container-fluid">

		<div class="header">
			<div class="text-center">
				<div class="btn-group" id="filters">
					<button type="button" class="btn btn-success btn-lg" name="select"
						id="4" value="5">Popular Songs</button>
					<button type="button" class="btn btn-warning btn-lg" name="select"
						id="5" value="5">Popular Users</button>
				</div>
			</div>
		</div>
		<!-- Latest song information for Trending -->
		<div id="trendingSongs" style="display: none;">
			<h3 class="text-center text-muted">
				<strong>Trending</strong> Songs
			</h3>
			<div class="col-sm-12">
				<c:forEach items="${songs}" var="song" varStatus="i">
					<div class="song-card col-md-4 col-lg-3">
						<div class="card-header text-center">
							<strong>${song.songTitle}</strong>
						</div>
						<div class="card-body">
							<section class="audio-control"> <audio controls
								class="col-sm-10 center"> <source
								src="<c:url value ="${song.playingUrl}" /> " type="audio/mpeg"></audio>
							</section>
							<label>Uploaded By: <a
								href="<c:url value="/user/otherUser/${song.uploadedByUserId}" /> ">${song.uploadedByUserName}</a>
							</label>
						</div>
						<div class="card-footer">
							rating: <span class="star-rating"> <input type=radio
								id="${song.songId}1" value="1" name="${song.songId}"
								onClick="submitRating(${song.songId}, 1);"><i></i> <input
								type=radio id="${song.songId}2" value="2" name="${song.songId}"
								onClick="submitRating(${song.songId}, 2);"><i></i> <input
								type=radio id="${song.songId}3" value="3" name="${song.songId}"
								onClick="submitRating(${song.songId}, 3);"><i></i> <input
								type=radio id="${song.songId}4" value="4" name="${song.songId}"
								onClick="submitRating(${song.songId}, 4);"><i></i> <input
								type=radio id="${song.songId}5" value="5" name="${song.songId}"
								onClick="submitRating(${song.songId}, 5);"><i></i>
							</span>
						</div>
					</div>
				</c:forEach>
			</div>
	</div>

			<!-- Other -->

			<%-- 	<div class="panel panel-info" id="latestsongs" style="display: none;">
			<div class="panel-heading">
				<h3 class="panel-title">Popular Songs</h3>
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
									<td>Rating</td>

								</tr>
								<c:forEach items="${songs}" var="song" varStatus="i">
									<tr>
										<td><c:out value="${song.songTitle}" /></td>
										<td><a
											href="<c:url value="/user/otherUser/${song.uploadedByUserId}" /> "><c:out
													value="${song.uploadedByUserName}" /></a></td>
										<td><audio controls> <source
												src="<c:url value ="${song.playingUrl}" /> "
												type="audio/mpeg"></audio></td>
										<td><span class="star-rating"> <input type=radio
												id="${song.songId}1" value="1" name="${song.songId}"
												onLoad="getRating(${song.songId}, 1);"
												onClick="submitRating(${song.songId}, 1);"><i></i> <input
												type=radio id="${song.songId}2" value="2"
												name="${song.songId}"
												onClick="submitRating(${song.songId}, 2);"><i></i> <input
												type=radio id="${song.songId}3" value="3"
												name="${song.songId}"
												onClick="submitRating(${song.songId}, 3);"><i></i> <input
												type=radio id="${song.songId}4" value="4"
												name="${song.songId}"
												onClick="submitRating(${song.songId}, 4);"><i></i> <input
												type=radio id="${song.songId}5" value="5"
												name="${song.songId}"
												onClick="submitRating(${song.songId}, 5);"><i></i>
										</span></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div> --%>

			<!-- User Information to Display trending users -->
			<div id="trendingUsers" style="display: none;">
				<div class="header">

					<h3 class="text-center text-muted">
						<strong>Trending</strong> Users
					</h3>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-sm-5 outbox bright center">
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
				</div>
			</div>

	
</body>

<script src="<c:url value="/resources/js/script.js" />"></script>
</html>