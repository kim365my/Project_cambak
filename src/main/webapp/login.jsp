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
  <link rel="stylesheet" href="./css/reset.css" />
  <link rel="stylesheet" href="./css/font.css" />
  <!-- <link rel="stylesheet" href="./css/display_none_scrollbar.css"> -->
  <link rel="stylesheet" href="./css/login.css" />
</head>
<body>
  <!-- <button>모달</button> -->
  <div class="login_modal">
    <!-- 추후 로그인 ctrl로 링크 수정 -->
    <div class="login_modal_content">
      <div class="title">
        <h1>로그인</h1>
        <p class="close"><i class="fa fa-times" aria-hidden="true"></i></p>
      </div>
      <div class="login_tabmenu">
        <!-- 탭버튼 -->
        <input type="radio" name="tabmenu" id="tab01" checked>
        <label for="tab01">로그인</label>
        <input type="radio" name="tabmenu" id="tab02">
        <label for="tab02" class="no_ml">회원가입</label>
        
        <div class="con01">
          <form action="LoginCtrl" method="post">
            <div class="login_input">
              <input type="text" name="user_id" placeholder="아이디 또는 이메일" required>
              <input type="password" name="user_pw" placeholder="비밀번호" class="password" required>
            </div>
            <p class="forget_pw">
              <i class="fa fa-unlock-alt" aria-hidden="true"></i>&nbsp;&nbsp;비밀번호를 잊어버리셨습니까?
            </p>
            <div class="line"></div>
            <div class="submit_btn">
              <input type="submit" value="로그인">
            </div>
          </form>
        </div>
        <!-- 탭메뉴 설정으로 클릭하지 않는 이상 안보임 -->
        <!-- 추후 로그아웃 ctrl로 링크 수정 -->
        <div class="con02">
          <form action="JoinCtrl" method="post">
            <div class="join_content">
              <div class="join_input">
                <input type="text" name="user_id" placeholder="아이디" required>
                <input type="tel" name="user_tel" placeholder="휴대폰번호(공백없이 입력)" required>
                <input type="email" name="user_email" placeholder="이메일" required>
                <input type="password" name="user_pw" placeholder="비밀번호" required>
                <input type="password" name="user_pw2" placeholder="비밀번호 재입력" class="no_mr" required>
              </div>
              <div class="lg_check">
                <label>
                  <input type="checkbox" value="agree" />
                  <span></span>
                  <strong>이용약관 및 개인정보취급방침에 동의합니다.</strong>
                </label>
              </div>
            </div>
            <div class="line"></div>
            <div class="submit_btn">
              <input type="submit" value="회원가입">
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</body>
</html>