<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 인코딩 설정
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	// 파라미터 받기
	String campingcar_no = request.getParameter("campingcar_no");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>캠핑카 등록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/css.css">
</head>
<body>
    <div id="wrap" class="card-body">
      <header>
         <h1>캠핑카 등록</h1>
      </header>
      <section>
         <form action="UpdateCampingcarCtrl" method="post">
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
                     <input type="number" name="campingcar_wd_fare" class="form-control" >
                  </td>
               </tr>
               <tr>
                  <th>주말 요금</th>
                  <td>
                     <input type="number" name="campingcar_ph_fare" class="form-control" >
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
                  	 <input type="text" value="<%=campingcar_no %>" name="campingcar_no">
                     <input type="submit" value="수정하기" class="btn btn-primary">
                     <input type="reset" value="취소" class="btn btn-secondary">
                  </td>
               </tr>
            </table>
         </form>
      </section>
   </div>
</body>
</html>