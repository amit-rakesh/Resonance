<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PlayLists</title>

<link rel="stylesheet" href="<c:url value='/resources/css/songs.css' />" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>





<script type="text/javascript">

function submitRating(t, i){
	
	$.ajax({ 
		   type: "POST",
		   url: "http://localhost:8080/resonance/song/rating/" + t + "/" + i,
		   success: function(res){  
			   		       
		      console.log(res);
		   	}
		});
}

function getRating(){
	
		var length = ${songs.size()}
	
	<c:forEach items="${songs}" var="song" varStatus="i">
		var songid = ${song.songId};
	$.ajax({
		type : "GET",
		url : "http://localhost:8080/resonance/song/rating/" 
				+ songid,
		success : function(res) {
					if(res === "0"){
						console.log(res);
					}
					else{
						console.log(res);
						document.getElementById(res).checked=true;
					}
					
		}
	
	});
	
	
	</c:forEach>

}
</script>
</head>
<body>


	<div class="container-fluid">

		<div class="header">
			<div class="text-center">
				<div class="btn-group" id="filters">
					<button type="button" class="btn btn-info btn-lg" name="select"
						id="1" value="1" onclick="getRating()">Latest Song</button>


					<button type="button" class="btn btn-success btn-lg" name="select"
						id="3" value="3">Recommendation</button>

					<button type="button" class="btn btn-warning btn-lg" name="select"
						id="2" value="2">My Uploads</button>
				</div>
			</div>
		</div>
		<div id="latestsongs" style="display: block;">
			<h3 class="text-center text-muted">
				<strong>Latest</strong> Songs
			</h3>
			<div class="col-sm-12">
				<c:forEach items="${songs}" var="song" varStatus="i">
					<div class="song-card col-md-4 col-lg-3">
						<div class="card-header text-center">
							<strong>${song.songTitle}</strong>
						</div>
						<div class="card-body">
							<section class="audio-control"> <audio controls
								class="col-sm-10 center" > <source
								src="<c:url value ="${song.playingUrl}" /> " type="audio/mpeg"></audio>
							</section>
							<label>Uploaded By: <a
								href="<c:url value="/user/otherUser/${song.uploadedByUserId}" /> "><c:out
										value="${song.uploadedByUserName}" /></a>
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

			<%-- <div class="col-sm-10 outbox bright center">
				<div class="row">
					<div class="col-sm-12">
						<table class="table table-striped table-user-information">
							<tbody>
								<tr>
									<td><strong>Song Title</strong></td>
									<td><strong>Uploaded By</strong></td>
									<td class="text-center"><strong>Play Song</strong></td>
									<td class="text-center"><strong>Rating</strong></td>

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
		</div>
 --%>
		</div>

		<div id="uploadedByMe" style="display: none;">
			<h3 class="text-center text-muted">
				<strong>My</strong> Uploads
			</h3>


			<div class="col-sm-12">
				<c:forEach items="${mysongs}" var="song">
					<div class="song-card col-md-4 col-lg-3">
						<div class="card-header text-center">
							<strong>${song.songTitle}</strong>
						</div>
						<div class="card-body">
							<section class="audio-control"> <audio controls
								class="col-sm-10 center"> <source
								src="<c:url value ="${song.playingUrl}" /> " type="audio/mpeg"></audio>
							</section>
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
		<%-- <div class="outbox bright center col-sm-10">
					<div class="row">
						<div class=" col-sm-12">
							<table class="table table-user-information">
								<tbody>
									<tr>
										<td>Song Title</td>
										<td>Play Song</td>
										<td>Rating</td>
									</tr>
									<c:forEach items="${mysongs}" var="song">
										<tr>
											<td><c:out value="${song.songTitle}" /></td>
											<td><audio controls> <source
													src="<c:url value ="${song.playingUrl}" /> "
													type="audio/mpeg"></audio></td>
											<td><span class="star-rating"> <input type=radio
													id="${song.songId}1" value="1" name="${song.songId}"
													onClick="submitRating(${song.songId}, 1);"><i></i>
													<input type=radio id="${song.songId}2" value="2"
													name="${song.songId}"
													onClick="submitRating(${song.songId}, 2);"><i></i>
													<input type=radio id="${song.songId}3" value="3"
													name="${song.songId}"
													onClick="submitRating(${song.songId}, 3);"><i></i>
													<input type=radio id="${song.songId}4" value="4"
													name="${song.songId}"
													onClick="submitRating(${song.songId}, 4);"><i></i>
													<input type=radio id="${song.songId}5" value="5"
													name="${song.songId}"
													onClick="submitRating(${song.songId}, 5);"><i></i>
											</span></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div> --%>




		<div id="recommendedsongs" style="display: none;">
			<h3 class="text-center text-muted">
				<strong>Recommended</strong> Songs
			</h3>


			<div class="col-sm-12">
				<c:forEach items="${recommendedsongs}" var="song">
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
								href="<c:url value="/user/otherUser/${song.uploadedByUserId}" /> "><c:out
										value="${song.uploadedByUserName}" /></a>
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
		<%-- <div class="panel-body">
				<div class="row">
					<div class=" col-md-12 col-lg-12 ">
						<table class="table table-user-information">
							<tbody>
								<tr>
									<td>Song Title</td>
									<td>Play Song</td>
									<td>Rating</td>
								</tr>
								<c:forEach items="${recommendedsongs}" var="song">
									<tr>
										<td><c:out value="${song.songTitle}" /></td>
										<td><audio controls> <source
												src="<c:url value ="${song.playingUrl}" /> "
												type="audio/mpeg"></audio></td>
										<td><span class="star-rating"> <input type=radio
												id="${song.songId}1" value="1" name="${song.songId}"
												onClick="submitRating(${song.songId}, 1);"> <i></i><input
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
		</div>

	</div> --%>
	</div>
</body>
<script src="<c:url value="/resources/js/script.js" />"></script>
<script src="<c:url value="/resources/js/audioTag.js" />"></script>
</html>