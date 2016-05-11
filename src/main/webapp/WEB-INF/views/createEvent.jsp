<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head runat="server">
<title>Example Form</title>
<link href="./css/site.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery.validate/1.7/jquery.validate.min.js"></script>
<script src="http://maps.google.com/maps/api/js?sensor=false"
	type="text/javascript"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Event</title>


</head>
<body>
	<div class="outbox bright">
		<div class="container">
			<div class="row">
				<form id="MyForm" name="MyForm" action="form.html">
					<div class=" col-md-6 col-lg-6 col-sm-6">
						<fieldset class="form-group">
							<label for="Title"> Title</label> <input class = "form-control" id="Name" name="Name"
								type="text" />
						</fieldset>
						<fieldset class="form-group">
							<label for="FullAddress"> Address</label>
							<textarea id="FullAddress" name="FullAddress" rows="5"
								class="form-control"></textarea>
						</fieldset>
						<fieldset class="form-group">
							<input id="Submit" name="Submit" value="Validate address"
								type="button" />
						</fieldset>
						<fieldset class="form-group">
							<button type="submit" class="btn btn-inverse"
								onclick="doMystuff();">Submit</button>
						</fieldset>
					</div>
				</form>
				<div class=" col-md-6 col-lg-6 col-sm-6">
					<div id="map_canvas" style="height: 100%; width: 100%;"></div>
				</div>
			</div>
		</div>
	</div>


	<label id="note"></label>



	<script type="text/javascript">
		// The following code show execute only after the page is fully loaded
		var isValid;
		$(document).ready(function() {
			if ($('#MyForm').exists()) {
				// Enable jQuery Validation for the form
				$("#MyForm").validate({
					onkeyup : false
				});
				// Add validation rules to the FullAddress field
				$("#FullAddress").rules("add", {
					fulladdress : true,
					required : true,
					messages : {
						fulladdress : "Google cannot locate this address."
					}
				});
				// This function will be executed when the form is submitted
				function FormSubmit() {
					$.submitForm = true;
					if (!$('#MyForm').valid()) {
						return false;
					} else {
						if ($("#FullAddress").data("IsChecking") == true) {
							$("#FullAddress").data("SubmitForm", true);
							return false;
						}
						//alert('Form Valid!  Submit!');
						//return true;   // Uncomment to submit the form.
						isValid = true;
						//alert(isValid);
						return false; // Supress the form submission for test purpose.

					}
				}
				// Attach the FormSubmit function to the Submit button
				if ($('#Submit').exists()) {
					$("#Submit").click(FormSubmit);
				}
				// Execute the ForumSubmit function when the form is submitted
				$('#MyForm').submit(FormSubmit);
			}
		});
		// Create a jQuery exists method
		jQuery.fn.exists = function() {
			return jQuery(this).length > 0;
		}
		// Position the Google Map
		function Map(elementId, geolocation) {
			var myOptions = {
				zoom : 13,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			}
			var map = new google.maps.Map(document.getElementById(elementId),
					myOptions);
			map.setCenter(geolocation);
		}
		// FullAddress jQuery Validator
		function FullAddressValidator(value, element, paras) {
			// Convert the value variable into something a bit more descriptive
			var CurrentAddress = value;
			// If the address is blank, then this is for the required validator to deal with.
			if (value.length == 0) {
				return true;
			}
			// If we've already validated this address, then just return the previous result
			if ($(element).data("LastAddressValidated") == CurrentAddress) {
				return $(element).data("IsValid");
			}
			// We have a new address to validate, set the IsChecking flag to true and set the LastAddressValidated to the CurrentAddress
			$(element).data("IsChecking", true);
			$(element).data("LastAddressValidated", CurrentAddress);
			// Google Maps doesn't like line-breaks, remove them 
			CurrentAddress = CurrentAddress.replace(/\n/g, "");
			// Create a new Google geocoder
			var geocoder = new google.maps.Geocoder();
			geocoder.geocode({
				'address' : CurrentAddress
			}, function(results, status) {
				// The code below only gets run after a successful Google service call has completed.  
				// Because this is an asynchronous call, the validator has already returned a 'true' result
				// to supress an error message and then cancelled the form submission.  The code below 
				// needs to fetch the true validation from the Google service and then re-execute the 
				// jQuery form validator to display the error message.  Futhermore, if the form was 
				// being submitted, the code below needs to resume that submit.
				// Google reported a valid geocoded address
				if (status == google.maps.GeocoderStatus.OK) {
					// Get the formatted Google result
					var address = results[0].formatted_address;
					// Count the commas in the fomatted address.   
					// This doesn't look great, but it helps us understand how specific the geocoded address
					// is.  For example, "CA" will geocde to "California, USA".  
					numCommas = address.match(/,/g).length;
					// A full street address will have at least 3 commas.  Alternate techniques involve 
					// fetching the address_components returned by Google Maps.  That code looks even more ugly.
					if (numCommas >= 3) {
						// Replace the first comma found with a line-break
						address = address.replace(/, /, "\n");
						// Remove USA from the address (remove this, if this is important to you)
						address = address.replace(/, USA$/, "");
						// Check for the map_canvas, if it exists then position the Google Map
						if ($("#map_canvas").exists()) {
							$("#map_canvas").show();
							Map("map_canvas", results[0].geometry.location);
						}
						// Set the textarea value to the geocoded address
						$(element).val(address);
						// Cache this latest result
						$(element).data("LastAddressValidated", address);
						// We have a valid geocoded address
						$(element).data("IsValid", true);
					} else {
						// Google Maps was able to geocode the address, but it wasn't specific
						// enough (not enough commas) to be a valid street address.
						$(element).data("IsValid", false);
					}
					// Otherwise the address is invalid
				} else {
					$(element).data("IsValid", false);
				}
				// We're no longer in the midst of validating
				$(element).data("IsChecking", false);
				// Get the parent form element for this address field
				var form = $(element).parents('form:first');
				// This code is being run after the validation for this field,
				// if the form was being submitted before this validtor was 
				// called then we need to re-submit the form.
				if ($(element).data("SubmitForm") == true) {
					form.submit();
				} else {
					// Re-validate this property so we can return the result.
					form.validate().element(element);
				}
			});
			// The FullAddress validator always returns 'true' when initially called.
			// The true result will be return later by the geocode function (above)
			return true;
		}
		// Define a new jQuery Validator method
		$.validator.addMethod("fulladdress", FullAddressValidator);

		function doMystuff() {

			if (isValid) {
				var address = document.getElementById("FullAddress").value;
				var title = document.getElementById("Name").value;
				//alert(address);

				var geocoder = new google.maps.Geocoder();

				geocoder
						.geocode(
								{
									'address' : address
								},
								function(results, status) {

									if (status == google.maps.GeocoderStatus.OK) {
										var latitude = results[0].geometry.location
												.lat();
										var longitude = results[0].geometry.location
												.lng();
										//alert(latitude);
										//alert(longitude);

										var jsonObj = {
											"title" : title,
											"address" : address,
											"longitude" : longitude,
											"latitude" : latitude
										};
										//alert(jsonObj);
										//alert(JSON.stringify(jsonObj));

										$
												.ajax({
													type : "POST",
													url : "http://localhost:8080/resonance/user/createEvent?data="
															+ JSON
																	.stringify(jsonObj),
													success : function(res) {

														//alert("success");

														window.open(res,
																"_self");
														document
																.getElementById("note").innerHTML = "Event created";
													}
												});
									}
								});
			} else {
				alert("Please enter valid address");
			}
		}
	</script>


</body>
</html>