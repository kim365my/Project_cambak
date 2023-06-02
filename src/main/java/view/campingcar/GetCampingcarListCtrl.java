package view.campingcar;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.campingcar.CampingcarDAO;
import biz.campingcar.CampingcarVO;

/**
 * 캠핑카 리스트 불러오기 Ctrl
 */
@WebServlet("/GetCampingcarListCtrl")
public class GetCampingcarListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		// 비지니스 로직 실행
		CampingcarDAO cdao = new CampingcarDAO();
		ArrayList<CampingcarVO> campingcarList = cdao.getALLCampingcar();

		// 결과에 따라 값 출력
		if(campingcarList != null) {
			// 성공했을 경우, 페이지 이동 일단 임의로 인덱스 페이지로
			request.setAttribute("campingcarList", campingcarList);
			RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
	        dis.forward(request, response);
		} else {
			// 실패했을 경우
			response.sendRedirect("index.jsp");
		}

	}

}

