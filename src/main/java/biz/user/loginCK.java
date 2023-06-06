package biz.user;

import java.io.PrintWriter;
import javax.servlet.http.HttpSession;

public class loginCK {
	/** 로그인 처리가 되지 않았으면 로그인 페이지로 이동하는 메소드 */
	public static boolean moveLoginPage(HttpSession session, PrintWriter out) {
		String user_id = (String) session.getAttribute("user_id");
		boolean bool = user_id == null;
		// 로그인이 되지 않았으면 로그인 페이지로
		if (bool) {
			out.println("<script>");
			out.println("alert('로그인이 필요한 페이지 입니다.');");
			// 돌아가기
			out.println("location.href = 'index.jsp';");
			out.println("</script>");
		}
		return bool;
	}
	/** 로그인 처리가 되지 않았으면 로그인 페이지로 이동하는 메소드 */
	public static boolean moveLoginPage(HttpSession session, PrintWriter out, String user_id) {
		boolean bool = user_id == null;
		// 로그인이 되지 않았으면 로그인 페이지로
		if (user_id == null) {
			out.println("<script>");
			out.println("alert('로그인이 필요한 페이지 입니다.');");
			// 돌아가기
			out.println("location.href = 'index.jsp';");
			out.println("</script>");
		}
		return bool;
	}

}
