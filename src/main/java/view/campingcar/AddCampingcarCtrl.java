package view.campingcar;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import biz.campingcar.CampingcarDAO;
import biz.campingcar.CampingcarVO;
import biz.user.loginCK;

/**
 * Servlet implementation class AddCampingcarCtrl
 */
@WebServlet("/AddCampingcarCtrl")
@MultipartConfig(
    fileSizeThreshold = 1024*1024,
    maxFileSize = 1024*1024*256, //256메가
    maxRequestSize = 1024*1024*256*10 // 256메가 10개까지
)
public class AddCampingcarCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
			// 로그인 처리 되었을 경우
			
			// 실제 경로 값 받아오기
			ServletContext context = getServletContext(); 
			String path = context.getRealPath("images/detail"); // 실제로 서버에 저장되는 경로 구하기

			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	        String today = formatter.format(new java.util.Date());
			String folderName = today + UUID.randomUUID().toString();
			path += File.separator + folderName;
			
			File file = new File(path); // 번호에 따라 폴더 생성
			if(!file.exists()) file.mkdir(); // 파일 생성 코드 
			
			System.out.println("절대 경로 : " + path);
		
			try {
				// 파라미터 값 받기
				String campingcar_name = request.getParameter("campingcar_name");
				String campingcar_infos = request.getParameter("campingcar_infos");
				String campingcar_tel = request.getParameter("campingcar_tel");
				String campingcar_address = request.getParameter("campingcar_address");
				String campingcar_website = request.getParameter("campingcar_website");
				String[] campingcar_option = request.getParameterValues("campingcar_option");

				int campingcar_rider = Integer.parseInt(request.getParameter("campingcar_rider").replaceAll("명", ""));
				int campingcar_sleeper = Integer.parseInt(request.getParameter("campingcar_sleeper").replaceAll("명", ""));

				String campingcar_release_time = request.getParameter("campingcar_release_time");
				String campingcar_return_time = request.getParameter("campingcar_return_time");
				String campingcar_license = request.getParameter("campingcar_license");

				String wd_fare = request.getParameter("campingcar_wd_fare");
				int campingcar_wd_fare = (wd_fare == null || wd_fare.isEmpty()) ? 0 : Integer.parseInt(wd_fare);												

				String ph_fare = request.getParameter("campingcar_ph_fare");
				int campingcar_ph_fare = (ph_fare == null || ph_fare.isEmpty()) ? 0 : Integer.parseInt(ph_fare);
				String campingcar_imgFolder = folderName;


				// Part 객체로 파일 이름 받아서 처리하기 
				String img = "";
				List<Part> parts = (List<Part>) request.getParts();
				for (Part part : parts) {
					String name = getImgFilename(part);
					if(name != null && name != "") {
						part.write(path + File.separator  + name); // null 처리 필요
						img += name + ", "; // 반환
					}
				}
				if(!img.isEmpty()) {					
					img = img.substring(0, img.length() - 2); // 마지막 ", " 지우기
				}
				
				
				String[] campingcar_img = img.split(", "); // 이미지 이름 받아서 저장하기
				String campingcar_detail = request.getParameter("campingcar_detail"); // 파일 위치 전달

				// --------------------------------
				// no와 조회수와 생성일은 DB에서 초기값으로 넣음
				CampingcarVO vo = new CampingcarVO(0, campingcar_name, campingcar_infos, campingcar_tel,
						campingcar_address, campingcar_website, campingcar_img, campingcar_option, campingcar_rider,
						campingcar_sleeper, campingcar_release_time, campingcar_return_time, campingcar_license,
						campingcar_wd_fare, campingcar_ph_fare, campingcar_detail, user_id, 00, null, campingcar_imgFolder);
				String op = "";
				if (campingcar_option != null) {
					for(String option : campingcar_option) {
						op += option + ", ";
					}
					op = op.substring(0, op.length() - 2);
				}
				// 자바빈에 들어가는 데이터
				System.out.println(
						" 캠핑카 이름 : " + campingcar_name 
						+ "\n 캠핑카 정보 : " + campingcar_infos 
						+ "\n 캠핑카 전화번호 : " + campingcar_tel 
						+ "\n 캠핑카 주소 : " + campingcar_address 
						+ "\n 캠핑카 웹사이트 :  " + campingcar_website 
						+ "\n 캠핑카 이미지 주소 : " + img 
						+ "\n 캠핑카 옵션 : " + op
						+ "\n 캠핑카 탑승인원 : " + campingcar_rider 
						+ "\n 캠핑카 수면인원 : " + campingcar_sleeper 
						+ "\n 캠핑카 대여일 대여시간 : " + campingcar_release_time 
						+ "\n 캠핑카 반납일 반납시간 : " + campingcar_return_time 
						+ "\n 캠핑카 면허유무 : " + campingcar_license 
						+ "\n 캠핑카 평일 대여금액 : " + campingcar_wd_fare 
						+ "\n 캠핑카 주말 대여금액 : " + campingcar_ph_fare 
						+ "\n 캠핑카 자세한 정보 : " + campingcar_detail 
						+ "\n 캠핑카 등록 유저 아이디 : " + user_id
						+ "\n 캠핑카 이미지 폴더 : " + campingcar_imgFolder);

				// 비지니스 로직 실행, 캠핑카 데이터 생성
				CampingcarDAO cdao = new CampingcarDAO();
				int cnt = cdao.addCampingcar(vo);

				// 결과에 따라 값 출력
				if (cnt != 0) {
					// 성공했을 경우, 페이지 이동 일단 임의로 인덱스 페이지로
					response.sendRedirect("resist_final.jsp");
				} else {
					// 실패했을 경우
					response.sendRedirect("resist.jsp");
				}
			} catch (Exception e) {
				// 오류 발생시 처리
				e.printStackTrace();
			}

		}
		// 자원 반납
		out.close();

	}
    private String getImgFilename(Part part) {
    	// 변수 선언
        String contentDisp = part.getHeader("content-disposition");
        String temp = "";
        for(String tem : contentDisp.split("form-data;")) {
        	if (tem.trim().startsWith("name=\"campingcar_img\";")) temp += tem;
        }
        
        String[] tamva = temp.split(";");
        for (int i = 0; i < tamva.length; i++) {
            String temp2 = tamva[i];
            if (temp2.trim().startsWith("filename")) {
            	return temp2.substring(temp2.indexOf("=") + 2, temp2.length() - 1);
            }
        }

        return null;
    }

}
