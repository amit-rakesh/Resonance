<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PlayLists</title>
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>



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
		<div class="col-md-4 col-sm-4 col-xs-4">
			<button type="button" class="btn btn-info" name="select" id="1"
				value="1" onclick="getRating()">Latest Song</button>
		</div>
		<div class="col-md-4 col-sm-4 col-xs-4">
			<button type="button" class="btn btn-info" name="select" id="2"
				value="2">My Uploads</button>
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
								<td>Rating</td>
								
							</tr>
							<c:forEach items="${songs}" var="song" varStatus="i">
								<tr>
									<td><c:out value="${song.songTitle}" /></td>
									<td><a href="<c:url value="/user/otherUser/${song.uploadedByUserId}" /> "><c:out
												value="${song.uploadedByUserName}" /></a>
									</td>
									<td><audio  controls onended="alert('ended')"> <source
											src="<c:url value ="${song.playingUrl}" /> "
											type="audio/mpeg"></audio></td>
											<td>
											<input type = radio id = "${song.songId}1" value="1" name= "${song.songId}" onClick = "submitRating(${song.songId}, 1);">
											<input type = radio id = "${song.songId}2" value="2" name= "${song.songId}" onClick = "submitRating(${song.songId}, 2);">
											<input type = radio id = "${song.songId}3" value="3" name= "${song.songId}" onClick = "submitRating(${song.songId}, 3);">
											<input type = radio id = "${song.songId}4" value="4" name= "${song.songId}" onClick = "submitRating(${song.songId}, 4);">
											<input type = radio id = "${song.songId}5" value="5" name= "${song.songId}" onClick = "submitRating(${song.songId}, 5);">
											</td>
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
<script src="<c:url value="/resources/js/script.js" />"></script>
<script src="<c:url value="/resources/js/audioTag.js" />"></script>
</html>