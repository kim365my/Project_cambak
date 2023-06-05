/* chat&top_btn */
$('.chatbot').load('./module/chatbot.html', function() {
  $('.chatbot .top_icon').hide(); // 탑 버튼 숨기기
  var h = 200;
  $(window).scroll(function(){
      var num = $(window).scrollTop();
      if(num > h){
          $('.chatbot .top_icon').stop().fadeIn();
      }else{
          $('.chatbot .top_icon').stop().fadeOut();
      }
  });

  // 클릭시 상단으로 이동
  $('.top_btn').click(function(){
      $('html,body').stop().animate({scrollTop: 0}, 300, 'swing');
  });
});