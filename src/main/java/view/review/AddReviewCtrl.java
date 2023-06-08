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

@WebServlet("/AddReviewCtrl")
public class AddReviewCtrl extends HttpServlet {
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
      
        // 로그인 처리
	    PrintWriter out = response.getWriter();
	    boolean bool = loginCK.moveLoginPage(session, out, user_id);
		
		if(!bool) {
    	  // 폼 데이터 받기
    	  int review_score = Integer.parseInt(request.getParameter("review_score"));
    	  String review_content = request.getParameter("review_content");
    	  int campingcar_no = Integer.parseInt(request.getParameter("campingcar_no"));
    	  // DAO
    	  ReviewVO vo = new ReviewVO(0, review_score, review_content, user_id, campingcar_no);
    	  // 로직 실행
    	  ReviewDAO rdao = new ReviewDAO();
    	  out.println("<script>");
    	  int cnt = rdao.addReview(vo);
			 if(cnt != 0) {
				 // 성공했을 경우 이동
				 out.println("alert('리뷰 등록 성공');"
					  + "location.href=document.referrer;");
			 } else {
				 out.println("alert('리뷰 등록 실패');"
						 + "location.href=document.referrer;");
				 
			 }
			 out.println("</script>");
		}
		 out.close();

   }
}