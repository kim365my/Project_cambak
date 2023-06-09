<%@page import="biz.review.ReviewVO"%>
<%@page import="biz.review.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int review_no = Integer.parseInt(request.getParameter("review_no"));
ReviewDAO rdao = new ReviewDAO();
ReviewVO rvo = rdao.getReview(review_no);
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
    <!-- 폰트어썸 5 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <!-- 폰트어썸 4.7 -->
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>  
    <!-- 머티리얼 아이콘 -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"  rel="stylesheet">
    <!-- 팝이콘 -->
    <link rel="shortcut icon" href="../images/favicon/fav32.png">
    <link rel="apple-touch-icon=precomposed" href="../images/favicon/fav180.png">
    <!-- 기본 코딩 JS 파일 -->
    <script src="../js/jquery-1.12.4.min.js"></script>
    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/jquery-3.4.1.min.js"></script>
    <script src="../js/prefixfree.min.js"></script>
    <!-- 제이쿼리 플러그인 -->
    <script src="../js/jquery-ui.min.js"></script>
    <script src="../js/jquery.scrollTo.min.js"></script>
    <!-- 기본 코딩 CSS 파일 -->
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/detail_common.css">
    <!-- 페이지 CSS -->
    <link rel="stylesheet" href="../css/detail.css">
    <link rel="stylesheet" href="../css/common.css">
</head>
<style>
	/* 리뷰 내용 */
	.review_content p {
			font-size: 1.6rem;
			font-weight: 500;
			line-height: 1.2;
	}

	.review_content textarea {
			width: 100%;
			font-size: 16px;
			background-color: #d9d9d9;
			border-radius: 10px;
			padding: 16px;
	}

	.modal-content p{
			padding-top: 24px;
			text-align: center;
	}
</style>
<body>
	<div class="modal-content">
		<div class="review_header">
			<h4>후기 수정하기</h4>
			<h3>
				<!-- 취소 버튼 -->
				<button class="review_cancelUP"><i class="fas fa-times"></i></button>
			</h3>
		</div>
		<form action="/UpdateReviewCtrl" method="post" >
			<div class="review_container">
				<!-- 후기 별점 -->
				<div class="review_star_score">
					<h5>평점을 매겨주세요</h5>
					<div class="star-rating">
						<%
						int score = rvo.getReview_score();
						
						%>
						<input type="radio" id="5-stars_up" name="review_score" value="5"  <%= (score == 5)? "checked" : "" %> />
						<label for="5-stars_up" class="star"><i class="fas fa-star"></i></label>
						<input type="radio" id="4-stars_up" name="review_score" value="4" <%= (score == 4)? "checked" : "" %> />
						<label for="4-stars_up" class="star"><i class="fas fa-star"></i></label>
						<input type="radio" id="3-stars_up" name="review_score" value="3" <%= (score == 3)? "checked" : "" %> />
						<label for="3-stars_up" class="star"><i class="fas fa-star"></i></label>
						<input type="radio" id="2-stars_up" name="review_score" value="2"  <%= (score == 2)? "checked" : "" %> />
						<label for="2-stars_up" class="star"><i class="fas fa-star"></i></label>
						<input type="radio" id="1-star_up" name="review_score" value="1" <%= (score == 1)? "checked" : "" %> />
						<label for="1-star_up" class="star"><i class="fas fa-star"></i></label>
					</div>
				</div>
				<!-- 후기 작성란 -->
				<div class="review_content">
					<h5>후기를 남겨주세요</h5>
					<textarea name="review_content" cols="100" rows="10" ><%=rvo.getReview_content() %></textarea>
				</div>
				<input type="hidden" name="idck" value="<%= rvo.getUser_id() %>">
				<input type="hidden" name="review_no" value="<%= rvo.getReview_no()%>">
				<p><input type="submit" value="후기 등록하기" class="review_reist"></p>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
	const closeBtn = document.querySelector(".review_cancelUP");
	closeBtn.addEventListener("click", (e) => {
		window.parent.review_cancelUP();
	})

</script>
</html>

