$(document).ready(function(){

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
		
    $("audio").on("play", function() {
        $("audio").not(this).each(function(index, audio) {
            audio.pause();
        });
    });
});
