package view.campingcar;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.campingcar.CampingcarDAO;
import biz.campingcar.CampingcarViewVO;

/**
 * Servlet implementation class GetCampingcarCtrl
 */
@WebServlet("/GetDashBoardCampingcarListCtrl")
public class GetDashBoardCampingcarListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// 파라미터 갑 받기
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		
		// 비지니스 로직 실행
		CampingcarDAO cdao = new CampingcarDAO();
		ArrayList<CampingcarViewVO> campingcarList = cdao.getALLCampingcar(user_id);

		// 결과에 따라 값 출력
		if(campingcarList != null) {
			// 성공했을 경우, 페이지 이동 일단 임의로 인덱스 페이지로
			// 바인딩
		      request.setAttribute("campingcarList", campingcarList);
		      // 포워드
		      RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
		      dis.forward(request, response);
		} else {
			// 실패했을 경우
			response.sendRedirect("index.jsp");
			
		}

	}

}

