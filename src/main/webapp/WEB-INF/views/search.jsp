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

							var trhtml = '<thead><tr><th>Song Title</th><th>Play</th></tr></thead><tbody>';

							for ( var i in res) {

								trhtml += '<tr><td>'
										+ res[i].title
										+ '</td> <td> <audio controls> <source src="' + res[i].url +'" type="audio/mpeg"> </audio></td>'
										+ '</tr>';
							}
							trhtml += "</tbody>";
							$('#songDiv').show();
							$('#songs').html(trhtml).show().end();
						}
					});

		} else if (document.getElementById("2").checked) {

			document.getElementById('note').style.display = 'none';
			//document.getElementById('songDiv').style.display = 'none';
			/* document.getElementById('userDiv').style.display = 'block'; */
			$
					.ajax({
						type : "GET",
						url : "http://localhost:8080/resonance/user/getSearchResultUsers?data="
								+ data,
						success : function(res) {

							var trhtml = '<thead><tr><td>User</td></tr></thead><tbody>';

							for ( var i in res) {

								trhtml += '<tr><td> <a href= "/resonance/user/otherUser/' + res[i].id + ' " > '
										+ res[i].name + '</a>  </td> </tr>';
							}
							
							trhtml+="</tbody>";
							$('#songDiv').show();
							$('#songs').html(trhtml).end();
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

	<div class="container-fluid">
		<div class="header">
			<h3 class="text-center text-muted">
				<strong>Search</strong> Information
			</h3>
		</div>


		<div class="col-sm-9 center">
			<div class="form-inline">
				<div class="input-group col-sm-8">
					<div class="btn-group input-group-addon btn-modified-width"
						data-toggle="buttons" id="basic-aadon1">
						<label class="btn btn-primary btn-sm"> <input type="radio"
							name="select" id="1" autocomplete="off"><i
							class="glyphicon glyphicon-bullhorn"></i>
						</label> <label class="btn btn-primary btn-sm active checked" checked> <input
							type="radio" name="select" id="2" autocomplete="off"> <i
							class="glyphicon glyphicon-user"></i>
						</label>

					</div>
					<!-- <span class="input-group-addon" id="basic-addon1">Search</span>  -->
					<input type="text" class="form-control" id="searchData" />

				</div>
				<div class="col-sm-4 pull-right">
					<button type="button" class="btn btn-success btn-lg"
						onclick="myFunction();">Search</button>
				</div>
			</div>
			<label id="note"></label>



			<!-- 
<input type="radio" name="select" id="1" value="1" >Songs</input>
<input type="radio"  name="select" id="2" value="2" >People</input>
<br><br>

 
<button onclick="myFunction();">search</button>
-->
		</div>
		<br> <br> <br> <br>


		<div class=" col-sm-9 center outbox bright" id="songDiv" style="display:none;">
			<table class="table table-user-information" id="songs">

			</table>
		</div>



		<div class=" col-sm-9 center outbox bright" id="userDiv" style="display:none;">
			<table class="table table-user-information" id="users">

			</table>
		</div>


		
	</div>
</body>

</html>