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
import biz.review.ReviewDAO;
import biz.review.ReviewVO;

/**
 * 캠핑카 상세보기 페이지 Ctrl
 */
@WebServlet("/GetCampingcarUPCtrl")
public class GetCampingcarUPCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// 파라미터 값 받기
		int campingcar_no = Integer.parseInt(request.getParameter("campingcar_no"));
		
		
		// 비지니스 로직 실행
		CampingcarDAO cdao = new CampingcarDAO();
		CampingcarVO vo = cdao.getCampingcar(campingcar_no);

		// 결과에 따라 값 출력
		if(vo != null) {
			// 리뷰 불러오는 데 성공한 경우
			// 바인딩
			request.setAttribute("vo", vo);
			// 포워드
			RequestDispatcher dis = request.getRequestDispatcher("./module/update.jsp");
			dis.forward(request, response);
		} else {
			// 실패한 경우
			System.out.println("상세보기 Ctrl 처리 중 오류, vo 값이 null");
			response.sendRedirect("./module/update.jsp");
		}

	}

}

