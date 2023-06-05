// 상세페이지 js

let today = new Date();   
console.log(today);

const ratingInputs = document.getElementsByName("score");

ratingInputs.forEach((input) => {
input.addEventListener("click", () => {
    console.log("내가 선택한 별점 : ", input.value);
});
});


// 리뷰 등록 및 취소
$(".review_reist").click(function(){
    $("#modal").show();
})
$(".review_cancel").click(function(){
    $("#modal").hide();
    $("input[name='score']").prop('checked', false);
    $("textarea").val("");
})





// 상단 이미지 클릭시 모달창 , 슬라이드
// 배열 값으로 동적효과 근데 DB로 할거라 그냥 카운트 값으로 변경
// var imageUrls = [
    //     "./images/detail/realtime01-detail/realtime01-detail01.jpg",
    //     "./images/detail/realtime01-detail/realtime01-detail02.jpg",
//     "./images/detail/realtime01-detail/realtime01-detail03.jpg",
//     "./images/detail/realtime01-detail/realtime01-detail04.jpg",
//     "./images/detail/realtime01-detail/realtime01-detail05.jpg",
//     "./images/detail/realtime01-detail/realtime01-detail06.jpg",
//     "./images/detail/realtime01-detail/realtime01-detail07.jpg",
//     "./images/detail/realtime01-detail/realtime01-detail08.jpg",
//     "./images/detail/realtime01-detail/realtime01-detail09.jpg",
//     "./images/detail/realtime01-detail/realtime01-detail10.jpg",
//     "./images/detail/realtime01-detail/realtime01-detail11.jpg",
// ];

// var cnt = 0;
// var currentImageIndex = 0;
// var slideImage = $("#slide_image");
// var prevButton = $("#prev_button");
// var nextButton = $("#next_button");
// var imageCounter = $("#image_counter");

// prevButton.on("click", function() {
//     currentImageIndex = (currentImageIndex - 1 + imageUrls.length) % imageUrls.length;
//     slideImage.fadeTo(100, 0, function() {
//     slideImage.attr("src", imageUrls[currentImageIndex]);
//     slideImage.fadeTo(100, 1);
//     updateImageCounter();
//     });
// });

// nextButton.on("click", function() {
//     currentImageIndex = (currentImageIndex + 1) % imageUrls.length;
//     slideImage.fadeTo(100, 0, function() {
//     slideImage.attr("src", imageUrls[currentImageIndex]);
//     slideImage.fadeTo(100, 1);
//     updateImageCounter();
//     });
// });

// function updateImageCounter() {
//     var counterText = (currentImageIndex + 1) + " / " + imageUrls.length;
//     imageCounter.text(counterText);
// }
//     console.log(imageUrls[1]);
//     console.log(imageUrls.length);



// 이미지 슬라이드 카운트 형식
var cnt = 1;  // 이미지 파일 순서 기준값
var currentImageIndex = 0;
// 슬라이드 이미지
var slideImage = $("#slide_image");
// 버튼
var prevButton = $("#prev_button");
var nextButton = $("#next_button");
// 이미지 카운트
var imageCounter = $("#image_counter");

prevButton.on("click", function() {
cnt--;
  if (cnt < 1) { // 첫 번째 이미지일 때 이전 버튼 클릭 시 마지막 이미지로 변경
    cnt = 11;
}
var image = "./images/detail/realtime01-detail/realtime01-detail" + pad(cnt) + ".jpg";
slideImage.fadeTo(100, 0, function() {
    slideImage.attr("src", image);
    slideImage.fadeTo(100, 1);
    updateImageCounter();
});
});

nextButton.on("click", function() {
cnt++;
  if (cnt > 11) { // 마지막 이미지일 때 다음 버튼 클릭 시 첫 번째 이미지로 변경
    cnt = 1;
}
var image = "./images/detail/realtime01-detail/realtime01-detail" + pad(cnt) + ".jpg";
slideImage.fadeTo(100, 0, function() {
    slideImage.attr("src", image);
    slideImage.fadeTo(100, 1);
    updateImageCounter();
});
});

function updateImageCounter() {
var counterText = cnt + " / 11";
imageCounter.text(counterText);
}


// 숫자를 2자리로 패딩합니다. 
// 이렇게 하면 이미지 순서에서 앞에 01 02 이런식으로 붙어줌
function pad(num) {
    return num.toString().padStart(2, "0"); 
}

$(".img_slide_cancel").click(function() {
    // 취소 버튼 클릭시 슬라이드 값 초기화
    slideImage.attr("src", "./images/detail/realtime01-detail/realtime01-detail01.jpg");
    cnt = 1;
    updateImageCounter();
    $(".img_slider_modal").hide();
});

// 메인이미지 클릭시 1부터 시작
// 여기는 구조의 문제로 2개로 쿼리문 제작
$(".detail_mainImg").click(function(e) {
    e.preventDefault();
    var clickedImageSrc = $(this).find("img").attr("src");
    var startIndex = 0; // 시작 카운터 값을 0으로 설정
    
    slideImage.attr("src", clickedImageSrc);
    cnt = startIndex + 1; // 시작 카운터 값을 1로 초기화
    updateImageCounter();
    $(".img_slider_modal").show();
});

// 다른 이미지 클릭시
$(".detail_img a").click(function(e) {
    e.preventDefault(); // 링크 클릭 시 페이지 이동을 막습니다.
    var clickedImageSrc = $(this).find("img").attr("src"); // 클릭한 이미지의 소스를 가져옵니다.
    var startIndex = $(".detail_img a").index(this); // 클릭한 이미지의 인덱스를 가져옵니다.
    
    // 슬라이드 이미지 소스 변경 및 카운터 업데이트
    slideImage.attr("src", clickedImageSrc);
    cnt = startIndex + 2;
    updateImageCounter();
    $(".img_slider_modal").show(); // 모달을 보여줍니다.
});


// a태그 이동 막기
$("a href='#'").click(function(e) {
    e.preventDefault();

});



// 좋아요 기능





//  페이지 이동 및 기타 , 합쳐서 적용시 지울 부분
$('.header_icon .name').mouseenter(function(){
    $('.header_gnb').stop().fadeIn('fast');
});
$('.header_icon .name').mouseleave(function(){
    $('.header_gnb').stop().fadeOut('fast');
});


$('.header_icon .user').mouseenter(function(){
    $('.header_gnb').stop().fadeIn('fast');
});
$('.header_icon .user').mouseleave(function(){
    $('.header_gnb').stop().fadeOut('fast');
});