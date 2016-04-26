<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PlayLists</title>
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script rel="javascript" type="text/javascript" href="js/jquery-1.11.3.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>


<script>



</script>
</head>
<body>

<div id ="selection">

<!-- <input type="radio" name="select" id="1" value="1"  onclick="myFunc();">Latest Songs</input>
<input type="radio"  name="select" id="2" value="2" onclick="myFunc();">Uploaded By Me</input>
 -->
 <input type="radio" name="select" id="1" value="1" >Latest Songs</input>
<input type="radio"  name="select" id="2" value="2" >Uploaded By Me</input>
</div>

<div id="latestsongs" style="display: none;">
<h1>Latest songs</h1>

<table width="59%" border="1">

<tr> 
  	<td> 
  Song Title
   </td>
   <td>
  Uploaded By
  </td>
  <td>
  Play Song
  </td>
  
  </tr>
  
  
<c:forEach items="${songs}" var="song">

  <tr> 
  	<td> 
  <c:out value= "${song.songTitle}" />
   </td>
   <td>
  <c:out value= "${song.uploadedByUserId}" />
  </td>
  <td>
  <audio controls>
  	<source src="<c:url value ="${song.playingUrl}" /> " type="audio/mpeg">
  </audio>
  </td>
  </tr>
</c:forEach>
</table>

</div>

<div id="uploadedByMe" style="display: none;">
	<h1>Uploaded By Me</h1>
	
	<table width="59%" border="1">

<tr> 
  	<td> 
  Song Title
   </td>
  
  <td>
  Play Song
  </td>
  <td>
  Like
  </td>
  </tr>
  
  
<c:forEach items="${mysongs}" var="song">

  <tr> 
  	<td> 
  <c:out value= "${song.songTitle}" />
   </td>
   
  <td>
  <div class="audio">
  <audio controls>
  	<source src="<c:url value ="${song.playingUrl}" /> " type="audio/mpeg">
  </audio>
  </div>
  </td>
  </tr>
</c:forEach>
</table>
</div>

</body>
<script src="<c:url value="/resources/js/script.js" />"></script>
</html>