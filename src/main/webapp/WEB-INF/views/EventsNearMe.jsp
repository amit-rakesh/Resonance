<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Events near you</title>



     
 <script src="http://maps.googleapis.com/maps/api/js?sensor=false" type="text/javascript"></script>
 <script type="text/javascript">
//var markers = [{"lat":"17.454000","lng":"78.434952"},{"title":"shilparamam","lat":"17.452665","lng":"78.435608","description":"Mumbai formerly Bombay, is the capital city of the Indian state of Maharashtra."},{"title":"image hospitals","lat":"17.452421","lng":"78.435715","description":"Pune is the seventh largest metropolis in India, the second largest in the state of Maharashtra after Mumbai."}];
var markers=[];
window.onload = function () {
	alert("hello");
	alert("${events}");
	
	<c:forEach items="${events}" var="event">

	markers.push({
		title:"${event.eventTitle}",
		lat:"${event.latitude}",
		lng:"${event.longitute}"
	});
		
</c:forEach>

alert(markers);
	
var mapOptions = {
center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
zoom: 10,
mapTypeId: google.maps.MapTypeId.ROADMAP
};
var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
var infoWindow = new google.maps.InfoWindow();
var lat_lng = new Array();
var latlngbounds = new google.maps.LatLngBounds();
for (i = 0; i < markers.length; i++) {
var data = markers[i]
var myLatlng = new google.maps.LatLng(data.lat, data.lng);
lat_lng.push(myLatlng);
var marker = new google.maps.Marker({
position: myLatlng,
map: map,
title: data.title
});
latlngbounds.extend(marker.position);
(function (marker, data) {
google.maps.event.addListener(marker, "click", function (e) {
infoWindow.setContent(data.title);
infoWindow.open(map, marker);
});
})(marker, data);
}
map.setCenter(latlngbounds.getCenter());
map.fitBounds(latlngbounds);

}

</script>
    
    
</head>
<body>
<h1>Events within 50 mile:</h1>
<br>
<c:forEach items="${events}" var="event">

	${event.eventTitle}	<br>
</c:forEach>
					
					<div id="dvMap" style="width: 500px; height: 500px;"></div>	
</body>
</html>