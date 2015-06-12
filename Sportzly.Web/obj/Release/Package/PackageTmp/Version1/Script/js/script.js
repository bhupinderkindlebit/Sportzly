jQuery(document).ready(function(){

	// initialize jquery ui tabs
	jQuery('.tabs').tabs();
	
	// event handler for window resize
	jQuery(window).resize(function(e){
		updateUI();
	});
	updateUI();

});

// event handler for window resize
function updateUI(){

	if(jQuery(window).width() <= 480){

		// mobile view instructions
		tabsToAccordions();

	} else {

		// desktop view instructions
		accordionsToTabs();
	}

}

// changes tabs to accordions (jquery ui)
function tabsToAccordions(){
/*	jQuery('.tabs').each(function(){
		var a = jQuery('<div class="accordion">');
		var b = new Array();
		jQuery(this).find('>ul>li').each(function(){
			b.push('<h3>'+jQuery(this).html()+'</h3>');
		});
		var c = new Array();
		jQuery(this).find('>div').each(function(){
			c.push('<div>'+jQuery(this).html()+'</div>');
		});
		for(var i = 0; i < b.length; i++){
			a.append(b[i]).append(c[i]);
		}
		jQuery(this).before(a);
		jQuery(this).remove();
	})
	jQuery('.accordion').accordion()*/
jQuery(".tabs").each(function(){var e=jQuery('<div class="accordion">');var t=new Array;jQuery(this).find(">ul>li").each(function(){t.push("<h3>"+jQuery(this).html()+"</h3>")});var n=new Array;jQuery(this).find(">div").each(function(){n.push("<div>"+jQuery(this).html()+"</div>")});for(var r=0;r<t.length;r++){e.append(t[r]).append(n[r])}jQuery(this).before(e);jQuery(this).remove()});jQuery(".accordion").accordion()
}

// changes accordions to tabs (jquery ui)
function accordionsToTabs(){
/*	jQuery('.accordion').each(function(){
		var a = jQuery('<div class="tabs">');
		var count = 0;
		var b = jQuery('<ul>');
		jQuery(this).find('>h3').each(function(){
			count++;
			b.append('<li><a href="#tabs-'+count+'">'+jQuery(this).text()+'</a></li>');
		});
		var count = 0;
		var c = jQuery('');
		jQuery(this).find('>div').each(function(){
			count++;
			c=c.add('<div id="tabs-'+count+'">'+jQuery(this).html()+'</div>');
		});
		a.append(b).append(c);
		jQuery(this).before(a);
		jQuery(this).remove();
	});
	jQuery('.tabs').tabs();*/
jQuery(".accordion").each(function(){var e=jQuery('<div class="tabs">');var t=0;var n=jQuery("<ul>");jQuery(this).find(">h3").each(function(){t++;n.append('<li><a href="#tabs-'+t+'">'+jQuery(this).text()+"</a></li>")});var t=0;var r=jQuery("");jQuery(this).find(">div").each(function(){t++;r=r.add('<div id="tabs-'+t+'">'+jQuery(this).html()+"</div>")});e.append(n).append(r);jQuery(this).before(e);jQuery(this).remove()});jQuery(".tabs").tabs()
}