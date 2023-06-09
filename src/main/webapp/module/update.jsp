<%@page import="biz.campingcar.CampingcarVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   // 인코딩 설정
   request.setCharacterEncoding("UTF-8");
   response.setContentType("text/html; charset=UTF-8");

   String context = request.getContextPath();
   
   // 값 받아오기
   CampingcarVO vo = (CampingcarVO) request.getAttribute("vo");
   int no = vo.getCampingcar_no();
%>
<c:set var="i" value="<%= vo %>"></c:set>


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
    <script src="./js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="./resouce/smarteditor2-2.8.2.3/js/HuskyEZCreator.js" charset="utf-8"></script>
    
    <!-- 기본 코딩 CSS 파일 -->
    <!-- <link rel="stylesheet" href="./css/common.css"> -->
    <!-- 페이지 CSS -->
    <link rel="stylesheet" href="./css/reset.css" />
    <link rel="stylesheet" href="./css/font.css" />
    <link rel="stylesheet" href="./css/update.css" />
</head>
<body>
<!--     <button>수정하기</button> -->
    <div class="update_modal">
        <div class="update_modal_content">
            <div class="update_modal_content_title">
                <h1>수정하기</h1>
            </div>
            <div class="update_modal_content_thumb">
                <!-- 등록페이지에서 업로드한 썸네일 이미지로 src수정해야 함 -->
                <%
                if(vo.getCampingcar_img() != null) {
                   %>                   
                   <img src="<%= context %>/images/detail/<%=vo.getCampingcar_imgFolder() %>/<%=vo.getCampingcar_img()[0] %>" alt="썸네일이미지"><p>${i.campingcar_name }</p>
                   <%
                } else {
                    %>                   
                    <img src="<%= context %>/images/detail/null.png" alt="썸네일이미지"><p>${i.campingcar_name }</p>
                    <%
                }
                %>
            </div>
            <!-- 등록 form -->
            <div id="container">
                <div class="form_part">
                    <!-- 현재 DB연결 안돼 있어서 method가 get인 상태 추후 post로 수정  -->
                    <!-- 이미지 데이터로 넘길 때 enctype 추가해야 함 -->
                    <!-- action 주소값 수정 ctrl로 수정 -->
                    <form action="UpdateCampingcarCtrl" method="post" enctype="multipart/form-data">
                      <div class="form_wrap">
                           <input type="hidden" value="${i.campingcar_no }" name="campingcar_no">
                           <h2>일반</h2>
                           <p>카테고리 구분</p>
                           <button type="button" class="checked_button">캠핑카</button>
                           <div>
                               <p>등록상품명</p>
                               <!-- value값에 기존 적었던 값 추가해야 함(db연동 후 추가해주세요) -->
                               <input type="text" name="campingcar_name" autofocus required class="text_input" value="${i.campingcar_name }">
                           </div>
                           <div>
                               <p>한줄소개</p>
                               <input type="text" name="campingcar_infos" autofocus required class="text_input" value="${i.campingcar_infos }">
                           </div>
                           <div>
                               <p>전화번호</p>
                               <input type="tel" name="campingcar_tel" autofocus required class="text_input" value="${i.campingcar_tel }">
                           </div>
                           <div>
                               <p>업체 주소</p>
                               <p class="second_title">주소</p>
                               <input type="text" name="campingcar_address" autofocus required class="text_input" value="${i.campingcar_address }">
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
                               <input type="file" id="input-file" multiple class="upload-hidden" />
                               <div id="thumb_img">
                              		<%
                              			if(vo.getCampingcar_img() != null) {
                              				for(String img : vo.getCampingcar_img()) {
                              					%>
                              					<div style="display: inline-flex; padding: 10px;">
		                                            <li><img src="<%= context %>/images/detail/<%=vo.getCampingcar_imgFolder() %>/<%=img %>"></li>
		                                        </div>
                              					<%
                              				}
                              			}
                              		%>
                               </div>
                           </div>
           
                           <!-- 썸네일 업로드 이미지 미리보기 모달창 -->
                           <div class="modal">
                               <div class="modal_content"></div>
                           </div>
           
                           <span class="upload_notice">최대 업로드 사이즈: 256MB. 파일을 첨부하세요</span> <br />
                           <span class="upload_notice"><strong>Note: </strong>First image select for listing will be featured image of this listing</span>
           
                           <p class="basic_option">기본 보유시설</p>
                           <div class="check_flx">
                             <%
                             String op = "";
                              for(int i = 0; i < vo.getCampingcar_option().length; i++) {
                                  op += vo.getCampingcar_option()[i] + ", ";
                              }
                              %>
                               <div class="check">
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="TV" <%= (op.contains("TV"))? "checked" : "" %>>
                                       <span></span>
                                       TV
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="가스레인지"<%= (op.contains("가스레인지"))? "checked" : "" %>>
                                       <span></span>
                                       가스레인지
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="냉장고" <%= (op.contains("냉장고"))? "checked" : "" %>>
                                       <span></span>
                                       냉장고
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="루프박스" <%= (op.contains("루프박스"))? "checked" : "" %>>
                                       <span></span>
                                       루프박스
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="무시동 히터" <%= (op.contains("무시동 히터"))? "checked" : "" %>>
                                       <span></span>
                                       무시동 히터
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="물탱크" <%= (op.contains("물탱크"))? "checked" : "" %>>
                                       <span></span>
                                       물탱크
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="바닥난방" <%= (op.contains("바닥난방"))? "checked" : "" %>>
                                       <span></span>
                                       바닥난방
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="방충망" <%= (op.contains("방충망"))? "checked" : "" %>>
                                       <span></span>
                                       방충망
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="배기시설" <%= (op.contains("배기시설"))? "checked" : "" %>>
                                       <span></span>
                                       배기시설
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="블랙박스" <%= (op.contains("블랙박스"))? "checked" : "" %>>
                                       <span></span>
                                       블랙박스
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="블루투스 스피커" <%= (op.contains("블루투스 스피커"))? "checked" : "" %>>
                                       <span></span>
                                       블루투스 스피커
                                   </label>
                               </div>
                               <div class="check">
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="싱크대" <%= (op.contains("싱크대"))? "checked" : "" %>>
                                       <span></span>
                                       싱크대
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="암막커튼" <%= (op.contains("암막커튼"))? "checked" : "" %>>
                                       <span></span>
                                       암막커튼
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="에어컨" <%= (op.contains("에어컨"))? "checked" : "" %>>
                                       <span></span>
                                       에어컨
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="오수탱크" <%= (op.contains("오수탱크"))? "checked" : "" %>>
                                       <span></span>
                                       오수탱크
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="온수기" <%= (op.contains("온수기"))? "checked" : "" %>>
                                       <span></span>
                                       온수기
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="외부샤워기" <%= (op.contains("외부샤워기"))? "checked" : "" %>>
                                       <span></span>
                                       외부샤워기
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="유아용 카시트" <%= (op.contains("유아용 카시트"))? "checked" : "" %>>
                                       <span></span>
                                       유아용 카시트
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="유압식테이블" <%= (op.contains("유압식테이블"))? "checked" : "" %>>
                                       <span></span>
                                       유압식테이블
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="인덕션" <%= (op.contains("인덕션"))? "checked" : "" %>>
                                       <span></span>
                                       인덕션
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="전기레인지" <%= (op.contains("전기레인지"))? "checked" : "" %>>
                                       <span></span>
                                       전기레인지
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="전기콘셉트" <%= (op.contains("전기콘셉트"))? "checked" : "" %>>
                                       <span></span>
                                       전기콘셉트
                                   </label>
                               </div>
                               <div class="check">
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="충전식배터리" <%= (op.contains("충전식배터리"))? "checked" : "" %>>
                                       <span></span>
                                       충전식배터리
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="화장실" <%= (op.contains("화장실"))? "checked" : "" %>>
                                       <span></span>
                                       화장실
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="후방 카메라" <%= (op.contains("후방 카메라"))? "checked" : "" %>>
                                       <span></span>
                                       후방 카메라
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="테이블" <%= (op.contains("테이블"))? "checked" : "" %>>
                                       <span></span>
                                       테이블
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="팝업루프" <%= (op.contains("팝업루프"))? "checked" : "" %>>
                                       <span></span>
                                       팝업루프
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="평탄화 키트" <%= (op.contains("평탄화 키트"))? "checked" : "" %>>
                                       <span></span>
                                       평탄화 키트
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="샤워실" <%= (op.contains("샤워실"))? "checked" : "" %>>
                                       <span></span>
                                       샤워실
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="수면용품" <%= (op.contains("수면용품"))? "checked" : "" %>>
                                       <span></span>
                                       수면용품
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="스카이창" <%= (op.contains("스카이창"))? "checked" : "" %>>
                                       <span></span>
                                       스카이창
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="침대" <%= (op.contains("침대"))? "checked" : "" %>>
                                       <span></span>
                                       침대
                                   </label>
                                   <label>
                                       <input type="checkbox" name="campingcar_option" value="사이드어닝"<%= (op.contains("사이드어닝"))? "checked" : "" %>><span></span>
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
                                           <input type="text" class="inp" value="${i.campingcar_rider } 명" name="campingcar_rider" />
                                           <button type="button" class="plus">+</button>
                                       </div>
                                   </td>
                                   <td>
                                       <div class="count-wrap _count">
                                           <button type="button" class="minus">-</button>
                                           <input type="text" class="inp" value="${i.campingcar_sleeper }명" name="campingcar_sleeper" />
                                           <button type="button" class="plus">+</button>
                                       </div>
                                   </td>
                               </tr>
                           </table>
                           <div>
                               <p>대여일 출고시간</p>
                               <input type="text" name="campingcar_release_time" class="text_input" placeholder="예: 09:00" value="${i.campingcar_release_time }"/>
                               <p>반납일 반납시간</p>
                               <input type="text" name="campingcar_return_time" class="text_input" placeholder="예: 16:00" value="${i.campingcar_return_time }"/>
                           </div>
                           <!-- 운전면허종류 선택영역 -->
                           <%
                           String li = vo.getCampingcar_license();
                           %>
                           <p>운전자 면허종류</p>
                           <div class="select_box">
                               <select name="campingcar_license" style="font-family: 'Noto Sans KR'" required>
                                   <option value="">선택</option>
                                   <option value="1종 대형" <%= (li.equals("1종 대형"))? "selected" : "" %>>1종 대형</option>
                                   <option value="1종 보통" <%= (li.equals("1종 보통"))? "selected" : "" %>>1종 보통</option>
                                   <option value="2종 보통" <%= (li.equals("2종 대형"))? "selected" : "" %>>2종 보통</option>
                                   <option value="소형 견인차" <%= (li.equals("소형 견인차"))? "selected" : "" %>>소형 견인차</option>
                               </select>
                           </div>
                           <h2>요금</h2>
                           <div class="price">
                               <p>주중요금&nbsp;(1박당)</p>
                               <p>주말 및 공휴일 요금&nbsp;(1박당)</p>
                           </div>
                           <div class="price">
                               <input type="number" name="campingcar_wd_fare" class="text_input" value="${i.campingcar_wd_fare }" required>
                               <input type="number" name="campingcar_ph_fare" class="text_input no_mr" value="${i.campingcar_ph_fare }">
                           </div>
                        <p>상세페이지</p>
                        <textarea name="campingcar_detail" id="ir1" rows="10" cols="100" style="width:100%; height:412px;"><%= vo.getCampingcar_detail() %></textarea>
                        </div>
                        <div class="line"></div>
                        <input type="hidden" value="<%= vo.getCampingcar_imgFolder()%>" name="campingcar_imgFolder">
                        <input type="submit" value="변경사항 저장" class="update_btn">
                   </form>
                  </div>
            </div>
        </div>
    </div>
</body>
<!-- 페이지 JS -->
<script src="./js/update.js"></script>
<script type="text/javascript">
const formData = document.querySelector("form");
formData.addEventListener("submit", (e) => {
    e.preventDefault();
    submitContents(formData);
});

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

function pasteHTML(sHTML) {
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
		elClickedObj.submit();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '궁서';
	var nFontSize = 24;
	oEditors.getById["campingcar_detail"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>
</html>
    