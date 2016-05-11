$(document).ready(function(){
	
	var startTime;
	var endTime;


	
		
    $("audio").on("play", function() {
    	var dur = this.duration;
    	alert(dur);
    	var d = new Date();
    	var h = d.getHours();
    	if (h < 10) {
	        h = "0" + h;
	    }
    	var m = d.getMinutes();
    	if (m < 10) {
	        m = "0" + m;
	    }
    	startTime = h+":"+m;
    	alert(startTime);
        $("audio").not(this).each(function(index, audio) {
            audio.pause();
        });
        
        
    });
    
  
/* $("audio").on("ended", function() {
    	
	 var d = new Date();
		 var h = d.getHours();
	 	if (h < 10) {
		        h = "0" + h;
		    }
	 	var m = d.getMinutes();
	 	if (m < 10) {
		        m = "0" + m;
		    }
	 	endTime = h+":"+m;
	 	
 	 alert(endTime);
 
 		$.ajax({
    		type : "GET",
    		url : "http://localhost:8080/resonance/heartbeat/"+songid+"/"+startTime+"/"+dur,
    		success : function(res) {

    			
    		}
    	});
 	
 	 
    });*/
    
    jQuery.createEventCapturing = (function () {
    	  var special = jQuery.event.special;
    	  return function (names) {
    	    if (!document.addEventListener) {
    	      return;
    	    }
    	    if (typeof names == 'string') {
    	      names = [names];
    	    }
    	    jQuery.each(names, function (i, name) {
    	      var handler = function (e) {
    	        e = jQuery.event.fix(e);

    	        return jQuery.event.dispatch.call(this, e);
    	      };
    	      special[name] = special[name] || {};
    	      if (special[name].setup || special[name].teardown) {
    	        return;
    	      }
    	      jQuery.extend(special[name], {
    	        setup: function () {
    	          this.addEventListener(name, handler, true);
    	        },
    	        teardown: function () {
    	          this.removeEventListener(name, handler, true);
    	        }
    	      });
    	    });
    	  };
    	})();
    
    $.createEventCapturing(['play']);
    $("body").on("play", "audio", function(){
    	$("audio").not(this).each(function(index, audio) {
            audio.pause();
        });
    });
});


