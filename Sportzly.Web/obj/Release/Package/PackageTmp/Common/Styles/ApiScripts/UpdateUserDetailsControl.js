$(document).ready(function () {   
    //var options = {
        //map: ".map_canvas",
        //details: ".details",
        //detailsAttribute: "data-geo"
    //};
    //$("#MainContentPlaceHolder_bulletinBoardControl_txtCity").geocomplete(options).bind("geocode:result", function (event, result) {
    //    //setTimeout(function () { $(".map_canvas").show(); }, 2000);

    //});


    $('#dk0-combobox').bind("DOMSubtreeModified", function () {
        var c = $(this).html();
        if (c == "India") {
            $("#MainContentPlaceHolder_UpdateUserDetailsControl_divcarrier").hide();
        }
        else {
            $("#MainContentPlaceHolder_UpdateUserDetailsControl_divcarrier").show();
        }
    });

});