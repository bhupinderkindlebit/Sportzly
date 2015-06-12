$(document).ready(function ($) {
    jQuery(document).ready(function () {
        jQuery('.fancybox').fancybox(
			{ 'closeBtn': false }
		);

        jQuery('.fancybox2').fancybox(

		);
    });


    jQuery(".boxClose").click(function () {
        jQuery(".insideinner").toggle();
    });




    jQuery(function () {
        jQuery(".datepicker").datepicker();
        jQuery('.timepicker').timepicker();
    });

    jQuery(document).ready(function () {
        jQuery('#horizontalTab').easyResponsiveTabs({
            type: 'default', //Types: default, vertical, accordion           
            width: 'auto', //auto or any width like 600px
            fit: true,   // 100% fit in a container
            closed: 'accordion', // Start closed if in accordion view
            activate: function (event) { // Callback function if tab is switched
                var $tab = jQuery(this);
                var $info = jQuery('#tabInfo');
                var $name = jQuery('span', $info);

                $name.text($tab.text());

                $info.show();
            }
        });
    });

    jQuery('.ui-widget-overlay').bind('click', function () {
        jQuery('#dialog').dialog('close');
    })

});


jQuery(document).ready(function () {
    jQuery('.fancyboxclose').click(function () {
        jQuery.fancybox.close();
    });
});

jQuery(function () {

    jQuery('.bxslider').bxSlider({
        auto: true,
        autoControls: true
    });

});


jQuery(function () {
    jQuery(".accordion").accordion();
});


jQuery(function () {

    jQuery("#normal_select, #disabled, #opt_group, #multiple").dropkick({
        mobile: true
    });
    jQuery(".search_select").dropkick({
        mobile: true,
        initialize: function () {
            var jQueryinput,
            dk = this;
            jQuery('.dk-selected', dk.data.elem).after([
            '<div class="dk-search">',
              '<input type="text" class="dk-search-input" placeholder="Search">',
            '</div>',
          ].join(""));

            jQueryinput = jQuery(".dk-search-input", dk.data.elem);

            jQueryinput.on("click", function (event) {
                event.stopPropagation();

            }).on("keypress keyup", function (event) {

                var found = dk.search(this.value, dk.data.settings.search);

                event.stopPropagation();

                jQuery('.dk-option', dk.data.elem).remove();

                if (found.length) {
                    jQuery(found).appendTo(dk.data.elem.lastChild);
                    dk.selectOne(found[0]);
                } else {
                    jQuery("<li></li>").addClass("dk-option dk-option-disabled").text("Not Found").appendTo(dk.data.elem.lastChild);
                }

                found.length && dk.selectOne(found[0]);
            });
        },

        open: function () {
            jQuery('.dk-search-input', this.data.elem).focus();
        },

        close: function () {
            jQuery('.dk-search-input', this.data.elem).val("").blur();
            jQuery('.dk-option', this.data.elem).remove();
            jQuery(this.options).appendTo(this.data.elem.lastChild);
        }
    });

    var gists = document.getElementsByClassName("gist-container"),
          btns = document.getElementsByClassName("btn"),
          i = 0;

    for (; i < gists.length; i++) {
        if (gists[i].offsetHeight > 160) {
            btns[i].style.display = "inline-block";

            btns[i].onclick = function () {
                var gistWrapper = this.parentNode.getElementsByClassName("gist-wrapper")[0];

                if (gistWrapper.style.maxHeight == "100%") {
                    gistWrapper.style.maxHeight = "";
                    gistWrapper.style.overflow = "";
                    this.innerHTML = "Show Full Code";
                    return false;
                } else {
                    gistWrapper.style.maxHeight = "100%";
                    gistWrapper.style.overflow = "visible";
                    this.innerHTML = "Hide Code";
                    return false;
                }
            }
        }
    }

});
