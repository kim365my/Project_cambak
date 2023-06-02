package view.campingcar;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.campingcar.CampingcarDAO;
import biz.campingcar.CampingcarVO;

/**
 * Servlet implementation class AddCampingcarCtrl
 */
@WebServlet("/AddCampingcarCtrl")
public class AddCampingcarCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// 파라미터 값 받기
		String campingcar_name = request.getParameter("campingcar_name");
		String campingcar_infos = request.getParameter("campingcar_infos");
		String campingcar_tel = request.getParameter("campingcar_tel");
		String campingcar_address = request.getParameter("campingcar_address");
		String campingcar_website = request.getParameter("campingcar_website");
		String campingcar_img = request.getParameter("campingcar_img");
		String[] campingcar_option = request.getParameterValues("campingcar_option");
		int campingcar_rider = Integer.parseInt(request.getParameter("campingcar_rider"));
		int campingcar_sleeper = Integer.parseInt(request.getParameter("campingcar_sleeper"));
		String campingcar_release_time = request.getParameter("campingcar_release_time");
		String campingcar_return_time = request.getParameter("campingcar_return_time");
		String campingcar_license = request.getParameter("campingcar_license");
		int campingcar_wd_fare = Integer.parseInt(request.getParameter("campingcar_wd_fare")); // 이것만 not null이므로 null 체크 필요
		int campingcar_ph_fare = Integer.parseInt(request.getParameter("campingcar_ph_fare"));
		String campingcar_detail = request.getParameter("campingcar_detail");
		// 세션에서 유저 아이디 값 받아오고, 없을 경우 경고창 띄우고 로그인 모달 띄우기
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		if(user_id == null) {
			// 로그인 처리 안되었을 경우 일단 메인으로
			response.sendRedirect("index.jsp");
		}
		
		// no와 조회수와 생성일은 DB에서 초기값으로 넣음
		CampingcarVO vo = new CampingcarVO(campingcar_ph_fare, campingcar_name, campingcar_infos, campingcar_tel, campingcar_address, campingcar_website, campingcar_img, campingcar_option, campingcar_rider, campingcar_sleeper, campingcar_release_time, campingcar_return_time, campingcar_license, campingcar_wd_fare, campingcar_ph_fare, campingcar_detail, user_id, campingcar_ph_fare, null);
		
		// 비지니스 로직 실행
		CampingcarDAO cdao = new CampingcarDAO();
		int cnt = cdao.addCampingcar(vo);

		// 결과에 따라 값 출력
		
		if(cnt != 0) {
			// 성공했을 경우,  페이지 이동 일단 임의로 인덱스 페이지로
			response.sendRedirect("index.jsp");
		} else {
			// 실패했을 경우
			response.sendRedirect("index.jsp");
			
		}

	}

}

