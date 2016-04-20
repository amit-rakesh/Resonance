<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search</title>
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script rel="javascript" type="text/javascript" href="js/jquery-1.11.3.min.js"></script>
<script>

function myFunction(){
	
	var data = document.getElementById("searchData").value;
	var jsondata = {"data":data};

	var temp = JSON.stringify(jsondata);

	
	 $.ajax({ 
		   type: "GET",
		   url: "http://localhost:8080/resonance/user/getSearchResults?data="+data,
		   success: function(res){  
			   		       
		       var trhtml ='<tr><th>Song Title</th><th>Play</th></tr>';
		       
		       for(var i in res)
		       {
		      		
		      		trhtml+= '<tr><td>' + res[i].title + '</td> <td> <audio controls> <source src="' +res[i].url +'" type="audio/mpeg"> </audio></td>' + '</tr>';
		       }
		       
		       
		       
		       $('#songs').empty().append(trhtml);
		   	}
		});
	
	 
	
}
</script>
</head>
<body>


<h1>SearchResults</h1>

<input type="text" id="searchData"/>
<button onclick="myFunction();">search</button>

<br><br><br>

<div>
<table id="songs" width="59%" border="1">	

</table>

</div>


</body>
</html>