<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="author" content="JGM" />
    <meta name="description" content="중꺾마 캠박 클론" />
    <title>캠박</title>
    <!-- 폰트어썸 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <!-- 폰트어썸 5 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <!-- 폰트어썸 4.7 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <!-- 머티리얼 아이콘 -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"  rel="stylesheet">
    <!-- 팝이콘 -->
    <link rel="shortcut icon" href="./images/favicon/fav32.png" />
    <link rel="apple-touch-icon=precomposed" href="./images/favicon/fav180.png" />
    <!-- 기본 코딩 JS 파일 -->
    <script src="./js/jquery-1.12.4.min.js"></script>
    <script src="./js/jquery-3.3.1.min.js"></script>
    <script src="./js/jquery-3.4.1.min.js"></script>
    <script src="./js/prefixfree.min.js"></script>
    <!-- 제이쿼리 플러그인 -->
    <!-- <script src="./js/jquery-ui.min.js"></script> -->
    <!-- 페이지 CSS -->
    <link rel="stylesheet" href="./css/reset.css" />
    <link rel="stylesheet" href="./css/font.css" />
    <link rel="stylesheet" href="./css/chatbot.css">
    <link rel="stylesheet" href="./css/dashboard.css" />
</head>
<body>
  <header>
    <ul class="logo">
      <li><a href="./index.jsp"><img src="./images/header/logo.png" alt="캠박로고"></a></li>
      <li>캠핑카 둘러보기</li>
      <li>파트너사 입점안내</li>
    </ul>
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
          <!-- 아아디값 불러와야함 -->
          <span class="span">로그인</span>
          <span class="material-symbols-outlined">expand_more</span>
        </div>
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
            <li>로그아웃</li>
          </ul>
        </div>
      </div>
      <p><a href="./resist.jsp">차량 및 장소 등록하기</a></p>
    </ul>  
  </header>
  <div id="wrap">
  <!-- 왼쪽 gnb -->
    <aside class="aside">
      <!-- aside include -->
      <jsp:include page="./module/aside.jsp" />
    </aside>
    <div id="main_wrap" class="wid_1140">
      <div class="dashboard_title wid_1140">
        <h3>대시보드</h3>
        <p>고객모드로 전환하기&nbsp;<i class="fa fa-arrow-right" aria-hidden="true"></i></p>
        <div class="boxes">
          <div class="resist_box">
            <section><a href="./listings.jsp"><i class="fas fa-map-marker-alt"></i></a></section>
            <p>등록슬롯&nbsp;&nbsp;<i class="fa fa-caret-right" aria-hidden="true"></i></p>
            <p>등록슬롯을 관리할 수 있습니다</p>
          </div>
          <div class="reserve_box">
            <section><i class="fa fa-plus-circle" aria-hidden="true"></i></section>
            <p>예약&nbsp;&nbsp;<i class="fa fa-caret-right" aria-hidden="true"></i></p>
            <p>예약 신청 및 관리를 할 수 있습니다</p>
          </div>
          <div class="chat_box">
            <section><i class="fa fa-commenting" aria-hidden="true"></i></section>
            <p>채팅&nbsp;&nbsp;<i class="fa fa-caret-right" aria-hidden="true"></i></p>
            <p>채팅내역을 확인할 수 있습니다</p>
          </div>
        </div>
        <div class="copyright wid_1140">
          <p>Copyright &copy; 2021 <a href="./index.jsp">캠박</a></p>
          <p>잊지 못할 캠핑의 추억을 만들자, 캠박</p>
        </div>
      </div>
    </div>
    <!-- 챗봇 -->
    <aside class="chatbot" id="chatbotFloatIcon">
      <!-- chatbot include -->
      <jsp:include page="./module/chatbot.jsp" />
    </aside>
  </div>
</body>
<!-- 페이지 JS -->
<script src="./js/dashboard.js"></script>
<script src="./js/load.js"></script>
<script src="./js/common.js"></script>
</html>