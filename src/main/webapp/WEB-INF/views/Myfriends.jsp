<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1" %> 

   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Friends</title>
</head>
<body>

<div>
<h1>People Following You</h1>
  
  	<table width="59%" border="1">

<tr> 
  	<td> 
  Person Name
   </td>
  
 </tr>
  
  
<c:forEach items="${users}" var="user">

  <tr> 
  	<td> 
  	<a href="<c:url value="/user/otherUser/${user.userid}" /> "><c:out value= "${user.name}" /></a>
  	
 
   </td>
  
  </tr>
</c:forEach>
</table>

</div>


<div>
<h1>People You Follow</h1>
  
  	<table width="59%" border="1">

<tr> 
  	<td> 
  Person Name
   </td>
  
 </tr>
  
  
<c:forEach items="${usersIFollow}" var="user">

  <tr> 
  	<td> 
  <a href="<c:url value="/user/otherUser/${user.userid}" /> "><c:out value= "${user.name}" /></a>
   </td>
  
  </tr>
</c:forEach>
</table>

</div>
</body>
</html>