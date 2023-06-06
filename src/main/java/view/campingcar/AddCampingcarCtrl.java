package view.campingcar;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.apache.jasper.tagplugins.jstl.core.If;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import biz.campingcar.CampingcarDAO;
import biz.campingcar.CampingcarVO;
import biz.user.loginCK;

/**
 * Servlet implementation class AddCampingcarCtrl
 */
@WebServlet("/AddCampingcarCtrl")
public class AddCampingcarCtrl extends HttpServlet {
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

		// 세션에서 유저 아이디 값 받아오고, 없을 경우 경고창 띄우고 로그인 모달 띄우기
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");

		// 전송된 파일타입 확인하기
		System.out.println("req : " + request.getContentType());

		// 로그인 처리
		PrintWriter out = response.getWriter();
		boolean bool = loginCK.moveLoginPage(session, out, user_id);

		if (!bool) {
			
			ServletContext context = getServletContext(); 
			
			String url = "images/detail"; // 파일을 저장할 URL 지정
			String path = context.getRealPath(url); // 실제로 서버에 저장되는 경로 구하기
			
			// 폴더 생성하기
			CampingcarDAO cdao = new CampingcarDAO();
			String no = Integer.toString(cdao.getNextNo());
			
			File file = new File(path + File.separator + no); // 번호에 따라 폴더 생성
			if(file.mkdir()) path += File.separator + no; // 파일이 생성 된 것이 맞을 경우 url 수정
			System.out.println("절대 경로 : " + path);
			
			
			try {
				int size = 1024 * 1024 * 256; // 파일 사이즈 설정 : 256M				
				MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());

				// 파라미터 값 받기
				String campingcar_name = multi.getParameter("campingcar_name");
				String campingcar_infos = multi.getParameter("campingcar_infos");
				String campingcar_tel = multi.getParameter("campingcar_tel");
				String campingcar_address = multi.getParameter("campingcar_address");
				String campingcar_website = multi.getParameter("campingcar_website");
				String[] campingcar_option = multi.getParameterValues("campingcar_option");

				int campingcar_rider = Integer.parseInt(multi.getParameter("campingcar_rider").replaceAll("명", ""));
				int campingcar_sleeper = Integer.parseInt(multi.getParameter("campingcar_sleeper").replaceAll("명", ""));

				String campingcar_release_time = multi.getParameter("campingcar_release_time");
				String campingcar_return_time = multi.getParameter("campingcar_return_time");
				String campingcar_license = multi.getParameter("campingcar_license");

				String wd_fare = multi.getParameter("campingcar_wd_fare");
				int campingcar_wd_fare = (wd_fare == null || wd_fare.isEmpty()) ? 0 : Integer.parseInt(wd_fare);												

				String ph_fare = multi.getParameter("campingcar_ph_fare");
				int campingcar_ph_fare = (ph_fare == null || ph_fare.isEmpty()) ? 0 : Integer.parseInt(ph_fare);

				// --------------------------------
				// images/detail/넘버 폴더에 저장한 전체 파일 이름 가져오기
				Enumeration<?> files = multi.getFileNames();
				
				String campingcar_img = null;
				int index = 1;
				while(files.hasMoreElements()) {					
					// 개별 접근
					String str = (String) files.nextElement();
					// 중복처리, 이름이 중복되면 파일 이름을 변경해서 출력함 (다운로드 기능 만들것도 아니니까 변경된 이름만 저장)
					if(index == 0) campingcar_img = multi.getFilesystemName(str);
					index++;
				}
				String campingcar_detail = multi.getParameter("campingcar_detail");

				// --------------------------------
				// no와 조회수와 생성일은 DB에서 초기값으로 넣음
				CampingcarVO vo = new CampingcarVO(0, campingcar_name, campingcar_infos, campingcar_tel,
						campingcar_address, campingcar_website, campingcar_img, campingcar_option, campingcar_rider,
						campingcar_sleeper, campingcar_release_time, campingcar_return_time, campingcar_license,
						campingcar_wd_fare, campingcar_ph_fare, campingcar_detail, user_id, 00, null);
				// 자바빈에 들어가는 데이터
				System.out.println(campingcar_name + " " + campingcar_infos + " " + campingcar_tel +
						campingcar_address + " " + campingcar_website + " " + campingcar_img + " " + campingcar_option
						+ " " + campingcar_rider +
						campingcar_sleeper + " " + campingcar_release_time + " " + campingcar_return_time + " "
						+ campingcar_license + " " +
						campingcar_wd_fare + " " + campingcar_ph_fare + " " + campingcar_detail + " " + user_id);

				// 비지니스 로직 실행, 캠핑카 데이터 생성
//				int cnt = cdao.addCampingcar(vo);

				// 결과에 따라 값 출력
//				if (cnt != 0) {
//					// 성공했을 경우, 페이지 이동 일단 임의로 인덱스 페이지로
//					response.sendRedirect("resist_final.jsp");
//				} else {
//					// 실패했을 경우
//					response.sendRedirect("resist.jsp");
//				}
			} catch (Exception e) {
				// 오류 발생시 처리
				e.printStackTrace();
			}

		}
		// 자원 반납
		out.close();

	}

}
