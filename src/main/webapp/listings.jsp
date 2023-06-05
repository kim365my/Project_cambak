<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="author" content="JGM" />
    <meta name="description" content="중꺾마 캠박 클론" />
    <title>캠박</title>
    <!-- 파비콘 -->
    <link rel="shortcut icon" href="./images/favicon/fav32.png">
    <link rel="apple-touch-icon=precomposed" href="./images/favicon/fav180.png">
    <!-- 폰트어썸 -->
    <!-- 버전 4.7 -->
    <link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- 버전 5.0 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <!-- metertial cdn -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"  rel="stylesheet">
    <!-- 기본 코딩 JS 파일 -->
    <script src="./js/jquery-1.12.4.min.js"></script>
    <script src="./js/jquery-3.3.1.min.js"></script>
    <script src="./js/jquery-3.4.1.min.js"></script>
    <script src="./js/prefixfree.min.js"></script>
    <!-- 제이쿼리 플러그인 -->
    <!-- <script src="./js/jquery-ui.min.js"></script> -->
    <!-- <script src="./js/jquery.scrollTo.min.js"></script> -->
    <!-- 페이지 CSS -->
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/listings.css">
    <link rel="stylesheet" href="./css/chatbot.css">
</head>
<body>
<div id="wrap">
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
  <main role="main">
    <aside class="aside">
      <!-- aside include -->
      <jsp:include page="./module/aside.jsp" />
    </aside>
    <section class="resist">
      <h1>등록슬롯</h1>
      <select type="text" name="search_resist" placeholder="All Llisting types">
        <option value="All Llisting type">All Llisting types</option>
        <option value="캠핑카">캠핑카</option>
        <option value="캠핑카구매">캠핑카구매</option>
        <option value="사이트">사이트</option>
        <option value="캠핑카 회원권">캠핑카 회원권</option>
      </select>
      <button>Filter</button>
      <div class="slot">
        <!-- 썸네일 이미지 동적으로 들어가는 부분 -->
        <p><i class="fas fa-map-marker-alt"></i></p>
        <div class="slot_info">
          <span class="confirm">승인대기중</span>
          <div class="info_text">
            <dl>
              <dt>타입</dt>
              <dd>캠핑카</dd>
            </dl>
            <dl>
              <dt>생성일</dt>
              <dd>2023년 06월 01일</dd>
            </dl>
            <dl>
              <dt>만료일</dt>
              <dd>-</dd>
            </dl>
            <dl>
              <dt>평점</dt>
              <dd>-</dd>
            </dl>
            <dl class="no_mb">
              <dt>오늘 조회수</dt>
              <dd>0</dd>
            </dl>          
          </div>
        </div>
        <div class="info_icon">
          <ul>
            <li class="update"><i class="fas fa-pen"></i></li>
            <li><i class="fas fa-calendar-alt"></i></li>
            <li><i class="fas fa-calendar-check"></i></li>
            <li><i class="fas fa-trash-alt"></i></li>
          </ul>
        </div>
      </div>
      <article class="resist_footer">
        <dl>
          <dt>Copyright &copy; 2021 <a href="./index.jsp">캠박</a></dt>
          <dd>잊지 못할 캠핑의추억을 만들자, 캠박</dd>
        </dl>
      </article>
    </section>

    <!-- 수정하기 모달창 -->
    <div class="update_area">
        <!-- 수정하기 인클루드 -->
        <jsp:include page="./module/update.jsp" />
    </div>
    <!-- /수정하기 모달창 -->
    

  </main>
  <!-- 챗봇 -->
  <aside class="chatbot" id="chatbotFloatIcon">
    <!-- chatbot include -->
    <jsp:include page="./module/chatbot.jsp" />
  </aside>
</div>
<!-- 페이지 JS -->
<script src="./js/listings.js"></script>
<script src="./js/load.js"></script>
<script src="./js/common.js"></script>
</body>
</html>