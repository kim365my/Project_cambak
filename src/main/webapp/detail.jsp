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
    <!-- 폰트어썸 5 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <!-- 폰트어썸 4.7 -->
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>  
    <!-- 머티리얼 아이콘 -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"  rel="stylesheet">
    <!-- 팝이콘 -->
    <link rel="shortcut icon" href="./images/favicon/fav32.png">
    <link rel="apple-touch-icon=precomposed" href="./images/favicon/fav180.png">
    <!-- 기본 코딩 JS 파일 -->
    <script src="./js/jquery-1.12.4.min.js"></script>
    <script src="./js/jquery-3.3.1.min.js"></script>
    <script src="./js/jquery-3.4.1.min.js"></script>
    <script src="./js/prefixfree.min.js"></script>
    <!-- 제이쿼리 플러그인 -->
    <script src="./js/jquery-ui.min.js"></script>
    <script src="./js/jquery.scrollTo.min.js"></script>
    <!-- 기본 코딩 CSS 파일 -->
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/detail_common.css">
    <!-- 페이지 CSS -->
    <link rel="stylesheet" href="./css/detail.css">
    <link rel="stylesheet" href="./css/common.css">
    <link rel="stylesheet" href="./css/detail_calendar.css">
    <link rel="stylesheet" href="./css/chatbot.css">
