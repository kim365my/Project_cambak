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
    <!-- 폰트어썸 -->
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/> -->
    <!-- 폰트어썸 5 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <!-- 폰트어썸 4.7 -->
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>  
    <!-- 머티리얼 아이콘 -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- 팝이콘 -->
    <link rel="shortcut icon" href="./images/favicon/fav32.png">
    <link rel="apple-touch-icon=precomposed" href="./images/favicon/fav180.png">
    <!-- 기본 코딩 JS 파일 -->
    <script src="./js/jquery-1.12.4.min.js"></script>
    <script src="./js/jquery-3.3.1.min.js"></script>
    <script src="./js/jquery-3.4.1.min.js"></script>
    <script src="./js/prefixfree.min.js"></script>
    <!-- 제이쿼리 플러그인 -->
    <!-- <script src="./js/jquery-ui.min.js"></script> -->

    <!-- 기본 코딩 CSS 파일 -->
    <link rel="stylesheet" href="./css/reset.css">
    <!-- 페이지 CSS -->
    <link rel="stylesheet" href="./css/resist.css">
    <link rel="stylesheet" href="./css/resist_final.css">

</head>
      <body>
        <div id="wrap">
          <!-- 왼쪽 gnb -->
          <aside>
            <nav>
                <div class="gnb">
                    <article>
                      <a href="index.jsp">
                      <img src="./images/resist/logo.png" alt="로고" />
                      </a>
                    </article>
                    <ul>
                        <li>
                            일반
                            <img src="./images/resist/check.png" alt="" class="image" />
                        </li>
                        <li>
                          등록
                          <img src="./images/resist/check.png" alt="" class="image" />
                        </li>
                        <li>
                          완료
                          <img src="./images/resist/check.png" alt="" class="image" />
                        </li>
                    </ul>
                </div>
            </nav>
        </aside>
        <!-- 오른쪽 gnb -->
        <div class="right w1620">
            <section class="header w1620">
                <article><img src="./images/resist/container_car.png" alt="자동차아이콘" /></article>
                <h1>새로운 캠핑카 등록</h1>
                <p><a href="./index.jsp">Exit</a></p>
            </section>
        </div>
          <section class="other_check">
            <div><i class="rz--verified fas fa-check-circle"></i></div>
            <h3>등록이 완료되었습니다!</h3>
            <p>등록하신 내용을 캠박 팀에서 검토하여, 이상이 없을 시 1영업일 이내로 게시가 완료됩니다</p>
          </section>
          <footer class="footer w1620">
            <div class="pogress_container">
                <div class="progress_bar" id="myBar"></div>
                <div class="progresss_bar" id="myBar"></div>
            </div>
        </footer>
    </body>
    <!-- 페이지 JS -->
    <script src="./js/resist.js"></script>
</html>
