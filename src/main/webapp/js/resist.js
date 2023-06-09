// 차량 등록페이지 js

// 캠핑카 클릭시 스타일 변화
$(".button").click(function () {
    $(this).toggleClass("btn");
});

// 이미지 다중 미리보기 (썸네일)
$(document).ready(function (e){
    $("#input-file").change(function(e){

      //div 내용 비워주기
      $('#thumb_img').empty();

      var files = e.target.files;
      var arr =Array.prototype.slice.call(files);
      
      //업로드 가능 파일인지 체크
      for(var i=0;i<files.length;i++){
        if(!checkExtension(files[i].name,files[i].size)){
          return false;
        }
      }
      
      preview(arr);
      
      
    });//file change
    
    function checkExtension(fileName,fileSize){

      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
      var maxSize = 20971520;  //20MB
      
      if(fileSize >= maxSize){
        alert('파일 사이즈 초과');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      
      if(regex.test(fileName)){
        alert('업로드 불가능한 파일이 있습니다.');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      return true;
    }
    
    function preview(arr){
      arr.forEach(function(f){
        
        //파일명이 길면 파일명...으로 처리
        var fileName = f.name;
        if(fileName.length > 10){
          fileName = fileName.substring(0,7)+"...";
        }
        
        //div에 이미지 추가
        var str = '<div style="display: inline-flex; padding: 10px;"><li>';
        str += '<span>'+fileName+'</span><br>';
        
        //이미지 파일 미리보기
        if(f.type.match('image.*')){
          var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
          reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
            //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
            str += '<img src="'+e.target.result+'" title="'+f.name+'" class="upload-thumb" onclick="modal_img()"/>';
            str += '</li></div>';
            $(str).appendTo('#thumb_img');
          } 
          reader.readAsDataURL(f);
        }else{
          str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
          $(str).appendTo('#thumb_img');
        }
      });//arr.forEach
    }
  });

// 이미지 다중 미리보기(상세페이지)
$(document).ready(function (e){
    $("#detail_input_file").change(function(e){

      //div 내용 비워주기
      $('#detail_img').empty();

      var detail_files = e.target.files;
      var detail_arr =Array.prototype.slice.call(detail_files);
      
      //업로드 가능 파일인지 체크
      for(var i=0;i<detail_files.length;i++){
        if(!checkDetailExtension(detail_files[i].name,detail_files[i].size)){
          return false;
        }
      }
      
      preview(detail_arr);
      
      
    });//file change
    
    function checkDetailExtension(fileName,fileSize){

      var de_regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
      var de_maxSize = 20971520;  //20MB
      
      if(fileSize >= de_maxSize){
        alert('파일 사이즈 초과');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      
      if(de_regex.test(fileName)){
        alert('업로드 불가능한 파일이 있습니다.');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      return true;
    }
    
    function preview(detail_arr){
        detail_arr.forEach(function(f){
        
        //파일명이 길면 파일명...으로 처리
        var fileName = f.name;
        if(fileName.length > 10){
          fileName = fileName.substring(0,7)+"...";
        }
        
        //div에 이미지 추가
        var detail_str = '<div style="display: inline-flex; padding: 10px;"><li>';
        detail_str += '<span>'+fileName+'</span><br>';
        
        //이미지 파일 미리보기
        if(f.type.match('image.*')){
          var de_reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
          de_reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
            //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
            detail_str += '<img src="'+e.target.result+'" title="'+f.name+'" class="detail_upload_thumb" onclick="detail_modal_img()"/>';
            detail_str += '</li></div>';
            $(detail_str).appendTo('#detail_img');
          } 
          de_reader.readAsDataURL(f);
        }else{
            detail_str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
          $(detail_str).appendTo('#detail_img');
        }
      });//arr.forEach
    }
  });

// +,- 버튼 클릭시 증감표현
$("._count :button").on({
    click: function (e) {
        e.preventDefault();
        var $count = $(this).parent("._count").find(".inp");
        var now = parseInt($count.val());
		console.log(now);
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
				console.log(num);
				console.log(now);
            }
        } else {
            if (now < max) {
                num = now + 1 + "명";
				console.log(num);
				console.log(now);
            }
        }
        if (num != now) {
            $count.val(num);
        }
    },
});


// 스크롤시 진행바 나타나기
$(window).scroll(function() {
    $('#progressBar').css('width', (((($(window).scrollTop()/($('#wrapper').outerHeight()-$(window).outerHeight())*100)*(-1))/2)-18.5) + '%');
  
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
// var imgDetailTarget = $(".detail_preview_images .detail_upload_hidden");

// imgDetailTarget.on("change", function () {
//     var detailParent = $(this).parent();
//     detailParent.children(".detail_upload_display").remove();

//     if (window.FileReader) {
//         //image 파일만
//         if (!$(this)[0].files[0].type.match(/image\//)) return;

//         var detailReader = new FileReader();
//         detailReader.onload = function (e) {
//             var detailSrc = e.target.result;
//             detailParent.prepend('<div class="detail_upload_display"><div class="detail_upload_thumb_wrap"><img src="' + detailSrc + '" class="detail_upload_thumb" onclick="detail_modal_img()"></div></div>');
//         };
//         detailReader.readAsDataURL($(this)[0].files[0]);
//     } else {
//         $(this)[0].select();
//         $(this)[0].blur();
//         var imgDetailSrc = document.selection.createRange().text;
//         detailParent.prepend('<div class="detail_upload_display"><div class="detail_upload_thumb_wrap"><img class="detail_upload_thumb" onclick="detail_modal_img()"></div></div>');

//         var imgDetail = $(this).siblings(".detail_upload_display").find("img");
//         imgDetail[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\"" + imgDetailSrc + '")';
//     }
// });

// 이미지 클릭시 모달창
// (https://ssimplay.tistory.com/460)
// function modal_img(){
//     var img = new Image();
//     img.src = $(".upload-thumb").attr("src");
//     $(".modal_content").html(img);
//     $(".modal").stop().show();

//     // 모달창 닫기
//     $(".modal").click(function (e){
//         $(".modal").hide();
//     })
//     $("#thumb_img").click(function(){

//     });
// };

// function detail_modal_img(){
//     var imgDetail = new Image();
//     imgDetail.src = $(".detail_upload_thumb").attr("src");
//     $(".modal_content").html(imgDetail);
//     $(".modal").stop().show();

//     // 모달창 닫기
//     $(".modal").click(function (e){
//         $(".modal").hide();
//     })
// };