</head>
<body>
  <header class="header">
  	<!-- header include -->
    <jsp:include page="./module/header.jsp" />
  </header>
  <aside class="login_modal">
    <!-- login include -->
  </aside>
  <main role="main">
      <section class="detail w1140">
        <section class="bak_imgBox img_modal">
          <a href="#" class="detail_mainImg">
            <img src="./images/detail/realtime01-detail/realtime01-detail01.jpg" alt="이미지">
          </a>
          <div class="detail_img img_modal">
              <a href="#">
                <img src="./images/detail/realtime01-detail/realtime01-detail02.jpg" alt="이미지">
              </a>
              <a href="#" class="no_mr no_mb">
                <img src="./images/detail/realtime01-detail/realtime01-detail03.jpg" alt="이미지">
              </a>
          </div>
          <div class="detail_img img_modal">
              <a href="#">
                <img src="./images/detail/realtime01-detail/realtime01-detail04.jpg" alt="이미지">
              </a>
              <a href="#" class="no_mr no_mbs">
                <img src="./images/detail/realtime01-detail/realtime01-detail05.jpg" alt="이미지">
              </a>
          </div>
        </section>
        <section class="detail_info">
          <article class="info_left">
            <div class="camping_infos">
              <!-- 캠핑카 이름 -->
              <h2>[위캠프] 2인승 로디 캠핑카</h2>
              <!-- 캠핑카 소개 -->
              <p>
                로디 캠핑카는 기아 레이 차량을 기반으로 만들어진 2인캠퍼에게 최적화된 캠핑카입니다.
              </p>
              <!-- 동승,취침 인원 -->
              <ul>
                <li>
                  <i class="fas fa-user-friends"></i>
                  동승가능인원 : <span>2</span>명
                </li>
                <li>
                  <i class="fas fa-bed"></i>
                  취침가능인원 : <span>2</span>명
                </li>
              </ul>
              <!-- 출고 반납 시간 -->
              <ul>
                <li>
                  <i class="far fa-clock"></i>
                  대여일 출차시간 : <span>9:00</span>
                </li>
                <li>
                  <i class="far fa-clock"></i>
                  반납일 반납시간 : <span>16:00</span>
                </li>
              </ul>
              <!-- 가격 -->
              <ul>
                <li>
                  <i class="fas fa-money-check"></i>
                  평일가격 : <span>95,000</span>원&nbsp;/박
                </li>
                <li>
                  <i class="fas fa-bed"></i>
                  주말가격 : <span>140,000</span>원&nbsp;/박
                </li>
              </ul>
              <!-- 라이센스 -->
              <ul>
                <li>
                  <i class="fas fa-address-card"></i>
                  <span>2종 보통</span> 이상
                </li>
              </ul>
              <!-- 차고지 주소 -->
              <ul>
                <li>
                  <i class="fas fa-map-marker-alt"></i>
                  차고지 주소 : <span>대한민국 경기도 하남시 신장동 107-1</span>
                </li>
              </ul>
            </div>
            <!-- 보유시설 -->
            <div class="mod_listing">
              <h4>보유시설</h4>
              <ul>
                <li>
                  ·<span>TV</span>
                </li>
              <!-- </ul> --> 
                <li>
                  ·<span>루프박스</span>
                </li>
                <li>
                  ·<span>무시동 히터</span>
                </li>
                <li>
                  ·<span>방충망</span>
                </li>
                <li>
                  ·<span>유아용 카시트</span>
                </li>
                <li>
                  ·<span>유압식 테이블</span>
                </li>
                <li>
                  ·<span>사이드어닝</span>
                </li>
                <li>
                  ·<span>충전식 배터리</span>
                </li>
              </ul>
            </div>
            <!-- 상세페이지 이미지 -->
            <div class="campingcar_img">
              <img src="./images/detail/realtime01-detail/realtim01-detail12.png" alt="상세페이지">
            </div>
            <!-- 차고지 주소 -->
            <div class="campingcar_address">
              <h4>차고지 주소</h4>
              <div class="address_info">
                <iframe class="map"
                  src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.596444135883!2d127.2212315!3d37.5410092!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357cb22d41e10e53%3A0x92d0adf782e2b812!2z6rK96riw64-EIO2VmOuCqOyLnCDsi6DsnqXrj5kgMTA3LTE!5e0!3m2!1sko!2skr!4v1685608383979!5m2!1sko!2skr"
                  width="600"
                  height="450"
                  style="border:0; border-radius: 10px;"
                  allowfullscreen=""
                  loading="lazy"
                  referrerpolicy="no-referrer-when-downgrade">
                </iframe>
              </div>
            </div>
            <!-- 업체 프로필 -->
            <div class="profile">
              <h4>업체 프로필</h4>
              <div class="profile_box">
                <div class="profile_header">
                  <a href="#">
                    <i class="material-icons">person</i>
                    <!-- 업체이름 -->
                  <p>위캠프</p>
                  <i class="rz--verified fas fa-check-circle"></i>
                  <span>인증업체</span>
                  </a>
                </div>
                <!-- 업체에게 채팅하기 -->
                <button>
                  위캠프에게 채팅하기
                </button>
              </div>
            </div>
            <!-- 후기 -->
            <div class="review">
              <!-- 후기 갯수 -->
              <h4>후기</h4>
              <div class="review_stats">
                <p>
                  후기 n개&nbsp;&nbsp;
                  <i class="fas fa-star"></i>
                  <span>5.00</span>
                </p>
                <button class="review_reist">
                  후기 등록하기
                </button>
              </div>
              <!-- 고객 후기 1-->
              <div class="customer_review">
                <div class="customer_info">
                  <i class="material-icons">person</i>
                  <!-- 작성자 및 별점 -->
                  <p>감자 박 <i class="fas fa-star"></i><span>5.00</span></p>
                </div>
                <div class="review_content">
                  <!-- 후기내용 -->
                  <p>
                    차박용 차를 처음이용해 봤는데, 다행이 굉장히 추운날씨에도 불구하고 무시동히터의 위력이 대단했습니다.
                    아침에 일어날때까지 굉장히 만족스러웠습니다! 차량 시설도 처음에 빌릴때는 필요할까? 싶었는데, 
                    막상 캠핑장에 도착하니 왜 존재하는지 알게된게 한두개가 아니었습니다.
                  </p>
                </div>
              </div>
              <!-- 고객 후기 2-->
              <div class="customer_review">
                <div class="customer_info">
                  <i class="material-icons">person</i>
                  <!-- 작성자 및 별점 -->
                  <p>고구마 이 <i class="fas fa-star"></i><span>5.00</span></p>
                </div>
                <div class="review_content">
                  <!-- 후기내용 -->
                  <p>친구들이랑 처음 차박 갔는데 사장님이 친절하게 조작법이랑 추천 장소들 알려주셔서 재미있게 즐기고 왔습니다! ㅎㅎ</p>
                </div>
              </div>
              <!-- 고객 후기 3-->
              <div class="customer_review">
                <div class="customer_info">
                  <i class="material-icons">person</i>
                  <!-- 작성자 및 별점 -->
                  <p>카사바 킴 <i class="fas fa-star"></i><span>5.00</span></p>
                </div>
                <div class="review_content">
                  <!-- 후기내용 -->
                  <p>사장님 친철하시고 딜리버리 서비스 강추입니다.</p>
                </div>
              </div>
              <!-- 리뷰에대한 판매자 댓글 x ?  -->
            </div>
          </article>
          <article class="info_right">
            <div class="reserve_notice">
              <p>캠핑카 예약은 최대 1년내 날짜만 가능합니다.</p>
            </div>
            <div class="reserve_box">
              <!-- 가격 -->
              <h3 class="price">95,000원</h3>
              <h4>예약하기</h4>
              <!-- 추가옵션 -->
              <select name="mod_option" style="font-size:1.6rem">
                <option value="불멍세트"><p>1) 불멍세트 대여 <span>20,000원</span></p></option>
                <option value="캠핑세트">2) 간편 캠핑세트 대여 <span>30,000원</span></option>
                <option value="키친캠핑세트">3) 키친 캠핑세트 대여<span>50,000원</span></option>
              </select>

              <!-- 예약 달력 -->
              <div class = "calendar_container"> 
                <div class="calendar_button">
                    <button class = "left_button"> 
                      <i class="fa fa-arrow-left" aria-hidden="true" style="color:#fff"></i> 
                    </button>
                    <button class = "right_button"> 
                        <i class="fa fa-arrow-right" aria-hidden="true" style="color:#fff"></i>
                    </button>
                </div>
                <table class = "calendar">
                    <th class = "calendar_month_title"></th>
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
                        <tr>
                            <td colspan="7">
                                <!-- <button class="reset">
                                    선택 날짜 초기화
                                </button> -->
                                <button class="reserve_button">
                                    바로 예약하기
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                
            </div>
            </div>
            <div class="company_info">
              <span class="material-icons">
                person
              </span>
              <!-- 업체이름 -->
              <h4>위캠프</h4>
              <p>
                호스트 프로필 보기
                <i class="fas fa-arrow-right rz-ml-1"></i>
              </p>
              <a href="#">
                <p class="chatting">채팅하기</p>
              </a>
            </div>
            <div class="company_tel">
              <!-- 업체 연락처 -->
              <h5>대표번호 : 05078716421</h5>
            </div>
          </article>
        </section>

        <!-- 가까운업체 -->
        <article class="nearby">
          <div class="promote_box">
            <h4>가까운 업체</h4>
            <div class="promote_listings">
              <!-- 가까운 업체 1 -->
              <div class="promote_item">
                <div class="promote_img">
                  <!-- 이미지 -->
                  <img src="./images/detail/realtime01-detail/nearby&similar/r1d-nearby01.png" alt="위캠프 이미지">
                  <a href="#">즉시예약기능</a>
                  <i class="far fa-heart"></i>
                </div>
                <div class="promote_item_info">
                  <div class="promote_item_name">
                    <p>
                      <i class="rz--verified fas fa-check-circle"></i>
                      <!-- 상품명 -->
                      캠박x하이포크 키트 이벤트 [위캠프] 2인승 로디 캠핑카</p>
                  </div>
                  <!-- 한줄소개 -->
                  <p class="camping_info_text">강남에서 차박용 레이 캠핑카를 빌리자!</p>
                  <div class="promote_mods">
                    <ul>
                      <li>
                        <!-- 차고지 -->
                        <i class="fas fa-map-marker-alt"></i>
                        <p>차고지 : 대한민국 서울특별시</p>
                      </li>
                      <li>
                        <!-- 라이센스 -->
                        <i class="fas fa-address-card"></i>
                        <p>2종 보통</p>
                      </li>
                      <li>
                        <!-- 동승자 -->
                        <i class="fas fa-user-friends"></i>
                        <p>동승 2명</p>
                      </li>
                      <li>
                        <!-- 취침인원 -->
                        <i class="fas fa-bed"></i>
                        <p>취침 2명</p>
                      </li>
                      <li class="strong">
                        
                      </li>
                    </ul>
                    <div class="promote_mods_price">
                      <i class="far fa-calendar-check"></i>
                      <!-- 가격 -->
                      <p>잊지못할 밤, 130,000원 부터</p>
                    </div>
                  </div>
                  <span class="promote_mods_km">0.01 km 떨어짐</span>
              </div>
              </div>
              <!-- 가까운 업체 2 -->
              <div class="promote_item">
                <div class="promote_img">
                  <!-- 이미지 -->
                  <img src="./images/detail/realtime01-detail/nearby&similar/r1d-nearby02.png" alt="이미지">
                  <a href="#">즉시예약기능</a>
                  <i class="far fa-heart"></i>
                </div>
                <div class="promote_item_info">
                  <div class="promote_item_name">
                    <p>
                      <i class="rz--verified fas fa-check-circle"></i>
                      <!-- 상품명 -->
                      [세이브카] 쏠라티 호텔급 모터홈 캠핑카</p>
                  </div>
                  <!-- 한줄소개 -->
                  <p class="camping_info_text">호캉스 캠핑으로 만들어주는 쏠라티와 떠나보세요</p>
                  <div class="promote_mods">
                    <ul>
                      <li>
                        <!-- 차고지 -->
                        <i class="fas fa-map-marker-alt"></i>
                        <p>차고지 : 대한민국 서울특별시</p>
                      </li>
                      <li>
                        <!-- 라이센스 -->
                        <i class="fas fa-address-card"></i>
                        <p>1종 보통</p>
                      </li>
                      <li>
                        <!-- 동승자 -->
                        <i class="fas fa-user-friends"></i>
                        <p>동승 4명</p>
                      </li>
                      <li>
                        <!-- 취침인원 -->
                        <i class="fas fa-bed"></i>
                        <p>취침 4명</p>
                      </li>
                      <li class="strong">
                        
                      </li>
                    </ul>
                    <div class="promote_mods_price">
                      <i class="far fa-calendar-check"></i>
                      <!-- 가격 -->
                      <p>잊지못할 밤, 380,000원 부터</p>
                    </div>
                  </div>
                  <span class="promote_mods_km">10.96km 떨어짐</span>
              </div>
              </div>
              <!-- 가까운 업체 3 -->
              <div class="promote_item no_mr">
                <div class="promote_img">
                  <!-- 이미지 -->
                  <img src="./images/detail/realtime01-detail/nearby&similar/r1d-nearby03.jpg" alt="이미지">
                  <a href="#">예약문의 가능</a>
                  <i class="far fa-heart"></i>
                </div>
                <div class="promote_item_info">
                  <div class="promote_item_name">
                    <p>
                      <i class="rz--verified fas fa-check-circle"></i>
                      <!-- 상품명 -->
                      [세이브카] 코치맨 크로스트랙 모터홈(애견동반가능)
                    </p>
                  </div>
                  <!-- 한줄소개 -->
                  <p class="camping_info_text">[세이브카] 코치맨 크로스트랙 모터홈(애견동반가능)</p>
                  <div class="promote_mods">
                    <ul>
                      <li>
                        <!-- 차고지 -->
                        <i class="fas fa-map-marker-alt"></i>
                        <p>차고지 : 대한민국 서울특별시</p>
                      </li>
                      <li>
                        <!-- 라이센스 -->
                        <i class="fas fa-address-card"></i>
                        <p>2종 보통</p>
                      </li>
                      <li>
                        <!-- 동승자 -->
                        <i class="fas fa-user-friends"></i>
                        <p>동승 5명</p>
                      </li>
                      <li>
                        <!-- 취침인원 -->
                        <i class="fas fa-bed"></i>
                        <p>취침 5명</p>
                      </li>
                    </ul>
                    <div class="promote_mods_price">
                      <i class="far fa-calendar-check"></i>
                      <!-- 가격 -->
                      <p>잊지못할 밤, 450,000원 부터</p>
                    </div>
                  </div>
                  <span class="promote_mods_km">11.03km 떨어짐</span>
              </div>
              </div>
            </div>
          </div>
        </article>

        <!-- 비슷한 업체 -->
        <article class="similar">
          <div class="promote_box">
            <h4>비슷한 업체</h4>
            <div class="promote_listings">
              <!-- 비슷한 업체 1 -->
              <div class="promote_item">
                <div class="promote_img">
                  <img src="./images/detail/realtime01-detail/nearby&similar/r1d-similar01.jpg" alt="이미지">
                  <a href="#">즉시예약기능</a>
                  <i class="far fa-heart"></i>
                </div>
                <div class="promote_item_info">
                  <div class="promote_item_name">
                    <p>
                      <i class="rz--verified fas fa-check-circle"></i>
                      <!-- 상품명 -->
                      [강남 12시간] 레이캠핑카_프리미엄 3호_ 제로캠핑</p>
                  </div>
                  <!-- 한줄소개 -->
                  <p class="camping_info_text">강남에서 차박용 레이 캠핑카를 빌리자!</p>
                  <div class="promote_mods">
                    <ul>
                      <li>
                        <!-- 차고지 -->
                        <i class="fas fa-map-marker-alt"></i>
                        <p>차고지 : 대한민국 서울특별시</p>
                      </li>
                      <li>
                        <!-- 라이센스 -->
                        <i class="fas fa-address-card"></i>
                        <p>2종 보통</p>
                      </li>
                      <li>
                        <!-- 동승자 -->
                        <i class="fas fa-user-friends"></i>
                        <p>동승 2명</p>
                      </li>
                      <li>
                        <!-- 취침인원 -->
                        <i class="fas fa-bed"></i>
                        <p>취침 2명</p>
                      </li>
                    </ul>
                    <div class="promote_mods_price">
                      <i class="far fa-calendar-check"></i>
                      <!-- 가격 -->
                      <p>잊지못할 밤, 60,000원 부터</p>
                    </div>
                  </div>
              </div>
              </div>
              <!-- 비슷한 업체 2 -->
              <div class="promote_item">
                <div class="promote_img">
                  <!-- 업체 이미지 -->
                  <img src="./images/detail/realtime01-detail/nearby&similar/r1d-similar02.jpg" alt="이미지">
                  <a href="#">즉시예약기능</a>
                  <i class="far fa-heart"></i>
                </div>
                <div class="promote_item_info">
                  <div class="promote_item_name">
                    <p>
                      <i class="rz--verified fas fa-check-circle"></i>
                      <!-- 상품명 -->
                      [강남 12시간] 레이캠핑카_프리미엄 2호_ 제로캠핑</p>
                  </div>
                  <!-- 한줄소개 -->
                  <p class="camping_info_text">강남에서 차박용 레이 캠핑카를 빌리자!</p>
                  <div class="promote_mods">
                    <ul>
                      <li>
                        <!-- 차고지 -->
                        <i class="fas fa-map-marker-alt"></i>
                        <p>차고지 : 대한민국 서울특별시</p>
                      </li>
                      <li>
                        <!-- 라이센스 -->
                        <i class="fas fa-address-card"></i>
                        <p>2종 보통</p>
                      </li>
                      <li>
                        <!-- 동승자 -->
                        <i class="fas fa-user-friends"></i>
                        <p>동승 2명</p>
                      </li>
                      <li>
                        <!-- 취침인원 -->
                        <i class="fas fa-bed"></i>
                        <p>취침 2명</p>
                      </li>
                    </ul>
                    <div class="promote_mods_price">
                      <i class="far fa-calendar-check"></i>
                      <!-- 가격 -->
                      <p>잊지못할 밤, 60,000원 부터</p>
                    </div>
                  </div>
              </div>
              </div>
              <!-- 비슷한 업체 3 -->
              <div class="promote_item no_mr">
                <div class="promote_img">
                  <!-- 이미지 -->
                  <img src="./images/detail/realtime01-detail/nearby&similar/r1d-similar03.jpg" alt="이미지">
                  <a href="#">즉시예약 가능</a>
                  <i class="far fa-heart"></i>
                </div>
                <div class="promote_item_info">
                  <div class="promote_item_name">
                    <p>
                      <i class="rz--verified fas fa-check-circle"></i>
                      <!-- 상품명 -->
                      [강남 12시간] 레이캠핑카_프리미엄 1호_제로캠핑</p>
                  </div>
                  <!-- 한줄소개 -->
                  <p class="camping_info_text">강남에서 차박용 레이 캠핑카를 빌리자!</p>
                  <div class="promote_mods">
                    <ul>
                      <li>
                        <!-- 차고지 주소 -->
                        <i class="fas fa-map-marker-alt"></i>
                        <p>차고지 : 대한민국 서울특별시</p>
                      </li>
                      <li>
                        <!-- 라이센스 -->
                        <i class="fas fa-address-card"></i>
                        <p>2종 보통</p>
                      </li>
                      <li>
                        <!-- 동승자 -->
                        <i class="fas fa-user-friends"></i>
                        <p>동승 2명</p>
                      </li>
                      <li>
                        <!-- 취침인원 -->
                        <i class="fas fa-bed"></i>
                        <p>취침 2명</p>
                      </li>
                      <li class="strong">
                        
                      </li>
                    </ul>
                    <div class="promote_mods_price">
                      <i class="far fa-calendar-check"></i>
                      <!-- 가격 -->
                      <p>잊지못할 밤, 60,000원 부터</p>
                    </div>
                  </div>
              </div>
              </div>
            </div>
          </div>
        </article>
      </section>
    </main>

    <!-- 상단 이미지 클릭시 슬라이드 모달창 -->
    <aside class="aside_slide">
      <div class="img_slider_modal">
        <!-- 슬라이드 이미지 닫기 -->
        <button class="img_slide_cancel"><i class="fas fa-times"></i></button>
        <div class="img_slide_container">
          <!-- 슬라이드 될 이미지 -->
          <img id="slide_image" src="./images/detail/realtime01-detail/realtime01-detail01.jpg" alt="이미지">
          <!-- 슬라이드 버튼 -->
          <div class="slide_button">
            <button id="prev_button">
              <i class="fas fa-arrow-left" aria-hidden="true"></i>
            </button>
            <button id="next_button">
              <i class="fas fa-arrow-right" aria-hidden="true"></i>
            </button>
          </div>
        </div>
        <!-- 이미지 순서 -->
        <p id="image_counter">1 / 11</p>
      </div>
    </aside>


    <!-- 후기 작성 모달창 -->
    <aside class="aside_review">
      <div id="modal">
        <div class="modal-content">
          <div class="review_header">
            <h4>후기 등록하기</h4>
            <h3>
              <!-- 취소 버튼 -->
              <button class="review_cancel"><i class="fas fa-times"></i></button>
            </h3>
          </div>
          
          <form action="#" method="post" >
            <div class="review_container">
              <!-- 후기 별점 -->
              <div class="review_star_score">
                <h5>평점을 매겨주세요</h5>
                <div class="star-rating">
                  <input type="radio" id="5-stars" name="score" value="5" />
                  <label for="5-stars" class="star"><i class="fas fa-star"></i></label>
                  <input type="radio" id="4-stars" name="score" value="4" />
                  <label for="4-stars" class="star"><i class="fas fa-star"></i></label>
                  <input type="radio" id="3-stars" name="score" value="3" />
                  <label for="3-stars" class="star"><i class="fas fa-star"></i></label>
                  <input type="radio" id="2-stars" name="score" value="2" />
                  <label for="2-stars" class="star"><i class="fas fa-star"></i></label>
                  <input type="radio" id="1-star" name="score" value="1" />
                  <label for="1-star" class="star"><i class="fas fa-star"></i></label>
                </div>
              </div>
              <!-- 후기 작성란 -->
              <div class="review_content">
                <h5>후기를 남겨주세요</h5>
                <textarea name="review_content" cols="100" rows="10" ></textarea>
              </div>
              <p><input type="submit" value="후기 등록하기" class="review_reist"></p>
                </div>
              </form>
        </div>
      </div>
    </aside>

    <!-- footer -->
    <footer class="footer">
      <!-- footer include -->
      <jsp:include page="./module/footer.jsp" />
    </footer>

    <!-- 챗봇 -->
    <aside class="chatbot" id="chatbotFloatIcon">
      <!-- chatbot include -->
      <jsp:include page="./module/chatbot.jsp" />
    </aside>
  </body>

<!-- 페이지 JS -->
<!-- 달력 js -->
<script src="./js/detail_calendar.js"></script>
<script src="./js/detail.js"></script>
<script src="./js/load.js"></script>
<script src="./js/common.js"></script>
</html>