package view.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutCtrl
 */
@WebServlet("/LogoutCtrl")
public class LogoutCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		// 세션 해제
		session.invalidate();
		// 로그아웃 처리
		PrintWriter out = response.getWriter();
		out.println("alert('로그아웃 처리되었습니다.');");
		out.close();
		// 페이지 이동
		response.sendRedirect("index.jsp");

	}

}
