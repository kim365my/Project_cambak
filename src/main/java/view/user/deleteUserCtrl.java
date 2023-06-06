package view.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.campingcar.CampingcarDAO;
import biz.review.ReviewDAO;
import biz.user.UserDAO;

/**
 * Servlet implementation class deleteUser
 */
@WebServlet("/deleteUserCtrl")
public class deleteUserCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		// 파라미터 갑 받기
		String user_id = request.getParameter("user_id");
		;

		// 비지니스 로직 실행
		// 리뷰데이터 먼저 삭제
		ReviewDAO rdao = new ReviewDAO();
		int cnt = rdao.deleteReview(user_id);

		// 캠핑카 데이터 삭제
		CampingcarDAO cdao = new CampingcarDAO();
		cnt += cdao.deleteCampingcar(user_id);

		// 회원 데이터 삭제
		UserDAO udao = new UserDAO();
		cnt += udao.deleteUser(user_id);

		// 결과에 따라 값 출력
		PrintWriter out = response.getWriter();
		out.println("<script>");
		// 실행 성공시 값 넘겨주거나 경고창
		if (cnt != 0) {
			// 성공했을 경우
			HttpSession session = request.getSession();
			out.println("alert('회원탈퇴 처리되었습니다.');");
			// 로그인 후 이동할 페이지 *일단 임의로 뒤로가게해서 새로고침
			out.println("location.href=document.referrer;");
		} else {
			// 실패했을 경우
			out.println("alert('오류가 발생했습니다');");
			// 로그인 후 이동할 페이지 *일단 임의로 뒤로가게해서 새로고침
			out.println("history.back();");
		}
		out.println("</script>");
		out.close();

	}

}
