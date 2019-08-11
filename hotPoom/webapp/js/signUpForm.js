let $userName = $("#nameRegisterInput");
let $email = $("#emailRegisterInput");
let $password = $("#passwordRegisterInput");
let $passwordCheck = $("#passwordCheckInput");
let $phoneNumCheck = $("#phoneNumConfirm");

//1) 변수 선언
let $year =$("#year");
let $month = $("#month");
let $date = $("#date");

//2) 년도와 월에 따라 날짜 받도록 년,월 change
$("#year").change(makeDate);
$("#month").change(makeDate);

//3) month메서드 함수
function makeMonth() {

    //4) 날짜 만들기
    for (var i = 1; i < 13; i++ ) {
        //$("<option>").appendTo($month).text(i+"월").attr("value"+i);
        $("<option>").appendTo($month).text(i);
    }//for end

}//makeMonth() end
// ------------------> month

function makeYear() {

    let now = moment(); //-> moment를 가져온 now가 객체
    let year = now.year(); //-> year메서드를 사용해 int형으로 가져옴

    for (var i = year; i > 1899; i--) {
        $("<option>").appendTo($year).text(i);
    }//for end

}//makeYear() end
// ---------------------> year


function makeDate() {

    var selectDate = $date.val();

    //0) 이전의 option요소를 비움
    $date.empty();

    let lastDate = getLastDate();

    for (let i = 1; i < lastDate; i++ ) {

        let $option = $("<option>").appendTo($date).text(i);

        if (i == selectDate) {
            $option.attr("selected",true);
        }//if end

    }//for end

}//makeDate() end


function getLastDate() {

    //1) 년도 얻기
    let year = $year.val();

    //2) 월 얻기
    let month = $month.val();

    //3) 해당년도와 월을 가지고 moment객체를 생성
    let that = moment([year,month-1]);

    //4) 마지막 날자로 변경(moment객체)하고, 마지막 날짜를 얻음(숫자형)
    let lastDate = that.endOf("month").date();

    return lastDate+1;
}//getLastDate() end

//-----------------------> date

makeYear();
makeMonth();
makeDate();


let nameExp = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,20}$/;
let emailExp = /^[0-9a-zA-Z]{5,30}@[a-z]{1,10}\.[a-z]{2,3}$/i;
let passwordExp = /^.*(?=.{6,12})(?=.*[\0-9])(?=.*[a-zA-Z]).*$/;

let nameFlag = false;
let emailFlag = false;

let $nameCheck = $("#nameCheckBtn")
let $emailCheck = $("#emailCheckBtn");//중복 확인 버튼

let $nameMsg = $(".name_insert");
let $emailMsg = $(".msg.email_check_fail");//span
let $emailFormMsg = $(".msg.wrong_email_form");
let $passwordMsg = $(".msg.password_confirm");
let $passwordCheckMsg = $(".msg.password_check");
let $phoneNumMsg = $(".msg.phone_num_insert");
let $authenticationMsg = $(".msg.phone_num_confirm");

//이름 정규표현식
$nameCheck.click(function () {

    let name = $userName.val();

    if(name!=''){
        if(nameExp.test(name)){
            nameFlag = true;
            $nameMsg.text("사용 가능한 이름입니다.").css("color","#3397EB");
        }else{
            $nameMsg.text("사용 가능한 이름의 크기가 아닙니다.").css("color","#C50532");
            $userName.val('');
            $userName.focus();
            return false;
        }//if~else end
    }//if end

    if(nameFlag){
        console.log("36");
        //멤버json가져오기
        $.ajax({
            url:"json/userName.json",
            dataType:"json",
            type:"GET",
            success : function(json) {
                console.log("37");
                let nameValue="";
                //입력한 아이디가 멤버에 존재할 경우
                _.each(json,function (info) {
                    console.log("8");
                    if($userName.val() == info.name){
                        console.log("9");
                        nameValue=$userName.val();
                    }
                });//each end
                console.log("40");
                if(nameValue!=""){
                    console.log("41");
                    $nameMsg.text("이미 등록된 이름입니다.").css("color","#C50532");
                    console.log("42");
                    $userName.val('');
                    $userName.focus();
                    return false;
                }//if end
            },
            error : function() {
                alert("서버점검중");
            }
        });
    }
});//이름 유효성 end


