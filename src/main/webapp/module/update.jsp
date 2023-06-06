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
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/> -->
    <!-- 폰트어썸 5 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <!-- 폰트어썸 4.7 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <!-- 머티리얼 아이콘 -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <!-- 팝이콘 -->
    <link rel="shortcut icon" href="./images/favicon/fav32.png" />
    <link rel="apple-touch-icon=precomposed" href="./images/favicon/fav180.png" />
    <!-- 기본 코딩 JS 파일 -->
    <script src="./js/jquery-1.12.4.min.js"></script>
    <script src="./js/jquery-3.3.1.min.js"></script>
    <script src="./js/jquery-3.4.1.min.js"></script>
    <script src="./js/prefixfree.min.js"></script>
    <!-- 제이쿼리 플러그인 -->
    <script src="./js/jquery-ui.min.js"></script>
    <!-- 기본 코딩 CSS 파일 -->
    <!-- <link rel="stylesheet" href="./css/common.css"> -->
    <!-- 페이지 CSS -->
    <!-- <link rel="stylesheet" href="./css/reset.css" /> -->
    <link rel="stylesheet" href="./css/font.css" />
    <link rel="stylesheet" href="./css/update.css" />
</head>
<body>
    <button>수정하기</button>
    <div class="update_modal">
        <div class="update_modal_content">
            <div class="update_modal_content_title">
                <h1>수정하기</h1>
                <p class="update_close"><i class="fa fa-times" aria-hidden="true"></i></p>
            </div>
            <div class="update_modal_content_thumb">
                <!-- 등록페이지에서 업로드한 썸네일 이미지로 src수정해야 함 -->
                <img src="https://via.placeholder.com/46x46" alt="썸네일이미지"><span>캠핑카 이름(DB로 수정)</span>
            </div>
            <!-- 등록 form -->
            <div id="container">
                <div class="form_part">
                    <!-- 현재 DB연결 안돼 있어서 method가 get인 상태 추후 post로 수정  -->
                    <!-- 이미지 데이터로 넘길 때 enctype 추가해야 함 -->
                    <!-- action 주소값 수정 ctrl로 수정 -->
                    <form action="UpdateCampingcarCtrl" method="get" enctype="multipart/form-data">
                        <h2>일반</h2>
                        <p>카테고리 구분</p>
                        <button type="button" class="checked_button">캠핑카</button>
                        <div>
                            <p>등록상품명</p>
                            <!-- value값에 기존 적었던 값 추가해야 함(db연동 후 추가해주세요) -->
                            <input type="text" name="campingcar_name" autofocus required class="text_input">
                        </div>
                        <div>
                            <p>한줄소개</p>
                            <input type="text" name="campingcar_infos" autofocus required class="text_input">
                        </div>
                        <div>
                            <p>전화번호</p>
                            <input type="tel" name="campingcar_tel" autofocus required class="text_input">
                        </div>
                        <div>
                            <p>업체 주소</p>
                            <p class="second_title">주소</p>
                            <input type="tel" name="campingcar_address" autofocus required class="text_input">
                            <iframe
                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3158.7197128313333!2d127.05830572695311!3d37.65579310000003!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357cb941d9c739c5%3A0x8ecd52574c78556d!2z7J207KCg7JWE7Lm0642w66-47Lu07ZOo7YSw7ZWZ7JuQIOuFuOybkOy6oO2NvOyKpA!5e0!3m2!1sko!2skr!4v1685597135366!5m2!1sko!2skr"
                                width="700"
                                height="350"
                                allowfullscreen=""
                                loading="lazy"
                                referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                        <div>
                            <p>지역</p>
                            <button type="button" class="button">강원</button>
                            <button type="button" class="button">경기/인천</button>
                            <button type="button" class="button">광주/전라</button>
                            <button type="button" class="button">대구/울산/경북</button>
                            <button type="button" class="button">대전/충청</button>
                            <button type="button" class="button">부산/경남</button>
                            <button type="button" class="button">서울</button>
                            <button type="button" class="button mb_btn">제주</button>
                        </div>
                        <p>사진</p>
                        <div class="filebox preview-image">
                            <label for="input-file" class="upload">업로드&nbsp;&nbsp;<i class="fa fa-arrow-up" aria-hidden="true"></i></label>
                            <input type="file" id="input-file" class="upload-hidden" />
                        </div>
        
                        <!-- 썸네일 업로드 이미지 미리보기 모달창 -->
                        <div class="modal">
                            <div class="modal_content"></div>
                        </div>
        
                        <span class="upload_notice">최대 업로드 사이즈: 256MB. 파일을 첨부하세요</span> <br />
                        <span class="upload_notice"><strong>Note: </strong>First image select for listing will be featured image of this listing</span>
        
                        <p class="basic_option">기본 보유시설</p>
                        <div class="check_flx">
                            <div class="check">
                                <label>
                                    <input type="checkbox" name="campingcar_option" value="TV" />
                                    <span></span>
                                    TV
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" value="가스레인지" />
                                    <span></span>
                                    가스레인지
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" value="냉장고" />
                                    <span></span>
                                    냉장고
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" value="루프박스" />
                                    <span></span>
                                    루프박스
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" value="무시동 히터" />
                                    <span></span>
                                    무시동 히터
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" value="물탱크" />
                                    <span></span>
                                    물탱크
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" value="바닥난방" />
                                    <span></span>
                                    바닥난방
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" value="방충망" />
                                    <span></span>
                                    방충망
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" value="배기시설" />
                                    <span></span>
                                    배기시설
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" value="블랙박스" />
                                    <span></span>
                                    블랙박스
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" value="블루투스 스피커" />
                                    <span></span>
                                    블루투스 스피커
                                </label>
                            </div>
                            <div class="check">
                                <label>
                                    <input type="checkbox" name="campingcar_option" />
                                    <span></span>
                                    싱크대
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" />
                                    <span></span>
                                    암막커튼
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" />
                                    <span></span>
                                    에어컨
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" />
                                    <span></span>
                                    오수탱크
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" />
                                    <span></span>
                                    온수기
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" />
                                    <span></span>
                                    외부샤워기
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" />
                                    <span></span>
                                    유아용 카시트
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" />
                                    <span></span>
                                    유압식테이블
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" />
                                    <span></span>
                                    인덕션
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" />
                                    <span></span>
                                    전기레인지
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" />
                                    <span></span>
                                    전기콘셉트
                                </label>
                            </div>
                            <div class="check">
                                <label>
                                    <input type="checkbox" name="campingcar_option" />
                                    <span></span>
                                    충전식배터리
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" />
                                    <span></span>
                                    화장실
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" />
                                    <span></span>
                                    후방 카메라
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" />
                                    <span></span>
                                    테이블
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" />
                                    <span></span>
                                    팝업루프
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" />
                                    <span></span>
                                    평탄화 키트
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" />
                                    <span></span>
                                    샤워실
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" />
                                    <span></span>
                                    수면용품
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" />
                                    <span></span>
                                    스카이창
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" />
                                    <span></span>
                                    침대
                                </label>
                                <label>
                                    <input type="checkbox" name="campingcar_option" /><span></span>
                                    사이드어닝
                                </label>
                            </div>
                        </div>
                        <!-- 인원 선택 영역 -->
                        <table class="rider">
                            <tr>
                                <td class="person">동승가능인원</td>
                                <td class="person">취침가능인원</td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="count-wrap _count">
                                        <button type="button" class="minus">-</button>
                                        <input type="text" class="inp" value="1명" name="campingcar_rider" />
                                        <button type="button" class="plus">+</button>
                                    </div>
                                </td>
                                <td>
                                    <div class="count-wrap _count">
                                        <button type="button" class="minus">-</button>
                                        <input type="text" class="inp" value="1명" name="campingcar_sleeper" />
                                        <button type="button" class="plus">+</button>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <div>
                            <p>대여일 출고시간</p>
                            <input type="text" name="campingcar_release_time" class="text_input" placeholder="예: 09:00" />
                            <p>반납일 반납시간</p>
                            <input type="text" name="campingcar_return_time" class="text_input" placeholder="예: 16:00" />
                        </div>
                        <!-- 운전면허종류 선택영역 -->
                        <p>운전자 면허종류</p>
                        <div class="select_box">
                            <select name="campingcar_license" style="font-family: 'Noto Sans KR'" required>
                                <option value="">선택</option>
                                <option value="1종 대형">1종 대형</option>
                                <option value="1종 보통">1종 보통</option>
                                <option value="2종 보통">2종 보통</option>
                                <option value="소형 견인차">소형 견인차</option>
                            </select>
                        </div>
                        <h2>요금</h2>
                        <div class="price">
                            <p>주중요금&nbsp;(1박당)</p>
                            <p>주말 및 공휴일 요금&nbsp;(1박당)</p>
                        </div>
                        <div class="price">
                            <input type="number" name="campingcar_wd_fare" class="text_input" required>
                            <input type="number" name="campingcar_ph_fare" class="text_input no_mr">
                        </div>
                        <p>상세페이지</p>
                        <div class="detail_filebox detail_preview_images detail_img_upload">
                            <label for="detail_input_file" class="upload">업로드&nbsp;&nbsp;<i class="fa fa-arrow-up" aria-hidden="true"></i></label>
                            <input type="file" id="detail_input_file" class="detail_upload_hidden" name="campingcar_detail"/>
                        </div>
                        </div>
                    <div class="update_btn_area">
                        <input type="submit" value="변경사항 저장" class="update_btn">
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
<!-- 페이지 JS -->
<script src="./js/update.js"></script>
</html>
    