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
  $('#login').click(function(){
    $('.login_modal').stop().show();
  });
  $('.close').click(function(){
    $('.login_modal').hide();
  });
});

const update = document.querySelectorAll(".update");
const update_area = document.querySelector(".update_area");
const if1 = document.querySelector("#if1");

update.forEach(element => {
  element.addEventListener("click", function(e) {
    // 이벤트 중지
    e.preventDefault();
    // href 값 받아오기
    let test = this.getAttribute("href");
    // src로 넣기
    if1.setAttribute("src", test);
    // 수정하기 모달 로드
    update_area.showModal();
  });
});

// 닫기 함수
function closeModal() {
  update_area.close();
  location.reload();
} 

/* footer */
$('.footer').load('./module/footer.jsp');

/* aside */
$('.aside').load('./module/aside.jsp');


