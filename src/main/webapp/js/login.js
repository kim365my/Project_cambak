
// 클릭해서 나와야 하는 부분
$('.name').click(function(){
    $('.login_modal').stop().show();
});
$('.close').click(function(){
    $('.login_modal').hide();
});
