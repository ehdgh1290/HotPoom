var $footer = $("#footer");

function fixFooter() {
    var wHeight = $(window).height();
    var bHeight = $("body").height()+60;

    console.log(wHeight);
    console.log(bHeight);

    if($footer.hasClass("fixed")) {
        bHeight += 100;
    }

    if(wHeight>=bHeight) {
        $footer.addClass("fixed");
    }else {
        $footer.removeClass("fixed");
    }
}

$(window).resize(fixFooter);

fixFooter();
