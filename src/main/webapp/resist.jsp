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
    <script type="text/javascript" src="./resouce/smarteditor2-2.8.2.3/js/HuskyEZCreator.js" charset="utf-8"></script>
    <!-- 제이쿼리 플러그인 -->
    <script src="./js/jquery-ui.min.js"></script>
    <!-- 기본 코딩 CSS 파일 -->
    <!-- <link rel="stylesheet" href="./css/common.css"> -->
    <!-- 페이지 CSS -->
    <link rel="stylesheet" href="./css/reset.css" />
    <link rel="stylesheet" href="./css/font.css" />
    <link rel="stylesheet" href="./css/resist.css" />
    <link rel="stylesheet" href="./css/chatbot.css">
</head>
<body>
    <div id="wrapper">
        <!-- 왼쪽 gnb -->
        <aside>
            <nav>
                <div class="gnb">
                    <article><a href="./index.jsp"><img src="./images/resist/logo.png" alt="로고" /></a></article>
                    <ul>
                        <li>
                            일반
                            <img src="./images/resist/check.png" alt="" class="image" />
                        </li>
                        <li>등록</li>
                        <li>완료</li>
                    </ul>
                </div>
            </nav>
        </aside>
        <!-- 오른쪽 gnb -->
        <div class="right">
            <section class="header">
                <article><img src="./images/resist/container_car.png" alt="자동차아이콘" /></article>
                <h1>새로운 캠핑카 등록</h1>
                <p><a href="./index.jsp">Exit</a></p>
            </section>
            <!-- 등록 form -->
            <div id="container">
                <div class="form_part w700">
                    <!-- 현재 DB연결 안돼 있어서 method가 get인 상태 추후 post로 수정  -->
                    <!-- 이미지 데이터로 넘길 때 enctype 추가해야 함 -->
                    <form action="AddCampingcarCtrl" method="post" enctype="multipart/form-data" onsubmit="confirm('등록하시겠습니까?');">
                        <h2>일반</h2>
                        <p>카테고리 구분</p>
                        <button type="button" class="button">캠핑카</button>
                        <div>
                            <p>등록상품명<span class="required_check"></span></p>
                            <input type="text" name="campingcar_name" autofocus required class="text_input" placeholder="입력하세요">
                        </div>
                        <div>
                            <p>한줄소개<span class="required_check"></span></p>
                            <input type="text" name="campingcar_infos"  autofocus required class="text_input" placeholder="한줄소개를 입력해주세요">
                        </div>
                        <div>
                            <p>전화번호<span class="required_check"></span></p>
                            <input type="tel" name="campingcar_tel" autofocus required class="text_input" placeholder="한줄소개를 입력해주세요">
                        </div>
                        <div>
                            <p>업체 주소<span class="required_check"></span></p>
                            <p class="second_title">주소</p>
                            <input type="tel" name="campingcar_address" autofocus required class="text_input" placeholder="주소를 입력해주세요">
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
                        <p>운전자 면허종류<span class="required_check"></span></p>
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
                            <p>주중요금&nbsp;(1박당)<span class="required_check"></span></p>
                            <p>주말 및 공휴일 요금&nbsp;(1박당)</p>
                        </div>
                        <div class="price">
                            <input type="number" name="campingcar_wd_fare" class="text_input" required>
                            <input type="number" name="campingcar_ph_fare" class="text_input no_mr">
                        </div>
                        <p>상세페이지</p>
                        <textarea name="campingcar_detail" id="ir1" rows="10" cols="100" style="width:100%; height:412px;"></textarea>

                        <!-- 하단 진행바 -->
                        <footer class="footer">
                            <div class="pogress_container">
                                <div class="pogress_bar" id="progressBar"></div>
                            </div>
                            <div class="btn_area">
                                <span class="back" onclick="history.back(-1);"> <i class="fa fa-arrow-left" aria-hidden="true"></i>뒤로가기 </span>
                                <div class="forward"><input type="submit" value="등록하기" id="ir1"><i class="fa fa-arrow-right" aria-hidden="true"></i></div>
                            </div>
                        </footer>
                    </form>
                </div>
            </div>
        </div>
        <!-- 챗봇 -->
        <aside class="chatbot" id="chatbotFloatIcon">
        <!-- chatbot include -->
        </aside>
    </div>
</body>
<!-- 페이지 JS -->
<script src="./js/resist.js"></script>
<script src="./js/common.js"></script>
			
<script type="text/javascript">
var oEditors = [];

// 추가 글꼴 목록
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "./resouce/smarteditor2-2.8.2.3/SmartEditor2Skin.html",	
	htParams : {
		bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : false,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
		//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
		fOnBeforeUnload : function(){
			//alert("완료!");
		}
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
});

function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["ir1"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["ir1"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '궁서';
	var nFontSize = 24;
	oEditors.getById["campingcar_detail"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>
</html>
    