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
import biz.user.loginCK;


@WebServlet("/DeleteReviewCtrl")
public class DeleteReviewCtrl extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   doPost(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        // 세션
        HttpSession session = request.getSession();
        String user_id = (String)session.getAttribute("user_id");
      
        // 파라이터로 넘겨온 아이디
        String idck = request.getParameter("idck");
      
        PrintWriter out = response.getWriter();
        // 로그인이 안되어 있으면 login.jsp로 이동
        // 로그인이 되어있어도, 회원정보가 일치해야 삭제 가능하도록 변경
	    boolean bool = loginCK.moveLoginPage(session, out, user_id);
	    
	    out.println("<script>");
	    if(!bool && user_id.equals(idck)) {
	         // 파라미터 받아오기
	         int review_no = Integer.parseInt(request.getParameter("review_no"));
	         
	         // DAO
	         ReviewDAO rdao = new ReviewDAO();
	         int cnt = rdao.deleteReview(review_no);
	              
	         if(cnt != 0) {
	 			out.println("alert('리뷰 삭제 처리되었습니다.');");
	 			// 로그인 후 이동할 페이지 *일단 임의로 뒤로가게해서 새로고침
	 			out.println("location.href=document.referrer;");
	 		} else {
	 			// 실패했을 경우
	 			out.println("alert('오류가 발생했습니다');");
	 			// 로그인 후 이동할 페이지 *일단 임의로 뒤로가게해서 새로고침
	 			out.println("history.back();");	
	 		}
      } else {
		// 로그인 아이디가 동일하지 않을 경우
		out.println("alert('오류가 발생했습니다');");
		out.println("location.href=document.referrer;");
      }
      out.println("</script>");
      out.close();
      
   }


}