package view.review;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.review.ReviewDAO;
import biz.review.ReviewVO;
import biz.user.loginCK;

@WebServlet("/UpdateReviewCtrl")
public class UpdateReviewCtrl extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGetPost(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGetPost(request, response);
   }

   protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      response.setContentType("text/html;charset=utf-8");
      // 세션
      HttpSession session = request.getSession();
      String user_id = (String) session.getAttribute("user_id");
      
      // 파라이터로 넘겨온 아이디
      String idck = request.getParameter("idck");
      
		// 로그인 처리
		PrintWriter out = response.getWriter();
		boolean bool = loginCK.moveLoginPage(session, out, user_id);
		out.println("<script>");
		if(!bool) {
    	  if(user_id.equals(idck)) { 
			 // 폼데이터
			 int review_no = Integer.parseInt(request.getParameter("review_no"));
			 int review_score = Integer.parseInt(request.getParameter("review_score"));
			 String review_content = request.getParameter("review_content");
			 
			 // 자바빈 저장
			 ReviewVO vo = new ReviewVO(review_no, review_score, review_content, user_id, 0);		 
			 
			 // 비지니스 로직 실행
			 ReviewDAO rdao = new ReviewDAO();
			 int cnt = rdao.upReview(vo);
			 if(cnt != 0) {
				 // 성공했을 경우 이동
				 out.println("alert('리뷰 업데이트 성공');"
					  + "location.href=document.referrer;");
			 } else {
				 out.println("alert('리뷰 업데이트 실패');"
						 + "location.href=document.referrer;");
				 
			 }
	      } else {
	   		  out.println("alert('리뷰 작성한 아이디와 동일하지 않음');"
					  + "location.href='index.jsp';");
	      }
			
		}
	  out.println("</script>");
      out.close();
      
   }

}