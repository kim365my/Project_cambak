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

/**
 * Servlet implementation class loginCtrl
 */
@WebServlet("/loginCtrl")
public class loginCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// 파라미터 갑 받기
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		// 비지니스 로직 실행
		UserDAO udao = new UserDAO();
		int cnt = udao.getUser(user_id, user_pw);
		
		// 결과에 따라 값 출력
		PrintWriter out = response.getWriter();
		out.println("<script>");
		// 실행 성공시 값 넘겨주거나 경고창
		if(cnt != 0) {
			// 성공했을 경우
			HttpSession session = request.getSession();
			// 세션 설정
			session.setAttribute("user_id", user_id);
			out.println("alert('로그인 처리되었습니다.');");
			// 로그인 후 이동할 페이지 *일단 임의로 뒤로가게해서 새로고침
			out.println("location.href=document.referrer;");
		} else {
			// 실패했을 경우
			out.println("alert('아이디나 비밀번호를 다시 한번 확인해주세요');");
			// 로그인 후 이동할 페이지 *일단 임의로 뒤로가게해서 새로고침
			out.println("history.back();");	
		}
		out.println("</script>");
		out.close();

	}

}
