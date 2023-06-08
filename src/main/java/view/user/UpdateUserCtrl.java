package view.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.user.UserDAO;
import biz.user.UserVO;
import biz.user.loginCK;

/**
 * Servlet implementation class UpdateUserCtrl
 */
@WebServlet("/UpdateUserCtrl")
public class UpdateUserCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		// 세션
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		
		// 로그인 체크
		PrintWriter out = response.getWriter();
	    boolean bool = loginCK.moveLoginPage(session, out, user_id);
	    out.println("<script>");		
		if(!bool) {
			// 로그인 된 경우
			// 파라미터 값 받아오기
			String user_pw = request.getParameter("user_pw");
			String user_email = request.getParameter("user_email");
			String user_tel = request.getParameter("user_tel");
			
			UserVO vo = new UserVO(user_id, user_pw, user_email, user_tel);
			// 비지니스 로직 실행
			UserDAO udao = new UserDAO();
			int cnt = udao.updateUser(vo);
			
			// 결과 값에 따라 이동
			if(cnt != 0) {
				// 성공했을 경우
				out.println("alert('유저 데이터를 수정했습니다.');");
				out.println("location.href='index.jsp';");
			} else {
				// 실패했을 경우
				out.println("alert('오류가 발생.');");
				out.println("location.href='index.jsp'");
				
			}			
		}
		out.println("</script>");
		// 자원 반납
		out.close();
		
	}

}
