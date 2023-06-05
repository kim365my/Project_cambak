// 차량 등록페이지 js

// 캠핑카 클릭시 스타일 변화
$(".button").click(function () {
    $(this).toggleClass("btn");
});

//preview image
//(https://webdir.tistory.com/435)
var imgTarget = $(".preview-image .upload-hidden");

imgTarget.on("change", function () {
    var parent = $(this).parent();
    parent.children(".upload-display").remove();

    if (window.FileReader) {
        //image 파일만
        if (!$(this)[0].files[0].type.match(/image\//)) return;

        var reader = new FileReader();
        reader.onload = function (e) {
            var src = e.target.result;
            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="' + src + '" class="upload-thumb" onclick="modal_img()"></div></div>');
        };
        reader.readAsDataURL($(this)[0].files[0]);
    } else {
        $(this)[0].select();
        $(this)[0].blur();
        var imgSrc = document.selection.createRange().text;
        parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb" onclick="modal_img()"></div></div>');

        var img = $(this).siblings(".upload-display").find("img");
        img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\"" + imgSrc + '")';
    }
});

// +,- 버튼 클릭시 증감표현
$("._count :button").on({
    click: function (e) {
        e.preventDefault();
        var $count = $(this).parent("._count").find(".inp");
        var now = parseInt($count.val());
        var min = 1;
        var max = 10;
        var num = now;
        if ($(this).hasClass("minus")) {
            var type = "m";
        } else {
            var type = "p";
        }
        if (type == "m") {
            if (now > min) {
                num = now - 1 + "명";
            }
        } else {
            if (now < max) {
                num = now + 1 + "명";
            }
        }
        if (num != now) {
            $count.val(num);
        }
    },
});


// 스크롤시 진행바 나타나기
$(window).scroll(function() {
    
    $('#progressBar').css('width', (($(this).scrollTop()/($('#wrapper').outerHeight()-$(window).outerHeight()))*100) + '%');
    
  });


// 스크롤시 aside에 체크표시 나타나기
$(function () {
    $(window).scroll(function () {
        $(".image").each(function (i) {
            var bottom_of_element = $(this).offset().top + $(this).outerHeight();
            var bottom_of_window = $(window).scrollTop() + $(window).height();

            if (bottom_of_window > bottom_of_element) {
                $(this).animate({ opacity: "1" }, 300);
            }
        });
    });
});

// 업체 상세페이지
//preview image
var imgDetailTarget = $(".detail_preview_images .detail_upload_hidden");

imgDetailTarget.on("change", function () {
    var detailParent = $(this).parent();
    detailParent.children(".detail_upload_display").remove();

    if (window.FileReader) {
        //image 파일만
        if (!$(this)[0].files[0].type.match(/image\//)) return;

        var detailReader = new FileReader();
        detailReader.onload = function (e) {
            var detailSrc = e.target.result;
            detailParent.prepend('<div class="detail_upload_display"><div class="detail_upload_thumb_wrap"><img src="' + detailSrc + '" class="detail_upload_thumb" onclick="detail_modal_img()"></div></div>');
        };
        detailReader.readAsDataURL($(this)[0].files[0]);
    } else {
        $(this)[0].select();
        $(this)[0].blur();
        var imgDetailSrc = document.selection.createRange().text;
        detailParent.prepend('<div class="detail_upload_display"><div class="detail_upload_thumb_wrap"><img class="detail_upload_thumb" onclick="detail_modal_img()"></div></div>');

        var imgDetail = $(this).siblings(".detail_upload_display").find("img");
        imgDetail[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\"" + imgDetailSrc + '")';
    }
});

// 이미지 클릭시 모달창
// (https://ssimplay.tistory.com/460)
function modal_img(){
    var img = new Image();
    img.src = $(".upload-thumb").attr("src");
    $(".modal_content").html(img);
    $(".modal").stop().show();

    // 모달창 닫기
    $(".modal").click(function (e){
        $(".modal").hide();
    })
}
function detail_modal_img(){
    var imgDetail = new Image();
    imgDetail.src = $(".detail_upload_thumb").attr("src");
    $(".modal_content").html(imgDetail);
    $(".modal").stop().show();

    // 모달창 닫기
    $(".modal").click(function (e){
        $(".modal").hide();
    })
}
