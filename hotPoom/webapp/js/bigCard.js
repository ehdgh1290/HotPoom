
let photoX = 0;
let $photoBox = $(".photo_box");
// 사진 갯수에 따른 photo_box의 left 한계값
let poomPhotoLeft = 0;

console.log(photoX);

// 이전사진 버튼
$("body").on("click", ".prev_photo", function () {
    console.log(".prev_photo");

    let $currPhotoBox = $(this).parent().prev().children();

    console.log($currPhotoBox);

    if (!$currPhotoBox.hasClass("move")) {
        $currPhotoBox.addClass("move");
        console.log("시작");


        photoX = $currPhotoBox.css("left");
        console.log("left: " + photoX);

        photoX = photoX.substring(0, photoX.length - 2);
        console.log("left: " + photoX);

        poomPhotoLeft = (this.dataset.length - 1) * 246;
        console.log("poom_photo_left: " + poomPhotoLeft);

        if (photoX == 0) {
            console.log("if");
            photoX = -1 * poomPhotoLeft;
            $currPhotoBox.css("left", photoX);
        } else if (photoX <= -246) {
            console.log("if else");
            photoX = parseInt(photoX);
            photoX += 246;
            $currPhotoBox.css("left", photoX);
            console.log(photoX);
        } else {
            console.log("else");
        }//if()~else if()~else end

    }//if() end
});//prev_photo click() end

// 다음사진 버튼
$("body").on("click", ".next_photo", function () {
    console.log(".next_photo");
    let $currPhotoBox = $(this).parent().prev().children();

    console.log($currPhotoBox);

    if (!$currPhotoBox.hasClass("move")) {
        $currPhotoBox.addClass("move");
        console.log("시작");


        photoX = $currPhotoBox.css("left");
        console.log("left: " + photoX);

        photoX = photoX.substring(0, photoX.length - 2);
        console.log("left: " + photoX);

        poomPhotoLeft = (this.dataset.length - 1) * 246;
        console.log("poom_photo_left: " + poomPhotoLeft);

        if (photoX == -1 * poomPhotoLeft) {
            console.log("if");
            photoX = 0;
            $currPhotoBox.css("left", photoX);
        } else if (photoX >= -1 * poomPhotoLeft - 246) {
            console.log("if else");
            photoX -= 246;
            $currPhotoBox.css("left", photoX);
            console.log(photoX);
        }//if()~else() ens

    }//if() end
});//next_photo click() end

// move클래스 때주기
$("body").on("transitionend", ".photo_box",function (e) {
    $(this).removeClass("move");
});


// 카드의 사진 갯수 가져옴
function setPhotoBoxWidth($this) {
    let photoCnt = $this.length;

    console.log(photoCnt);
    // photo_box의 left 한계값
    poomPhotoLeft = 246 * photoCnt - 246;
    // photo_box의 width 설정
    $(".photo_box").css("width", 246 * photoCnt);
    console.log(poomPhotoLeft);
    if (photoCnt <= 1) {
        $(".btn_photo_card").hide();
    }
}//card_cnt() end

//카드의 사진 갯수 가져옴 최초 1회 실행
//setPhotoBoxWidth();

let bookmark = false;

//북마크
$("body").on("click", ".poom_bookmark",function () {
    let $this = $(this);
    $.ajax({
        url: "json/bookmark.json",
        data: {userNo: 1, bookmark: bookmark},
        type: "GET",
        dataType: "json",
        error: function () {
            arlet("점검중");
        },
        success: function (json) {
            console.log(json.bookmark);
            if (!json.bookmark) {
                console.log("false222");
                $this.css("background-image", "url(img/bookmark_on.png)");

                bookmark = true;
            } else {
                console.log("true222");

                $this.css("background-image", "url(img/bookmark.png)");
                bookmark = false;
            }//if()~else() end
        }//success() end
    });//ajax() end

});//poom_bookmark click end