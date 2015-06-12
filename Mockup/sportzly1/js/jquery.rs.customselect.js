(function($){
	$.fn.customSelect = function(){
		this.each(function(){
			var slto = $(this);
			var sltn = $('<div class="select-box" style="position:relative; display:inline-block"></div>');
			var sltt = $('<div class="selected" style="overflow:hidden;"></div>');
			var opts = $('<div class="options" style="display:none;position:absolute;top:100%;left:0;right:0"></div>');
			sltn.append(sltt).append(opts).addClass(slto.attr('class'));			
			slto.attr('class', 'select-box-hidden').find('option').each(function(){
				opts.append('<span ' + ($(this).is(':selected') ? 'class="active"' : '') +'>'+$(this).text()+'</span>');		
			});
			slto.before(sltn).css({position:'absolute',left:'-9999px'});			
			var height = (sltn.height() || 20) - sltt.outerHeight() + sltt.height();
			sltt.css({height:height , lineHeight: height  + 'px'});
			opts.find('span').css('display', 'block').click(function(){				
				if($(this).text() != sltt.text()){
					opts.find('.active').removeClass('active');
					$(this).addClass('active');
					sltt.text($(this).text());
					slto.val(slto.find('option').eq($(this).index()).val());
					slto.trigger('change');
				}
				opts.slideUp(200);
			});	
			slto.focus(function(){
				opts.slideDown(200).focus();
			});		
			sltt.text(slto.find(':selected').text()).click(function(){
				opts.slideToggle(200);
				slto.trigger('click');
			});
			$(document).not(slto).click(function(event){
				if(!$(event.target).is('.select-box-hidden')){
					$('.select-box').not($(event.target).parents('.select-box')).find('.options').slideUp(200);
				}
			});
			$(document).keydown(function(event){
				if(opts.is(':visible')){
					var sp = opts.find('.active').removeClass('active');
					if(event.which==40){
						sp = sp.next().size() ? sp.next() : opts.find('span:first');	
					}
					if(event.which == 38){
						sp = sp.prev().size() ? sp.prev() : opts.find('span:last');
					}
					if(event.which== 13 && sp.text() != sltt.text()){
						slto.trigger('change');
					}
					sp.addClass('active');
					sltt.text(sp.text());
					slto.val(slto.find('option').eq(sp.index()).val());
					event.preventDefault();
				}
			});
		});
		return this;
	}
}(jQuery));