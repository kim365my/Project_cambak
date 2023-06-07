package view.campingcar;

import java.io.IOException;
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

		if (cnt != 0) {
			// 성공했을 경우
			response.sendRedirect("index.jsp");
		} else {
			// 실패했을 경우
			response.sendRedirect("index.jsp");
		}
	}

}
