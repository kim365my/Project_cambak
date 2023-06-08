<%@page import="java.util.ArrayList"%>
<%@page import="biz.campingcar.CampingcarDAO"%>
<%@page import="biz.campingcar.CampingcarVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
	
	String context = request.getContextPath();
	// 비지니스 로직 실행
	CampingcarDAO cdao = new CampingcarDAO();
	ArrayList<CampingcarVO> campingcarList = cdao.getALLCampingcar();
%>
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
    <!-- 스와이퍼 css -->
    <link rel="stylesheet" href="./css/swiper-bundle.css">
    <!-- 페이지 CSS -->
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/common.css">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/main_calendar_area.css">
    <link rel="stylesheet" href="./css/chatbot.css">
    <!-- 기본 코딩 JS 파일 -->
    <script src="./js/jquery-1.12.4.min.js"></script>
    <script src="./js/jquery-3.3.1.min.js"></script>
    <script src="./js/jquery-3.4.1.min.js"></script>
    <script src="./js/prefixfree.min.js"></script>
    <!-- 제이쿼리 플러그인 -->
    <!-- <script src="./js/jquery-ui.min.js"></script> -->
    <!-- <script src="./js/jquery.scrollTo.min.js"></script> -->
</head>
<body>
  <div id="wrap">
    <header class="header w1140">
    	<!-- header include -->
      <jsp:include page="./module/header.jsp" />
    </header>
    <main role="main">
      <div class="main_img">
        <h1>
          <p>잠시, <br></p>
          <div class="cover">
            <span>캠박</span>
            <span>차박</span>
            <span>캠핑</span>
          </div>
          <span class="fix_text">가자</span>
        </h1>
        <div class="rent_date">
          <p>캠핑카, 간편하게 예약 후 바로 떠나세요!</p>
          <ul class="rent_table">
            <li>대여기간을 선택하세요</li>
            <!-- 캘린더 -->
            <div class = "calendar_container">
              <div class="calendar_title">
                <button class = "left_button"><i class="fas fa-chevron-circle-left"></i></button>
                <p class = "calendar_month_title">2월</p>
                <button class = "right_button"><i class="fas fa-chevron-circle-right"></i></button>
              </div>    
              <table class = "calendar">
                <tbody>
                  <tr class = "week">
                      <td class = "day">일</td>
                      <td class = "day">월</td>
                      <td class = "day">화</td>
                      <td class = "day">수</td>
                      <td class = "day">목</td>
                      <td class = "day">금</td>
                      <td class = "day">토</td>
                  </tr>
                  <tr>    <!-- 달력 첫 번째 줄-->
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                  </tr>
                  <tr>    <!-- 달력 두 번째 줄-->
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                  </tr>
                  <tr>    <!-- 달력 세 번째 줄-->
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                  </tr>
                  <tr>    <!-- 달력 네 번째 줄-->
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                  </tr>
                  <tr>    <!-- 달력 다섯 번째 줄-->
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                  </tr>
                  <tr>    <!-- 달력 여섯 번째 줄-->
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                      <td class = "calendar_days" roll = "button"> </td>
                  </tr>
                </tbody>
              </table>
              <div class="area_footer">
                <button>선택완료</button>
              </div> 
            </div>
          </ul>
          <ul class="rent_table">
            <li>대여를 원하는 지역을 선택하세요</li>
            <!-- 지역 선택 체크박스 -->
            <div class="check">
              <div class="check_area">
                <h3>지역선택</h3>
                <p>복수선택 가능</p>
                <label>
                    <input type="checkbox" name="area" value="강원" />
                    <span></span>
                    강원
                </label>
                <label>
                    <input type="checkbox" name="area" value="경기/인천" />
                    <span></span>
                    경기/인천
                </label>
                <label>
                    <input type="checkbox" name="area" value="광주/전라" />
                    <span></span>
                    광주/전라
                </label>
                <label>
                    <input type="checkbox" name="area" value="대구/울산/경북" />
                    <span></span>
                    대구/울산/경북
                </label>
                <label>
                    <input type="checkbox" name="area" value="대전/충청" />
                    <span></span>
                    대전/충청
                </label>
                <label>
                    <input type="checkbox" name="area" value="부산/경남" />
                    <span></span>
                    부산/경남
                </label>
                <label>
                    <input type="checkbox" name="area" value="서울" />
                    <span></span>
                    서울
                </label>
                <label>
                    <input type="checkbox" name="area" value="제주" />
                    <span></span>
                    제주
                  </label>
                </div>
                <div class="area_footer">
                  <button>선택완료</button>
                </div>
            </div>
            <li>
              <button class="date_search"><i class="fas fa-search"></i></button>
            </li>
          </ul> 
        </div>
      </div>
      <!-- 실시간 인기 캠핑카 -->
      <!-- 추후 조회수 순으로 DB 연결 -->
      <section class="w1140">
        <h2 class="h2">캠박 실시간 인기캠핑카</h2>
        <!-- 렌트카1 -->
        <div class="realtime">
		<%
			for(int i = 0; i < 6; i++){
				CampingcarVO cvo = campingcarList.get(i);
		%>
          <div class="rent_car">
          	<span class="material-symbols-outlined favorite">favorite</span>
            <a href="GetCampingcarCtrl?campingcar_no=<%=cvo.getCampingcar_no()%>">
              <div class="car_img" style="background-image: url('<%=context %>/images/detail/<%= cvo.getCampingcar_no() %>/<%=cvo.getCampingcar_img()[0]%>');">
              <!-- 상세보기 링크 -->
                <p>즉시예약가능</p>
                
              </div>
            
            <div class="car_info">
              <div class="car_name">
                <h3><i class="rz--verified fas fa-check-circle"></i>[위캠프] <%=cvo.getCampingcar_name() %></h3>
                <h4><%=cvo.getCampingcar_infos()%></h4>
              </div>
              <ul class="car_option">
                <li>
                  <i class="fas fa-map-marker-alt"></i>차고지: <%=cvo.getCampingcar_address() %>
                </li>
                <li>
                  <i class="fas fa-address-card"></i><%=cvo.getCampingcar_license() %>
                </li>
                <li class="no_mr">
                  <i class="fas fa-user-friends"></i>동승 <%=cvo.getCampingcar_rider() %>명
                </li>
                <li>
                  <i class="fas fa-bed"></i>취침 <%=cvo.getCampingcar_sleeper() %>명
                </li>
              </ul>
              <p>
                <i class="far fa-calendar-check"></i>잊지못할 밤, <%=cvo.getCampingcar_ph_fare() %>원 부터
              </p>
            </div>
            </a>
          </div>
		<%}%>
          <div class="more">
            더 많은 차량 보러가기<i class="fas fa-arrow-right rz-ml-1"></i>
          </div>
        </div>
      </section>
      <!-- 키워드 -->
      <section class="keyword w1140">
        <h2 class="h2">캠박 키워드 추천</h2>
        <h3 class="h3">캠박이 엄선한 캠핑카들을 키워드별로 만나보세요.</h3>
        <div class="card_section">
          <div class="card_box1 card_box">
            <h3>작지만 있을건 다 있어</h3>
            <p>#가성비&nbsp;#2종보통&nbsp;#소형&nbsp;#레이</p>
          </div>
          <div class="card_box2 card_box">
            <h3>애견동반</h3>
            <p>#애견동반가능</p>
          </div>
          <div class="card_box3 no_mr card_box">
            <h3>프리미엄</h3>
            <p>#대형&nbsp;#샤워부스&nbsp;#고급</p>
          </div>
          <div class="card_box4 card_box">
            <h3>가족여행</h3>
            <p>#4인이상&nbsp;#넓은내부</p>
          </div>
          <div class="card_box5 card_box">
            <h3>감성차박</h3>
            <p>#인스타</p>
          </div>
          <div class="card_box6 no_mr card_box">
            <h3>장비대여</h3>
            <p>#캠핑용품&nbsp;#수면용품</p>
          </div>
        </div>
      </section>
      <!-- 차박지도 -->
      <section class="map w1140">
        <h2 class="h2">차박 지도</h2>
        <h3 class="h3">어디로 떠날까? 캠박이 준비한 차박/오토캠핑 장소들을 만나보세요</h3>
        <div class="map_section">
          <!-- 지도1 -->
          <div class="map_contents">
            <div class="map_img1">
              <span class="material-symbols-outlined">favorite</span>
            </div>
            <div class="map_name">
              <h3>옥계해변</h3>
              <h4>강릉에 위치한 해변으로 넓은 주차장이 있어 쾌적한 환경을 제공함</h4>
            </div>
            <ul class="map_icon">
              <li>
                <i class="fa fa-usd"></i>유료
              </li>
              <li>
                <i class="fas fa-toilet"></i>화장실
              </li>
            </ul>
            <p><i class="fas fa-map-marker-alt"></i>대한민국 전라남도 해남군</p>
          </div>
          <!-- 지도2 -->
          <div class="map_contents">
            <div class="map_img2">
              <span class="material-symbols-outlined">favorite</span>
            </div>
            <div class="map_name">
              <h3>소래습지생태공원</h3>
              <h4>생태전시관을 비롯하여 풍차의 갈대밭, 염전 소금창고가 있는 생태공원</h4>
            </div>
            <ul class="map_icon">
              <li>
                <i class="material-icons">money_off</i>무료
              </li>
              <li>
                <i class="fas fa-toilet"></i>화장실
              </li>
              <li>
                <i class="fas fa-store"></i>편의점/마트
              </li>
            </ul>
            <p><i class="fas fa-map-marker-alt"></i>대한민국 인천광역시</p>
          </div>
          <!-- 지도3 -->
          <div class="map_contents">
            <div class="map_img3">
              <span class="material-symbols-outlined">favorite</span>
            </div>
            <div class="map_name">
              <h3>나아해변</h3>
              <h4>파도소리를 들으며 해돋이를 감상할 수 있는 해변입니다. 그리고 바다풍경도</h4>
            </div>
            <ul class="map_icon">
              <li>
                <i class="material-icons">money_off</i>무료
              </li>
              <li>
                <i class="fas fa-toilet"></i>화장실
              </li>
              <li>
                <i class="fas fa-store"></i>편의점/마트
              </li>
            </ul>
            <p><i class="fas fa-map-marker-alt"></i>대한민국 경상북도 경주시</p>
          </div>
          <!-- 지도4 -->
          <div class="map_contents">
            <div class="map_img4">
              <span class="material-symbols-outlined">favorite</span>
            </div>
            <div class="map_name">
              <h3>몽산포오션캠핑장</h3>
              <h4>소나무숲과 바다가 만나는 캠핑장입니다. 인잡해있는 몽산포해수욕장은</h4>
            </div>
            <ul class="map_icon">
              <li>
                <i class="fa fa-usd"></i>유료
              </li>
              <li>
                <i class="fas fa-toilet"></i>화장실
              </li>
              <li>
                <i class="fas fa-store"></i>편의점/마트
              </li>
            </ul>
            <p><i class="fas fa-map-marker-alt"></i>대한민국 충청남도 태안군</p>
          </div>
          <!-- 지도5 -->
          <div class="map_contents">
            <div class="map_img5">
              <span class="material-symbols-outlined">favorite</span>
            </div>
            <div class="map_name">
              <h3>석갱이 오토캠핑장</h3>
              <h4>구례포, 학암포해수욕장을 비롯하여 다양한 해수욕장이 인접해있는</h4>
            </div>
            <ul class="map_icon">
              <li>
                <i class="fa fa-usd"></i>유료
              </li>
              <li>
                <i class="fas fa-toilet"></i>화장실
              </li>
              <li>
                <i class="fas fa-store"></i>편의점/마트
              </li>            
            </ul>
            <p><i class="fas fa-map-marker-alt"></i>대한민국 충청남도 태안군</p>
          </div>
          <!-- 지도6 -->
          <div class="map_contents">
            <div class="map_img6">
              <span class="material-symbols-outlined">favorite</span>
            </div>
            <div class="map_name">
              <h3>진위천유원진 캠핑장</h3>
              <h4>레일바이크 체험을 할 수 있는 캠핑장으로, 이외에도 다양한 체험을</h4>
            </div>
            <ul class="map_icon">
              <li>
                <i class="fa fa-usd"></i>유료
              </li>
              <li>
                <i class="fas fa-toilet"></i>화장실
              </li>
              <li>
                <i class="fas fa-store"></i>편의점/마트
              </li>              
            </ul>
            <p><i class="fas fa-map-marker-alt"></i>대한민국 경기도 평택시</p>
          </div>
        </div>
        <div class="more">
          더 많은 장소 보러가기<i class="fas fa-arrow-right rz-ml-1"></i>
        </div>
      </section>
      <!-- 배너 -->
      <div id="banner">
        <div class="swiper-container">
          <div class="swiper-wrapper">
            <!-- 배너 슬라이드1 -->
            <div class="swiper-slide">
              <img src="./images/main/banner/banner01.png" alt="배너1">
            </div> 
            <!-- 배너 슬라이드2 -->
            <div class="swiper-slide">
              <img src="./images/main/banner/banner02.png" alt="배너2">
            </div>
            <!-- 배너 슬라이드3 -->
            <div class="swiper-slide">
              <img src="./images/main/banner/banner03.png" alt="배너3">
            </div>
            <!-- 배너 슬라이드4 -->
            <div class="swiper-slide">
              <img src="./images/main/banner/banner04.png" alt="배너4">
            </div>
          </div>
          <!-- 스와이퍼 좌우 화살표 -->
          <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div>
          <!-- /스와이퍼 좌우 화살표 -->
        </div>
      </div>
      <!-- 스폰서 -->
      <section class="sponsor">
        <div class="w1140">
          <div class="apply">
            <h3>캠핑카 렌트 사업자님!</h3>
            <p>국내 최고의 차박 렌트 대여 플랫폼 캠박의 파트너가 되어주세요!</p>
            <p>지금 바로 사업자 등록후 고객들을 만나보세요.</p>
          </div>
          <button>신청하기</button>
        </div>
      </section>
      <ul class="sponsor_name w1140">
        <li><img src="./images/main/sponsor/sponsor01.jpg" alt="스폰서1"></li>
        <li><img src="./images/main/sponsor/sponsor02.jpg" alt="스폰서2"></li>
        <li><img src="./images/main/sponsor/sponsor03.jpg" alt="스폰서3"></li>
        <li><img src="./images/main/sponsor/sponsor04.jpg" alt="스폰서4"></li>
      </ul>
    </main>
    <footer class="footer">
      <jsp:include page="./module/footer.jsp" />
    </footer>

    <!-- 챗봇 -->
    <aside class="chatbot" id="chatbotFloatIcon">
      <jsp:include page="./module/chatbot.jsp" />
    </aside>
  </div>
<!-- 스와이퍼 플러그인 -->
<script src="./js/swiper-bundle.js"></script>
<!-- 페이지 JS -->
<script src="./js/main.js"></script>
<script src="./js/load.js"></script>
<script src="./js/common.js"></script>
</body>
</html>