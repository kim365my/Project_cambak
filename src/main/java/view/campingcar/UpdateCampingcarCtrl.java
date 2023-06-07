package view.campingcar;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.campingcar.CampingcarDAO;
import biz.campingcar.CampingcarVO;
import biz.user.loginCK;

/**
 * Servlet implementation class UpdateCampingcarCtrl
 */
@WebServlet("/UpdateCampingcarCtrl")
public class UpdateCampingcarCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// 세션에서 유저 아이디 값 받아오고, 없을 경우 경고창 띄우고 로그인 모달 띄우기
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		
		// 로그인 처리
		PrintWriter out = response.getWriter();
		boolean bool = loginCK.moveLoginPage(session, out, user_id);
		
		if(!bool) {
			// 파라미터 값 받기
			int campingcar_no = Integer.parseInt(request.getParameter("campingcar_no"));
			String campingcar_name = request.getParameter("campingcar_name");
			String campingcar_infos = request.getParameter("campingcar_infos");
			String campingcar_tel = request.getParameter("campingcar_tel");
			String campingcar_address = request.getParameter("campingcar_address");
			String campingcar_website = request.getParameter("campingcar_website");
			String[] campingcar_img = request.getParameterValues("campingcar_img");
			String[] campingcar_option = request.getParameterValues("campingcar_option");
			
			String rider = request.getParameter("campingcar_rider").replaceAll("명", "");
			int campingcar_rider = (rider == null) ? 0 :Integer.parseInt(rider);
			
			String sleeper = request.getParameter("campingcar_sleeper").replaceAll("명", "");
			int campingcar_sleeper = (sleeper == null) ? 0 :Integer.parseInt(sleeper);
			
			String campingcar_release_time = request.getParameter("campingcar_release_time");
			String campingcar_return_time = request.getParameter("campingcar_return_time");
			String campingcar_license = request.getParameter("campingcar_license");
			
			String wd_fare = request.getParameter("campingcar_wd_fare");
			int campingcar_wd_fare = (wd_fare == null) ? 0 :Integer.parseInt(wd_fare); // 이것만 not null이므로 null 체크 필요
			
			String ph_fare = request.getParameter("campingcar_ph_fare");
			int campingcar_ph_fare = (ph_fare == null) ? 0 :Integer.parseInt(ph_fare);
			
			String campingcar_detail = request.getParameter("campingcar_detail");
		
				
			// no와 조회수와 생성일은 DB에서 초기값으로 넣음
			CampingcarVO vo = new CampingcarVO(campingcar_no, campingcar_name, campingcar_infos, campingcar_tel, campingcar_address, campingcar_website, campingcar_img, campingcar_option, campingcar_rider, campingcar_sleeper, campingcar_release_time, campingcar_return_time, campingcar_license, campingcar_wd_fare, campingcar_ph_fare, campingcar_detail, user_id, 0, null);
			
			// 비지니스 로직 실행
			CampingcarDAO cdao = new CampingcarDAO();
			int cnt = cdao.updateCampingcar(vo);
			
			out.println("<script>");
			// 결과에 따라 값 출력
			if(cnt != 0) {
				// 성공했을 경우, 대시보드 페이지로 이동
				out.println("window.parent.alert('수정이 완료되었습니다.');");
				out.println("window.parent.closeModal();");
			} else {
				// 실패했을 경우
				out.println("alert('수정이 완료되었습니다.')");
				out.println("location.herf=document.referrer;");
				
			}
			out.println("</script>");
		}
		// 자원 반납
		out.close();
	}

}
