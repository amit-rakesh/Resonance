$(document).ready(function(){
	
	$("#1").click(function() {
	

        //document.getElementById('selection').style.display = 'none';
        document.getElementById('latestsongs').style.display = 'block';
        document.getElementById('uploadedByMe').style.display = 'none';
        document.getElementById('recommendedsongs').style.display ='none';
	});
	
	$("#2").click(function()  {
        //document.getElementById('selection').style.display = 'none';
        document.getElementById('latestsongs').style.display = 'none';
        document.getElementById('uploadedByMe').style.display = 'block';
        document.getElementById('recommendedsongs').style.display = 'none';

    });
	
	$("#3").click(function()  {
        //document.getElementById('selection').style.display = 'none';
        document.getElementById('latestsongs').style.display = 'none';
        document.getElementById('uploadedByMe').style.display = 'none';
        document.getElementById('recommendedsongs').style.display = 'block';

    });

	$('input[type="radio"]').click(function(){
		if(document.getElementById("1").checked){
				
				//document.getElementById('selection').style.display = 'none';
				document.getElementById('latestsongs').style.display = 'block';
				document.getElementById('uploadedByMe').style.display = 'none';
			}
			else if(document.getElementById("2").checked){
				//document.getElementById('selection').style.display = 'none';
				document.getElementById('latestsongs').style.display = 'none';
				document.getElementById('uploadedByMe').style.display = 'block';
			}
			
			
	});
		

});
