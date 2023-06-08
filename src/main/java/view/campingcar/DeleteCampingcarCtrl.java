package view.campingcar;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.campingcar.CampingcarDAO;
import biz.review.ReviewDAO;

/**
 * 캠핑카 삭제
 */
@WebServlet("/DeleteCampingcarCtrl")
public class DeleteCampingcarCtrl extends HttpServlet {
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

		// 파라미터 값 받기
		int campingcar_no = Integer.parseInt(request.getParameter("campingcar_no"));

		// 캠핑카 데이터 삭제
		CampingcarDAO cdao = new CampingcarDAO();
		int cnt = cdao.deleteCampingcar(campingcar_no);
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
        if(cnt != 0) {
			out.println("alert('캠핑카 삭제 처리되었습니다.');");
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
