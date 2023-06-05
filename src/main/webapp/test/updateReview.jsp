<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("utf-8");
   response.setContentType("text/html;charset=utf-8");
   
   // 리뷰번호와 리뷰 작성자 아이디
   String review_no =request.getParameter("review_no");
   String idck = request.getParameter("idck");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 수정</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/css.css">
</head>
<body>
   <div id="wrap" class="card-body">
      <header>
         <h1>리뷰 수정</h1>
      </header>
      <section>
         <form action="UpdateReviewCtrl" method="post">
            <table class="table table-bordered">
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
                  	 <input type="hidden" value="<%=review_no %>" name="review_no">
                  	 <input type="hidden" value="<%=idck %>" name="idck">
                     <input type="submit" class="btn btn-primary" value="새글등록">
                  </td>
               </tr>
            </table>
         </form>
      </section>
   </div>
</body>
</html></html>