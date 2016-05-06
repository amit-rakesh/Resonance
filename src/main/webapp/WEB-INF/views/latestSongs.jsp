<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PlayLists</title>
<style type="text/css">
.star-rating {
	font-size: 0;
	white-space: nowrap;
	display: inline-block;
	width: 250px;
	height: 50px;
	overflow: hidden;
	position: relative;
	background:
		url('data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4IiB3aWR0aD0iMjBweCIgaGVpZ2h0PSIyMHB4IiB2aWV3Qm94PSIwIDAgMjAgMjAiIGVuYWJsZS1iYWNrZ3JvdW5kPSJuZXcgMCAwIDIwIDIwIiB4bWw6c3BhY2U9InByZXNlcnZlIj48cG9seWdvbiBmaWxsPSIjREREREREIiBwb2ludHM9IjEwLDAgMTMuMDksNi41ODMgMjAsNy42MzkgMTUsMTIuNzY0IDE2LjE4LDIwIDEwLDE2LjU4MyAzLjgyLDIwIDUsMTIuNzY0IDAsNy42MzkgNi45MSw2LjU4MyAiLz48L3N2Zz4=');
	background-size: contain;
}

.star-rating i {
	opacity: 0;
	position: absolute;
	left: 0;
	top: 0;
	height: 100%;
	width: 20%;
	z-index: 1;
	background:
		url('data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4IiB3aWR0aD0iMjBweCIgaGVpZ2h0PSIyMHB4IiB2aWV3Qm94PSIwIDAgMjAgMjAiIGVuYWJsZS1iYWNrZ3JvdW5kPSJuZXcgMCAwIDIwIDIwIiB4bWw6c3BhY2U9InByZXNlcnZlIj48cG9seWdvbiBmaWxsPSIjRkZERjg4IiBwb2ludHM9IjEwLDAgMTMuMDksNi41ODMgMjAsNy42MzkgMTUsMTIuNzY0IDE2LjE4LDIwIDEwLDE2LjU4MyAzLjgyLDIwIDUsMTIuNzY0IDAsNy42MzkgNi45MSw2LjU4MyAiLz48L3N2Zz4=');
	background-size: contain;
}

.star-rating input {
	-moz-appearance: none;
	-webkit-appearance: none;
	opacity: 0;
	display: inline-block;
	width: 20%;
	height: 100%;
	margin: 0;
	padding: 0;
	z-index: 2;
	position: relative;
}

.star-rating input:hover+i, .star-rating input:checked+i {
	opacity: 1;
}

.star-rating i ~ i {
	width: 40%;
}

.star-rating i ~ i ~ i {
	width: 60%;
}

.star-rating i ~ i ~ i ~ i {
	width: 80%;
}

.star-rating i ~ i ~ i ~ i ~ i {
	width: 100%;
}

.choice {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	text-align: center;
	padding: 20px;
	display: block;
}



</style>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
 <script src="<c:url value="/resources/js/mediaelement-and-player.min.js" />"></script>
    
    <link rel="stylesheet" href="<c:url value="/resources/css/styleplayer.css" />" media="screen">
<!-- script src="https://code.jquery.com/jquery-2.1.4.min.js"></script -->


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

<script>
    $(document).ready(function() {
        $('[id="audio-player"]').mediaelementplayer({
            alwaysShowControls: true,
            features: ['playpause','volume','progress'],
            audioVolume: 'horizontal',
            audioWidth: 400,
            audioHeight: 120
        });
    });
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
									<td>
									<div class="audio-player">
    								<h1>Demo - Preview Song</h1>
    									<img class="cover" src="<c:url value="/resources/images/cover.png" />" alt="">
    									<audio id="audio-player" controls="controls"><source src="<c:url value="${song.playingUrl}" />" type="audio/mpeg"></audio>
									</div></td>
											<td>
											<span class="star-rating"> 
											<input type = radio id = "${song.songId}1" value="1" name= "${song.songId}" onClick = "submitRating(${song.songId}, 1);"><i></i>
											<input type = radio id = "${song.songId}2" value="2" name= "${song.songId}" onClick = "submitRating(${song.songId}, 2);"><i></i>
											<input type = radio id = "${song.songId}3" value="3" name= "${song.songId}" onClick = "submitRating(${song.songId}, 3);"><i></i>
											<input type = radio id = "${song.songId}4" value="4" name= "${song.songId}" onClick = "submitRating(${song.songId}, 4);"><i></i>
											<input type = radio id = "${song.songId}5" value="5" name= "${song.songId}" onClick = "submitRating(${song.songId}, 5);"><i></i>
											</span>
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