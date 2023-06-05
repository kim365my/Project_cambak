/* 아이디 / 화살표 호버 시 gnb 나타내기 */
$('.header_icon .name').mouseenter(function(){
    $('.header_gnb').stop().fadeIn('fast');
});
$('.header_icon .name').mouseleave(function(){
    $('.header_gnb').stop().fadeOut('fast');
});