ko.applyBindings(getUser(), $('.userDetails').get(0));

$(".fa-search").click(function (e) {
    e.preventDefault();
    document.location.href = "search.aspx?" + $(".search").val();
    
})