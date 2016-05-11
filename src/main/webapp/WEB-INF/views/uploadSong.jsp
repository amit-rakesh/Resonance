
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Popup contact form</title>


</head>
<!-- Body Starts Here -->
<body>
	<div class="container-fluid">
		<div class="header">
			<h3 class="text-center text-muted">
				<strong>Upload</strong> Song
			</h3>
		</div>
		<!-- <div class="uploadSongForm"> -->
		<form:form class="form-horizontal outbox bright center col-sm-6"
			action="/resonance/song/upload" id="form" method="post" name="form"
			modelAttribute="song" enctype="multipart/form-data">
			<fieldset class="form-group">
				<!-- <label for="formGroupExampleInput" class="control label col-sm-3">Song
					Title</label> -->
				<div class="col-sm-7 col-sm-offset-3">
					<form:input path="songTitle" type="text" class="form-control"
						id="formGroupExampleInput"
						placeholder="What would you name your song?" />
				</div>
			</fieldset>
			<fieldset class="form-group">
				<!-- <label for="formGroupExampleInput2">File </label> -->
				<div class="col-sm-7 col-sm-offset-3">
					<input class="filestyle"  type="file" name="file"
						data-buttonText="Upload Song" data-buttonName="btn-warning"
						data-iconName="glyphicon glyphicon-headphones" />
				</div>
			</fieldset>
			<div id="actions" class="text-center">
				<button type="submit" class="btn btn-success">Submit</button>
			</div>
			<footer>
			<p>
				<strong>Important:</strong> By sharing, you confirm that your sounds
				comply with out Terms of use and you don't infringe anyone else's
				rights.
			</p>
			<p>What types of files can I upload? You can upload AIFF, WAVE
				(WAV), FLAC, ALAC, OGG, MP2, MP3, AAC, AMR, and WMA files. The
				maximum file size is 5GB.</p>
			</footer>
		</form:form>
		<!-- 	</div> -->
	</div>



</body>
<!-- Body Ends Here -->
</html>

