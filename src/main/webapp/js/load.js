/* header, footer, aside load */

/* header */
$('.header').load('./module/header.jsp', function(){
  /* 아이디 / 화살표 호버 시 gnb 나타내기 */
  $('.header_icon .gnb_toggle').mouseenter(function(){
    $('.header_gnb').stop().fadeIn('fast');
  });
  $('.header_icon .gnb_toggle').mouseleave(function(){
    $('.header_gnb').stop().fadeOut('fast');
  });

  /* 로그인/회원가입 모달창 */
  $('.span').click(function(){
    $('.login_modal').stop().show();
  });
  $('.close').click(function(){
    $('.login_modal').hide();
  });
});

/* 수정하기 모달 로드 */ 
$('.update_modal').load('./module/update.jsp', function(){
  /* 수정하기 모달창 */
  $('.update').click(function(){
    $('.update_modal').stop().show();
  });

  $('.update_close').click(function(){
    $('.update_modal').hide();
  });
});

/* footer */
$('.footer').load('./module/footer.jsp');

/* aside */
$('.aside').load('./module/aside.jsp');


