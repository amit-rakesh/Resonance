<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Info</title>
</head>
<body>
<h1>hello</h1>


<c:out value="${user.name}" />
	<br />
	
	<h1>
	Songs Uploaded by <c:out value="${user.name}" /> :
	</h1>
	
	
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
  
  
<c:forEach items="${songList}" var="song">

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
	
	
</body>
</html>