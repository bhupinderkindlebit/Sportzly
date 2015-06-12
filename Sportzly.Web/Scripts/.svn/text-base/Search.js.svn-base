
    $(function () {
        var currentRequest = null;
        $("#txtSportzlySearch").keyup(function () {        
            var inputSearch = $(this).val();          
            var dataString = "{keyword:'" + inputSearch+"'}";
            if (inputSearch != '') {
                currentRequest = $.ajax({
                    type: "POST",
                    url: "search.asmx/Search",
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    data: dataString,
                    cache: false,
                    beforeSend: function () {
                        if (currentRequest != null) {                        
                            currentRequest.abort();
                        }
                    },
                    success: function (html) {
                        $("#divResult").html('');
                        $("#divResult").html(html.d).show();
                    }
                });
            } return false;
        });

        $(document).on("click", "div.display_box", function (e) {
            var $clicked = $(e.target);                  
            var link = $clicked.find('.name').attr("link");
         
            if (link != "" && link != undefined) { window.location.href = link; }
            
        });
        $(document).on("click", "body", function (e) {
            var $clicked = $(e.target);
            if (!$clicked.hasClass("search")) {
                jQuery("#divResult").fadeOut();
            }
        });
        $('#inputSearch').click(function () {
            jQuery("#divResult").fadeIn();
        });
    });

