$(document).ready(function () {
    var offset = $('#side-menu').offset();
    var topPadding = 40;
    var win_width = window.innerWidth;
    // alert(win_width);
    if (win_width >= 768){
    	$(window).scroll(function() {
        if (($(window).scrollTop() > offset.top) && (window.innerWidth >= 768)) {
            $('#side-menu').stop().animate({marginTop: $(window).scrollTop() - offset.top + topPadding});
        }
        else {
            $('#side-menu').stop().animate({marginTop: 0});
        }
    	});	
    }else{
    	$('#side-menu').stop().animate({marginTop: 0});
    }
    
});