$(function(){
    //id입력창에 글이 써지면 수행하는 함수
    $email.blur(function(){
        console.log("4");
        let email = $email.val();
        //id값이 공백이 아닐때
        if(email != ''){
            //정규표현식 검사
            if(emailExp.test(email)){
                emailFlag=true;
                console.log("5");
                //올바를 경우 id메세지 사라짐
                $emailFormMsg.text('');
            }
            else{
                //id가 정규표현식에 맞지 않을때
                //메세지 띄워주고 입력창에 글씨 사라지면서 포커스 맞춤
                console.log("1");
                $emailFormMsg.css("display","block");
                console.log("2");
                $email.val('');
                $email.focus();
                console.log("3");
                return false;
            }
        }
        return false;
    });
});//$email.blur end

//아이디 중복검사 버튼 눌렀을때 실행되는 이벤트
$emailCheck.click(function () {
    //정규표현식에 맞을 경우에만 실행
    if(emailFlag){
        console.log("6");
        //멤버json가져오기
        $.ajax({
            url:"json/checkingUser.json",
            dataType:"json",
            type:"GET",
            success : function(json) {
                console.log("7");
                let emailValue="";
                //입력한 아이디가 멤버에 존재할 경우
                _.each(json,function (info) {
                    console.log("8");
                    if($email.val()==info.email){
                        console.log("9");
                        emailValue=$email.val();
                    }
                });//each end
                console.log("10");
                if(emailValue!=""){
                    console.log("11");
                    $emailMsg.css("display","block");
                    console.log("12");
                    $email.val('');
                    $email.focus();
                    return false;
                }//if end
            },
            error : function() {
                alert("서버점검중");
            }
        });
    }
});


//password
$(function(){
    $password.blur(function(){
        console.log("14");
        let password = $password.val();
        if(password != ''){
            console.log("15");
            if(passwordExp.test(password)){
                //alert("올바름"+password);
                $passwordMsg.css("display","none");
            }
            else{
                //alert("올바르지 않음"+password);
                $passwordMsg.css("display","block");
                $password.val('');
                $password.focus();
                return false;
            }
        }
    });
});

//비밀번호 확인
$(function(){
    console.log("16");
    $passwordCheck.blur(function(){
        console.log("17");
        if($password.val() != $passwordCheck.val()){
            if($passwordCheck.val()!=''){
                console.log("18");
                $passwordCheckMsg.css("display","block");
                $passwordCheck.val('');
                $passwordCheck.focus();
                return false;
            }
        }
        else{
            console.log("19");
            if($passwordCheck.val()!='') {
                $passwordCheckMsg.css("display","none");
                //alert("성공");
            }else{
                console.log("20");
                $passwordMsg.css("display","block");
                $password.val('');
                $password.focus();
                return  false;
            }
        }
    });
});

let regularPhoneNum = /^[0-9]*$/;
let phoneNum = null;

function testPhoneNum() {
    console.log("26");

    phoneNum = $("#phoneNumInput").val();

    if (!regularPhoneNum.test(phoneNum)) {
        console.log("21");
        $("#phoneNumInput").val('');
        $("#phoneNumInput").focus();
        $phoneNumMsg.css("display", "block");
        return false;

    } else {
        console.log("22");
        if (phoneNum.length > 11 || phoneNum.length < 10) {
            console.log("23");
            $phoneNumMsg.css("display", "block");
            return false;
        } else {
            console.log("24");
            $phoneNumMsg.css("display", "none");
        }//안쪽 if~else end
    }//바깥 if~else end

};//testPhoneNum() end

//인증번호를 누르면 alart 창으로 발송하였다는 확인 메세지.
$("#numBtn").click(function () {
    alert(phoneNum+"로 인증번호를 발송했습니다. 확인하여 3분 안에 기입해주세요.");
    return false;
}); //click end


//인증번호 일치 유효성 검사.
function testPhoneNumConfirm() {

    //그 값(value)를 얻어옴
    let phoneNumCheck = $phoneNumCheck.val();

    //임의의 인증번호 값 부여
    if( phoneNumCheck != "5412" ) {
        $authenticationMsg.css("display","block");
        return false;
    }else {
        $authenticationMsg.css("display","none");
    }//if end
}//testNumCfm() end


$("#registerForm").on("submit",function () {

    // if (!testName()) return false;

    if(!testPhoneNum()){
        console.log("1222");
        return false;
    }

    if(!testPhoneNumConfirm()) {
        console.log("1232");
        return false;
    }

    alert("회원가입을 축하합니다!");

    return false;
});//submit() end

// $("#nameRegisterInput").keyup(testName);
$("#phoneNumInput").keyup(testPhoneNum);
$phoneNumCheck.keyup(testPhoneNumConfirm);
