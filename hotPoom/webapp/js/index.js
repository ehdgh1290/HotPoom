_.templateSettings = {interpolate : /\<\@\=(.+?)\@\>/gim, evaluate : /\<\@([\s\S]+?)\@\>/gim, escape : /\<\@\-(.+?)\@\>/gim};

const indexLocationAutoTmp = _.template($("#indexLocationAutoTmp").html());
const indexSpeciesAutoTmp = _.template($("#indexSpeciesAutoTmp").html());

let $locationAuto = $("#indexLocationAutoComplete");
let $locationInput = $("#indexHeroImageLocationInput");

let $speciesAuto = $("#indexSpeciesAutoComplete");
let $speciesInput = $("#indexHeroImageSpeciesInput");


/*****************위치 자동완성********************/

function autoCompleteLocation() {
    let indexLocation = $locationInput.val().trim();

    console.log(indexLocation);

    if (indexLocation.length == 0) {
        return false;
    }

    console.log("test");

    $.ajax({
        url:"json/location.json",
        dataType:"json",
        type:"get",
        error:function () {
            alert("서버 점검 중");
        },
        success:function (json) {
            console.log(json);

            $locationAuto.empty();

            $locationAuto.append(indexLocationAutoTmp({"locations":json}));
        }//success end
    });//ajax end
}//autoCompleteLocation() end

$("#indexHeroImageLocationBox").on("keyup",$locationInput,function () {
    autoCompleteLocation();
    $(".index_hero_image_location_auto").show();
});//#indexHeroImageLocationBox keyup end


$locationAuto.on("click", ".index_location_auto", function() {

    $locationInput.val(this.dataset.name);

    locationName = $locationInput.val();

    console.log(locationName);

    $(".index_hero_image_location_auto").empty().hide();

});//$locationAuto click end

/*****************위치 자동완성********************/


/*****************종 자동완성********************/
function autoCompleteSpecies() {
    let indexSpecies = $speciesInput.val().trim();

    console.log(indexSpecies);

    if (indexSpecies.length == 0) {
        return false;
    }

    console.log("test111");

    $.ajax({
        url:"json/species.json",
        dataType:"json",
        type:"get",
        error:function () {
            alert("서버 점검 중");
        },
        success:function (json) {
            console.log(json);

            $speciesAuto.empty();

            $speciesAuto.append(indexSpeciesAutoTmp({"speciesList":json}));
        }//success end
    });//ajax end
}//autoCompleteSpecies() end


$("#indexHeroImageSpeciesBox").on("keyup", $speciesInput, function () {
    autoCompleteSpecies();
    $(".index_hero_image_species_auto").show();
});//#indexHeroImageLocationBox keyup end


$speciesAuto.on("click", ".index_species_auto", function() {

    $speciesInput.val(this.dataset.name);

    speciesName = $speciesInput.val();

    console.log(speciesName);

    $(".index_hero_image_species_auto").empty().hide();

});//$locationAuto click end
/*****************종 자동완성********************/


/*****************달력********************/
let today = new Date();
const picker = tui.DatePicker.createRangePicker({
    startpicker: {
        date: today,
        input: '#startpicker-input',
        container: '#startpicker-container'
    },
    endpicker: {
        date: today,
        input: '#endpicker-input',
        container: '#endpicker-container'
    },
    selectableRanges: [
        [today, new Date(today.getFullYear() + 1, today.getMonth(), today.getDate())]
    ],
    language:'ko'
});
/*****************달력*******************/


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


//버튼 클릭시 검색
$("#indexHeroImageSearchBtn").on("click", function () {

});//indexHeroImageSearchBtn click() end