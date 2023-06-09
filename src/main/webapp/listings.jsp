<%@page import="org.apache.taglibs.standard.lang.jstl.test.Bean1"%>
<%@page import="biz.campingcar.CampingcarViewVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="biz.campingcar.CampingcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   // 로그인처리
   String user_id = (String)session.getAttribute("user_id");
   if(user_id==null) {response.sendRedirect("./index.jsp");}
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
    <!-- <script src="./js/jquery.scrollTo.min.js"></script> -->
    <!-- 페이지 CSS -->
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/common.css">
    <link rel="stylesheet" href="./css/listings.css">
    <link rel="stylesheet" href="./css/chatbot.css">
</head>
<style>
   dialog{
       width: 100%;
       max-width: 1020px;
       height: 90%;
       border: 1px solid rgba(0, 0, 0, 0.1);
       border-radius: 20px;
       text-align: center;
       overflow-y: hidden; 
       background: transparent;
   }
   dialog::backdrop{
       background-color: rgba(0, 0, 0, 0.8);
   }
   iframe {
       width: 100%;
       height: 100%;
       overflow: hidden;
   }
   .close {
       position: absolute;
       top: 20px;
       right: 23px;
   }
</style>
<body>
<div id="wrap">
  <header>
      <jsp:include page="./module/header.jsp" />
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
      <div class="slot_flex">
        <%
          CampingcarDAO cdao = new CampingcarDAO();
          ArrayList<CampingcarViewVO> campingcarList = cdao.getALLCampingcar(user_id);
          
          for(int i=0; i<campingcarList.size(); i++){
            CampingcarViewVO bean = campingcarList.get(i);
        %>
        <div class="slot">
          <!-- 썸네일 이미지 동적으로 들어가는 부분 -->
          <div class="slot_title">
            <p>
	          	<%
	          		if(bean.getCampingcar_img() != null) {
	          			%>	          			
			            	<i class="fas fa-map-marker-alt"></i>
	          			<%
	          		} else {
	          			%>
	          				<img alt="" src="<%= bean.getCampingcar_img()[0] %>">
	          			<%
	          		}
	          	%>
            </p>
            <h2><a href="GetCampingcarCtrl?campingcar_no=<%=bean.getCampingcar_no()%>"><%=bean.getCampingcar_name()%></a></h2>
          </div>
          <div class="slot_info">
            <span class="confirm">승인대기중</span>
            <div class="info_text">
              <dl>
                <dt>타입</dt>
                <dd>캠핑카</dd>
              </dl>
              <dl>
                <dt>생성일</dt>
                <dd><%=bean.getCampingcar_regdate() %></dd>
              </dl>
              <dl>
                <dt>만료일</dt>
                <dd>등록일로부터 6개월</dd>
              </dl>
              <dl>
                <dt>평점</dt>
                <dd><%=bean.getReview_score() %></dd>
              </dl>
              <dl class="no_mb">
                <dt>오늘 조회수</dt>
                <dd><%=bean.getCampingcar_cnt() %></dd>
              </dl>
            </div>
          </div>
          <div class="info_icon">
            <ul>
              <li>
                <a href="GetCampingcarUPCtrl?campingcar_no=<%=bean.getCampingcar_no() %>" class="update">
                  <i class="fas fa-pen" ></i>
                </a>
              </li>
              <li><i class="fas fa-calendar-alt"></i></li>
              <li><i class="fas fa-calendar-check"></i></li>
              <li><a href="DeleteCampingcarCtrl?campingcar_no=<%=bean.getCampingcar_no() %>"><i class="fas fa-trash-alt"></i></a></li>
            </ul>
          </div>
        </div>
        <%
          }
        %>
      </div>
      <article class="resist_footer">
        <dl>
          <dt>Copyright &copy; 2021 <a href="index.jsp">캠박</a></dt>
          <dd>잊지 못할 캠핑의추억을 만들자, 캠박</dd>
        </dl>
      </article>
    </section>

    <!-- 수정하기 모달창 -->
    <dialog class="update_area">
      <!-- 수정하기 인클루드 -->
      <iframe src="" frameborder="0" id="if1"></iframe>
      <form method="dialog" class="close">
        <button value="close"><p class="update_close"><i class="fa fa-times" aria-hidden="true"></i></p></button>
      </form>
    </dialog>
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