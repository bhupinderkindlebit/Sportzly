$(document).ready(function () {
    $("#txtNotice").keyup(function () {
        var count = $(this).val().length;
        if (count > 140) {
            $("#spCount").css("color", "red");
        }
        else {
            $("#spCount").css("color", "#13680C");
        }
        $("#spCount").text($(this).val().length);
    });


    $('#inline1').validate({
        submitHandler: function (form) { // for demo                     
            return false; // form demo
        },
        onsubmit: false,
        rules: {
            txtNotice: {
                required: true
            }  
        },
        messages: {
            txtNotice: {
                required: "Please enter some text"
            }
        },
        ignore: []        
    });

    $("#btnSendText").click(function (event) {
        var valid = $("#inline1").valid();
        if (valid) {
            postNoticeComment();
        }
        else {
            event.preventDefault();
        }
    });

});

postNoticeComment = function () {
    var text = $("#txtNotice").val();
    scsHdlr = function (result) {
        var results = getJson(result);
        if (valid(results)) {          
        }
    }

    UpdateNotice(scsHdlr, errHdlr, getUser().UserKey, text, teamId, msgId);
    return false;
}