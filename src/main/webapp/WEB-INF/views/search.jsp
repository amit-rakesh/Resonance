<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search</title>

<!-- <script rel="javascript" type="text/javascript" href="js/jquery-1.11.3.min.js"></script> -->

<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="<c:url value="/resources/js/audioTag.js" />"></script>
<script>
	function myFunction() {

		var data = document.getElementById("searchData").value;
		var jsondata = {
			"data" : data
		};

		var temp = JSON.stringify(jsondata);

		if (document.getElementById("1").checked) {
			document.getElementById('songDiv').style.display = 'block';
			document.getElementById('note').style.display = 'none';
			document.getElementById('userDiv').style.display = 'none';

			$
					.ajax({
						type : "GET",
						url : "http://localhost:8080/resonance/user/getSearchResults?data="
								+ data,
						success : function(res) {

							var trhtml = '<tr><th>Song Title</th><th>Play</th></tr>';

							for ( var i in res) {

								trhtml += '<tr><td>'
										+ res[i].title
										+ '</td> <td> <audio controls> <source src="' + res[i].url +'" type="audio/mpeg"> </audio></td>'
										+ '</tr>';
							}

							$('#songs').empty().append(trhtml);
						}
					});

		} else if (document.getElementById("2").checked) {

			document.getElementById('note').style.display = 'none';
			//document.getElementById('songDiv').style.display = 'none';
			document.getElementById('userDiv').style.display = 'block';
			$
					.ajax({
						type : "GET",
						url : "http://localhost:8080/resonance/user/getSearchResultUsers?data="
								+ data,
						success : function(res) {

							var trhtml = '<tr><th>User</th></tr>';

							for ( var i in res) {

								trhtml += '<tr><td> <a href= "/resonance/user/otherUser/' + res[i].id + ' " > '
										+ res[i].name + '</a>  </td> </tr>';
							}

							$('#songs').empty().append(trhtml);
						}
					});

		} else {
			document.getElementById('note').style.display = 'block';
			document.getElementById("note").innerHTML = "Please select what you want to search";
			document.getElementById('songDiv').style.display = 'none';
			document.getElementById('userDiv').style.display = 'none';
		}

	}
</script>
</head>
<body>

	<div class="container">
		<h1>Search</h1>
		<div class="conatiner">
			<div class="input-group" style="padding: auto">
				<span class="input-group-addon" id="basic-addon1">Search</span> <input
					type="text" class="form-control" id="searchData">
			</div>
			<!-- 
<input type="text" id="searchData"/>
 -->
			<label id="note"></label>

			<div class="btn-group" data-toggle="buttons"
				style="padding-top: 10px">
				<label class="btn btn-primary"> <input type="radio"
					name="select" id="1" autocomplete="off"> Songs
				</label> <label class="btn btn-primary"> <input type="radio"
					name="select" id="2" autocomplete="off"> People
				</label>

			</div>

			<!-- 
<input type="radio" name="select" id="1" value="1" >Songs</input>
<input type="radio"  name="select" id="2" value="2" >People</input>
<br><br>

 
<button onclick="myFunction();">search</button>
-->
		</div>
		<br>

		<button type="button" class="btn btn-success" onclick="myFunction();">Search</button>

		<br> <br> <br>


		<div class=" col-md-9 col-lg-9 " id="songDiv">
			<table class="table table-user-information" id="songs">

			</table>
		</div>



		<div class=" col-md-9 col-lg-9 " id="userDiv">
			<table class="table table-user-information" id="users">

			</table>
		</div>


		<!-- 

		<div id="songDiv">
			<table id="songs" width="59%" border="1">

			</table>

		</div>

		<div id="userDiv">
			<table id="users" width="59%" border="1">

			</table>

		</div>
	 -->
	</div>
</body>

</html>