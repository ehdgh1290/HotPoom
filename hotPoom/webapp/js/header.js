$("#headerProfileImage").click(function (e) {

    $("#lnb").slideToggle(200);
    e.stopPropagation();
});

$("#headerLogin").click(function () {
    $("#gnbWrap").show();
    $(this).hide();
});

$("body").click(function () {
    // alert("zz");
    $("#lnb").hide();
});