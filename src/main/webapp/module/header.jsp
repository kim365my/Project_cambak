<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header logo -->
<ul class="logo">
  <li><a href="./index.jsp"><img src="./images/header/logo.png" alt="캠박로고"></a></li>
<!-- header logo -->
  <li>캠핑카 둘러보기</li>
  <li>파트너사 입점안내</li>
</ul>
<!-- 추후 if문으로 로그인 됐을때 나올 아이콘들-->
<ul class="header_icon">
  <li class="cart">
    <div class="material-icons">shopping_basket</div>
  </li>
  <li class="bell">
    <div class="material-icons">notification_important</div> 
  </li>
  <li class="mypage">
    <div class="material-icons">person</div>
  </li>
  <div class="name">
    <div>
      <span class="span">로그인</span>
      <span class="material-symbols-outlined">expand_more</span>
    </div>
    <!-- 로그인 안됐을때 gnb 부분도 안보여야함 -->
    <div class="header_gnb">
      <ul>
        <li><a href="./dashboard.jsp">대시보드</a></li>
        <li>채팅</li>
        <li>예약</li>
        <li>찜목록</li>
        <li class="list"></li>
        <li><a href="./listings.jsp">등록슬롯</a></li>
        <li>정산 및 출금</li>
        <li class="list"></li>
        <li>계정 상세정보</li>
        <!-- 추후 if문으로 로그인 안됐을때 -->
        <li>로그아웃</li>
      </ul>
    </div>
  </div>
  <p><a href="./resist.jsp">차량 및 장소 등록하기</a></p>
</ul>  

<!-- 로그인 안됐을때 나오는 아이콘-->
<!-- <ul class="header_icon">
  <li>
    <div><i class="material-icons">person</i></div>
  </li>
  <div class="name">
      <span class="span">로그인</span>
  </div>
  <p><a href="./resist.jsp">차량 및 장소 등록하기</a></p>
</ul> -->

<!-- 로그인 모달창 -->
<div class="login_modal">
  <!-- 추후 로그인 ctrl로 링크 수정 -->
  <div class="login_modal_content">
    <div class="title">
      <h1>로그인</h1>
      <p class="close"><i class="fa fa-times" aria-hidden="true"></i></p>
    </div>
    <div class="login_tabmenu">
      <!-- 탭버튼 -->
      <input type="radio" name="tabmenu" id="tab01" checked>
      <label for="tab01">로그인</label>
      <input type="radio" name="tabmenu" id="tab02">
      <label for="tab02" class="no_ml">회원가입</label>
      <div class="con01">
        <!-- 추후 로그인 ctrl로 주소 변경 -->
        <form action="#" method="post">
          <div class="login_input">
            <input type="text" name="user_id" placeholder="아이디 또는 이메일" required>
            <input type="password" name="user_pw" placeholder="비밀번호" class="password" required>
          </div>
          <p class="forget_pw">
            <i class="fa fa-unlock-alt" aria-hidden="true"></i>&nbsp;&nbsp;비밀번호를 잊어버리셨습니까?
          </p>
          <div class="line"></div>
          <div class="submit_btn">
            <input type="submit" value="로그인">
          </div>
        </form>
      </div>
      <div class="con02">
        <!-- 추후 로그아웃 ctrl로 링크 수정 -->
        <form action="#" method="post">
          <div class="join_content">
            <div class="join_input">
              <input type="text" name="user_id" placeholder="아이디" required>
              <input type="tel" name="user_tel" placeholder="휴대폰번호(공백없이 입력)" required>
              <input type="email" name="user_email" placeholder="이메일" required>
              <input type="password" name="user_pw" placeholder="비밀번호" required>
              <input type="password" name="user_pw2" placeholder="비밀번호 재입력" class="no_mr" required>
            </div>
            <div class="lg_check">
              <label>
                <input type="checkbox" value="agree" />
                <span></span>
                <strong>이용약관 및 개인정보취급방침에 동의합니다.</strong>
              </label>
            </div>
          </div>
          <div class="line"></div>
          <div class="submit_btn">
            <input type="submit" value="회원가입">
          </div>
        </form>
      </div>
    </div>
  </div>
</div>