
jQuery(document).ready(function($) {
	var windowWidth = $(window).width();
    $("ul li:first-child").addClass("first")
    $("ul li:last-child").addClass("last")
	
	// login toggle
	$(".close-event").click(function(){
		$("#login-drawer").slideToggle("very fast");
		$('html,body').animate({ scrollTop: $("#login-drawer").offset().top }, 800);
	});
	
	if(windowWidth < 768) {
		$("#login-drawer").css("height","auto");
	} else {
		$("#login-drawer").css("height","123px");
	}

});

$(window).resize(function() {
	var windowWidthResize = $(window).width();
	
	if(windowWidthResize < 768) {
		$("#login-drawer").css("height","auto");
	} else {
		$("#login-drawer").css("height","123px");
	}
})