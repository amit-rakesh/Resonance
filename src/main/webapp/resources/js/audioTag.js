$(document).ready(function(){
	
	var startTime;

		
    $("audio").on("play", function() {
    	
    	var d = new Date();
    	alert(d.getDate());
        $("audio").not(this).each(function(index, audio) {
            audio.pause();
        });
    });
    
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

