
ko.applyBindings(getUser(), $('.wrapper-top-body').get(0));

$(".icon-search").click(function (e) {

    e.preventDefault();
    document.location.href = "search.aspx?" + $("#txtSportzlySearch").val();

})