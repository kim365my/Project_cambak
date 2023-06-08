<%@page import="biz.review.ReviewVO"%>
<%@page import="biz.campingcar.CampingcarVO"%>
<%@page import="biz.campingcar.CampingcarViewVO"%>
<%@page import="biz.user.UserVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="biz.user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//인코딩 설정
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String user_id = (String) session.getAttribute("user_id");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test Page</title>
</head>
<body>
	<header>
		<h1>Test Page</h1>
		<nav>
			<ul class="gnb">
				<c:choose>
					<c:when test="<%= user_id == null %>">						
						<li><a href="#login">로그인</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="LogoutCtrl">로그아웃</a></li>					
					</c:otherwise>
				</c:choose>
				<li><a href="#dashBoard">리뷰페이지</a></li>
				<li><a href="#campingcar">캠핑카페이지</a></li>
				<li><a href="#addreview">리뷰 등록</a></li>
				<li><a href="#dashBoard">대시보드 페이지</a></li>
			</ul>
		</nav>
	</header>
	<main>
		<section id="login">
			<div class="pavel-body">
				<h2>로그인 페이지</h2>
				<form action="LoginCtrl" method="post">
					아이디 : <input type="text" name="user_id" id="user_id"> <br><br>
					비밀번호 : <input type="password" name="user_pw" id="user_pw"> <br>
					<br>
					<input type="submit" value="제출">
				</form>
			</div>
		</section>
		<section>
			<h2>회원가입 페이지</h2>
			<form action="JoinCtrl" method="post">
	            <table class="table table-bordered">
	               <tr>
	                  <th>아이디</th>
	                  <td>
	                     <input type="text" name="user_id" id="user_id" class="form-control">
	                  </td>
	               </tr>
	               <tr>
	                  <th>비밀번호</th>
	                  <td>
	                     <input type="password" name="user_pw" id="user_pw" class="form-control">
	                  </td>
	               </tr>
	               <tr>
	                  <th>비밀번호 확인</th>
	                  <td>
	                     <input type="password" name="pw2" id="pw2" class="form-control">
	                  </td>
	               </tr>
	               <tr>
	                  <th>이메일</th>
	                  <td>
	                     <input type="email" name="user_email" id="user_email" class="form-control">
	                  </td>
	               </tr>
	               <tr>
	                  <th>전화번호</th>
	                  <td>
	                     <input type="tel" name="user_tel" id="user_tel" class="form-control">
	                  </td>
	               </tr>
	               <tr>
	                  <td colspan="2">
	                     <input type="submit" value="회원가입" class="btn btn-primary">
	                     <input type="reset" value="취소" class="btn btn-secondary">
	                  </td>
	               </tr>
	            </table>
			</form>
		</section>
		
		<section>
			<h2>회원 데이터 수정 페이지</h2>
			<form action="UpdateUserCtrl" method="post">
	            <table class="table table-bordered">
	               <tr>
	                  <th>아이디</th>
	                  <td>
	                     <input type="text" name="user_id" value="<%= user_id %>" class="form-control" readonly="readonly">
	                  </td>
	               </tr>
	               <tr>
	                  <th>비밀번호</th>
	                  <td>
	                     <input type="password" name="user_pw" id="user_pw" class="form-control">
	                  </td>
	               </tr>
	               <tr>
	                  <th>이메일</th>
	                  <td>
	                     <input type="email" name="user_email" id="user_email" class="form-control">
	                  </td>
	               </tr>
	               <tr>
	                  <th>전화번호</th>
	                  <td>
	                     <input type="tel" name="user_tel" id="user_tel" class="form-control">
	                  </td>
	               </tr>
	               <tr>
	                  <td colspan="2">
	                     <input type="submit" value="회원가입" class="btn btn-primary">
	                     <input type="reset" value="취소" class="btn btn-secondary">
	                  </td>
	               </tr>
	            </table>
			</form>
		</section>
		
		<section>
			<h2><a href="GetAllUserList">회원가입정보 불러오기</a></h2>
			<%
			ArrayList<UserVO> userList = (ArrayList<UserVO>) request.getAttribute("userList");
			%>
			<table border="1">
				<c:choose>
					<c:when test="<%= userList == null %>">
						<tr>
							<td>데이터가 없어요</td>
						</tr>	
					</c:when>
					<c:otherwise>
						<tr>
							<td>아이디</td>
							<td>비밀번호</td>
							<td>전화번호</td>
							<td>이메일</td>
						</tr>
						<c:forEach var="list" items="<%= userList %>">
							<tr>
								<td>${list.user_id }</td>
								<td>${list.user_pw }</td>
								<td>${list.user_tel }</td>
								<td>${list.user_email }</td>
								<td><a href="DeleteUserCtrl?user_id=${list.user_id }">회원탈퇴</a></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
		</section>
		
		<section id="addCampingcar">
			<h2>캠핑카 추가페이지</h2>
			<form action="AddCampingcarCtrl" method="post">
			  <table class="table table-bordered">
			     <tr>
			        <th>캠핑카 이름</th>
			        <td>
			           <input type="text" name="campingcar_name" class="form-control">
			        </td>
			     </tr>
			     <tr>
			        <th>캠핑카 정보</th>
			        <td>
			           <input type="text" name="campingcar_infos" class="form-control">
			        </td>
			     </tr>
			     <tr>
			        <th>전화번호</th>
			        <td>
			           <input type="tel" name="campingcar_tel" class="form-control">
			        </td>
			     </tr>
			     <tr>
			        <th>주소</th>
			        <td>
			           <input type="text" name="campingcar_address" class="form-control">
			        </td>
			     </tr>
			     <tr>
			        <th>웹사이트</th>
			        <td>
			           <input type="text" name="campingcar_website"  class="form-control">
			        </td>
			     </tr>
			     <tr>
			        <th>이미지</th>
			        <td>
			           <input type="text" name="campingcar_img" class="form-control" >
			        </td>
			     </tr>
			     <tr>
			        <th>옵션선택</th>
			        <td>
	                  <label>
	                      <input type="checkbox" name="campingcar_option" value="옵션1">옵션1
	                  </label>
	                  <label>
	                      <input type="checkbox" name="campingcar_option" value="옵션2">옵션2
	                  </label>
	                  <label>
	                      <input type="checkbox" name="campingcar_option" value="옵션3">옵션3
	                  </label>
	                  <label>
	                      <input type="checkbox" name="campingcar_option" value="옵션4">옵션4
	                  </label>
	                  <label>
	                      <input type="checkbox" name="campingcar_option" value="옵션5">옵션5
	                  </label>
	                  <label>
	                      <input type="checkbox" name="campingcar_option" value="옵션6">옵션6
	                  </label>
	                  <label>
	                      <input type="checkbox" name="campingcar_option" value="옵션7">옵션7
	                  </label>
	                  <label>
	                      <input type="checkbox" name="campingcar_option" value="옵션8">옵션8
	                  </label>
	                  <label>
	                      <input type="checkbox" name="campingcar_option" value="옵션9">옵션9
	                  </label>
			        </td>
			     </tr>
			     <tr>
			        <th>동승인원</th>
			        <td>
	                  <select name="campingcar_rider">
	                      <option value="1">1명</option>
	                      <option value="2">2명</option>
	                      <option value="3">3명</option>
	                      <option value="4">4명</option>
	                  </select>
			        </td>
			     </tr>
			     <tr>
			        <th>취침인원</th>
			        <td>
	                  <select name="campingcar_sleeper">
	                      <option value="1">1명</option>
	                      <option value="2">2명</option>
	                      <option value="3">3명</option>
	                      <option value="4">4명</option>
	                  </select>
			        </td>
			     </tr>
			     <tr>
			        <th>캠핑카 출고 시간</th>
			        <td>
			           <input type="text" name="campingcar_release_time" class="form-control" value="15:00">
			        </td>
			     </tr>
			     <tr>
			        <th>캠핑카 반납 시간</th>
			        <td>
			           <input type="text" name="campingcar_return_time" class="form-control" value="12:00" >
			        </td>
			     </tr>
			     <tr>
			        <th>면허 종류</th>
			        <td>
			           <input type="text" name="campingcar_license" class="form-control" >
			        </td>
			     </tr>
			     <tr>
			        <th>주중 요금</th>
			        <td>
			           <input type="text" name="campingcar_wd_fare" class="form-control" >
			        </td>
			     </tr>
			     <tr>
			        <th>주말 요금</th>
			        <td>
			           <input type="text" name="campingcar_ph_fare" class="form-control" >
			        </td>
			     </tr>
		          <tr>
		              <th>상세 정보</th>
		              <td>
		                  <textarea name="campingcar_detail" cols="20" rows="10" class="form-control"></textarea>
		              </td>
		          </tr>
			     <tr>
			        <td colspan="2">
			           <input type="submit" value="회원가입" class="btn btn-primary">
			           <input type="reset" value="취소" class="btn btn-secondary">
			        </td>
			     </tr>
			  </table>
			</form>
		</section>
		
		<section id="dashBoard">
			<h2><a href="GetCampingcarListCtrl">캠핑카 모든 데이터 불러오기</a></h2>
			<%
			ArrayList<CampingcarVO> campingcarList = (ArrayList<CampingcarVO>) request.getAttribute("campingcarList");
			%>
			<table>
				<c:choose>
					<c:when test="<%= campingcarList == null %>">
						<tr>
							<td>데이터가 없어요</td>
						</tr>	
					</c:when>
					<c:otherwise>
						<tr>
							<td>번호</td>
							<td>상품명</td>
							<td>정보</td>
							<td>전화번호</td>
							<td>주소</td>
							<td>웹사이트</td>
							<td>이미지 주소</td>
							<td>옵션</td>
							<td>탑승인원</td>
							<td>취침가능인원</td>
							<td>대여일 대여시간</td>
							<td>반납일 반납시간</td>
							<td>면허증 종류</td>
							<td>주중요금</td>
							<td>휴일요금</td>
							<td>상세설명 파일 주소</td>
							<td>작성한 유저명</td>
							<td>조회수</td>
							<td>생성일</td>
						</tr>
						<c:forEach var="vo" items="<%=  campingcarList%>">
							<tr>
								<td>${vo.campingcar_no }</td>
								<td>${vo.campingcar_name }</td>
								<td>${vo.campingcar_infos }</td>
								<td>${vo.campingcar_tel }</td>
								<td>${vo.campingcar_address }</td>
								<td>${vo.campingcar_website }</td>
								<td>${vo.campingcar_img }</td>
								<td>
									<c:forEach var="op" items="${vo.campingcar_option }">								
										${op } 
									</c:forEach>
								</td>
								<td>${vo.campingcar_rider }</td>
								<td>${vo.campingcar_sleeper }</td>
								<td>${vo.campingcar_release_time }</td>
								<td>${vo.campingcar_return_time }</td>
								<td>${vo.campingcar_license }</td>
								<td>${vo.campingcar_wd_fare }</td>
								<td>${vo.campingcar_ph_fare }</td>
								<td>${vo.campingcar_detail }</td>
								<td>${vo.user_id }</td>
								<td>${vo.campingcar_cnt }</td>
								<td>${vo.campingcar_regdate }</td>
								<td><a href="upCampingcar.jsp?campingcar_no=${vo.campingcar_no }">수정</a></td>
								<td><a href="DeleteCampingcarCtrl?campingcar_no=${vo.campingcar_no }">삭제</a></td>
							</tr>						
						</c:forEach>
	
					</c:otherwise>
				</c:choose>
			</table>
			
		</section>
		<section id="campingcar">
			<h2><a href="GetCampingcarCtrl?campingcar_no=107">캠핑카 상세 데이터 불러오기</a></h2>
			<%
			// 캠핑카 상세 데이터
			CampingcarVO vo = (CampingcarVO) request.getAttribute("vo");
			// 캠핑카 후기 리스트
			ArrayList<ReviewVO> reviewList = (ArrayList) request.getAttribute("reviewList");
			if(vo != null && reviewList != null) {
				// null이 아닐 경우 데이터 처리
				String[] options = vo.getCampingcar_option();	
				%>
					<ul>
						<li>
    					<%=vo.getCampingcar_address() %> 
						</li>
						<li>
    					<%=vo.getCampingcar_cnt() %> 
						</li>
						<li>
    					<%=vo.getCampingcar_img() %>
						</li>
						<li>
    					<%=vo.getCampingcar_infos() %>
						</li>
						<li>
    					<%=vo.getCampingcar_license() %>
						</li>
						<li>
    					<%=vo.getCampingcar_name() %>
						</li>
						<li>
    					<%=vo.getCampingcar_no() %>
						</li>
						<li>
    					<%=vo.getCampingcar_ph_fare() %>
						</li>
						<li>
    					<%=vo.getCampingcar_release_time() %>
						</li>
						<li>
    					<%=vo.getCampingcar_return_time() %>
						</li>
						<li>
    					<%=vo.getCampingcar_rider() %>
						</li>
						<li>
    					<%=vo.getCampingcar_sleeper() %>
						</li>
						<li>
    					<%=vo.getCampingcar_tel() %>
						</li>
						<li>
    					<%=vo.getCampingcar_wd_fare() %>
						</li>
						<li>
    					<%=vo.getCampingcar_website() %>
						</li>
						<li>
						<%
							for(int j = 0; j<options.length; j++){
						%>
							
			    					<%=options[j] %>
							
						<%
							}
						%>
						</li>
						<li>
    					<%=vo.getCampingcar_regdate() %>
						</li>
					</ul>
					<hr>
					<h3>후기</h3>
						<table>
						<%
							for(int i = 0; i < reviewList.size(); i++){
								ReviewVO rvo = reviewList.get(i);
						%>
							<tr>
		    					<td><%=rvo.getCampingcar_no() %></td>
		    					<td><%=rvo.getReview_content() %></td>
		    					<td><%=rvo.getReview_no() %></td>
		    					<td><%=rvo.getReview_score() %></td>
		    					<td><%=rvo.getUser_id() %></td>
		    					<td><a href="./updateReview.jsp?review_no=<%=rvo.getReview_no() %>&idck=<%=rvo.getUser_id() %>">리뷰 수정</a></td>
		    					<td><a href="DeleteReviewCtrl?review_no=<%=rvo.getReview_no() %>&idck=<%=rvo.getUser_id() %>">리뷰 삭제</a></td>
		    				</tr>
						<%
							}
						%>
						</table>
				<%
			} else {
				// null 일 경우 
				%>
				데이터가 없습니다. 불러오기를 해주세요
				<%
			}
			%>
		</section>
		<section id="addreview">
			<h2>리뷰 등록 페이지</h2>
			<form action="AddReviewCtrl" method="post">
	            <input type="hidden" value="107" name="campingcar_no" />
	            <table class="table table-bordered">
	               <tr>
	                  <td>작성자</td>
	                  <td>
	                     작성자
	                  </td>
	               </tr>
	               <tr>
	                  <td>별점</td>
	                  <td>
	                     <input name="review_score" type="range" max="5" min="1">
	                  </td>
	               </tr>
	               <tr>
	                  <td>내용</td>
	                  <td>
	                     <textarea name="review_content" cols='40' rows='10' class="form-control"></textarea>
	                  </td>
	               </tr>
	               <tr>
	                  <td colspan="2">
	                     <input type="submit" class="btn btn-primary" value="새글등록">
	                  </td>
	               </tr>
	            </table>
	         </form>
		</section>
		
		<section id="dashBoard">
			<h2><a href="GetDashBoardCampingcarListCtrl">대시보드 페이지</a></h2>
			<%
			ArrayList<CampingcarViewVO> campingcarListDash = (ArrayList<CampingcarViewVO>) request.getAttribute("campingcarListDash");
			%>
			<table>
				<c:choose>
					<c:when test="<%= campingcarListDash != null %>">
							<tr>
								<td>번호</td>
								<td>생성일</td>
								<td>평균별점</td>
								<td>조회수</td>
								<td>유저아이디</td>
							</tr>
						<c:forEach var="vo" items="<%= campingcarListDash %>">
							<tr>
								<td>${vo.campingcar_no }</td>
								<td>${vo.campingcar_regdate }</td>
								<td>${vo.review_score }</td>
								<td>${vo.campingcar_cnt }</td>
								<td>${vo.user_id }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td>데이터가 없어요. 불러오기 해주세요</td>
						</tr>					
					</c:otherwise>
				</c:choose>
			</table>
		</section>
		
		
		<section>
			<script type="text/javascript" src="./resouce/smarteditor2-2.8.2.3/js/HuskyEZCreator.js" charset="utf-8"></script>
			<form action="sample/viewer/index.php" method="post">
				<textarea name="ir1" id="ir1" rows="10" cols="100" style="width:766px; height:412px; display:none;"></textarea>
			</form>
			
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
					bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
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
				oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
			}
			</script>
		</section>
	</main>
</body>

</html>