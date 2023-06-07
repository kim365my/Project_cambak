package view.campingcar;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileUpload;
import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.apache.jasper.tagplugins.jstl.core.If;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import biz.campingcar.CampingcarDAO;
import biz.campingcar.CampingcarVO;
import biz.user.loginCK;

/**
 * Servlet implementation class AddCampingcarCtrl
 */
@WebServlet("/AddCampingcarCtrl2")
@MultipartConfig(
    fileSizeThreshold = 1024*1024,
    maxFileSize = 1024*1024*50, //50메가
    maxRequestSize = 1024*1024*50*5 // 50메가 5개까지
)

public class AddCampingcarCtrl구구구버전 extends HttpServlet {
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
			if(!file.exists()) file.mkdir(); // 파일 생성 코드  
			path += File.separator + no; // 파일이 생성 된 것이 맞을 경우 url 수정
			System.out.println("절대 경로 : " + path);
			
			String campingcar_name, campingcar_infos, campingcar_tel, campingcar_address, campingcar_website, campingcar_release_time, campingcar_return_time, campingcar_license, img;
			String[] campingcar_option;
			int campingcar_rider, campingcar_sleeper, campingcar_wd_fare, campingcar_ph_fare;
			try {
				int size = 1024 * 1024 * 256; // 파일 사이즈 설정 : 256M				
				// 파일 업로드 요청이 있는지 확인
				//boolean isMultipart = ServletFileUpload.isMultipartContent(request);
				part
				
				// 팩토리 생성
				DiskFileItemFactory fileItemFactory = new DiskFileItemFactory(size, file);
				ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
				fileUpload.setSizeMax(size);
				// 요청 파싱해서 목록 구하기
				List<FileItem> items = fileUpload.parseRequest(request);
				
				Iterator<FileItem> iter = items.iterator();
				while (iter.hasNext()) {
				    FileItem item = iter.next();
				    if (item.isFormField()) {
						// 파일이 아닌 경우 파라미터 값 받기
						campingcar_name = item.getString("campingcar_name");
						campingcar_infos = item.getString("campingcar_infos");
						campingcar_tel = item.getString("campingcar_tel");
						campingcar_address = item.getString("campingcar_address");
						campingcar_website = item.getString("campingcar_website");
						campingcar_option = item.getString("campingcar_option");

						campingcar_rider = Integer.parseInt(item.getString("campingcar_rider").replaceAll("명", ""));
						campingcar_sleeper = Integer.parseInt(item.getString("campingcar_sleeper").replaceAll("명", ""));

						campingcar_release_time = item.getString("campingcar_release_time");
						campingcar_return_time = item.getString("campingcar_return_time");
						campingcar_license = item.getString("campingcar_license");

						String wd_fare = item.getString("campingcar_wd_fare");
						campingcar_wd_fare = (wd_fare == null || wd_fare.isEmpty()) ? 0 : Integer.parseInt(wd_fare);												

						String ph_fare = item.getString("campingcar_ph_fare");
						campingcar_ph_fare = (ph_fare == null || ph_fare.isEmpty()) ? 0 : Integer.parseInt(ph_fare);

				    	} 
					} else {
						// 파일인 경우
						// 주의점 : 파일크기가 0인 항목에 대해서도 FileItem 객체가 생성되므로 FileItem.getSize가 0인 경우 알맞게 예외 처리할 것
						item.getInputStream();
						
					}
				}
				
				
				
				String[] campingcar_img = img.split(", "); // 배열 반환
				String campingcar_detail = item.getString("campingcar_detail"); // 파일 위치 전달

				// --------------------------------
				// no와 조회수와 생성일은 DB에서 초기값으로 넣음
				CampingcarVO vo = new CampingcarVO(0, campingcar_name, campingcar_infos, campingcar_tel,
						campingcar_address, campingcar_website, campingcar_img, campingcar_option, campingcar_rider,
						campingcar_sleeper, campingcar_release_time, campingcar_return_time, campingcar_license,
						campingcar_wd_fare, campingcar_ph_fare, campingcar_detail, user_id, 00, null);
				String op = "";
				for(String option : campingcar_option) {
					op += option + ", ";
				}
				// 자바빈에 들어가는 데이터
				System.out.println("캠핑카 이름 : " + campingcar_name 
						+ "\n 캠핑카 정보 : " + campingcar_infos 
						+ "\n 캠핑카 전화번호 : " + campingcar_tel 
						+ "\n 캠핑카 주소 : " + campingcar_address 
						+ "\n 캠핑카 웹사이트 :  " + campingcar_website 
						+ "\n 캠핑카 이미지 주소 : " + img 
						+ "\n캠핑카 옵션 : " + op
						+ "\n 캠핑카 탑승인원 : " + campingcar_rider 
						+ "\n 캠핑카 수면인원 : " + campingcar_sleeper 
						+ "\n 캠핑카 대여일 대여시간 : " + campingcar_release_time 
						+ "\n 캠핑카 반납일 반납시간 : " + campingcar_return_time 
						+ "\n 캠핑카 면허유무 : " + campingcar_license 
						+ "\n 캠핑카 평일 대여금액 : " + campingcar_wd_fare 
						+ "\n 캠핑카 주말 대여금액 : " + campingcar_ph_fare 
						+ "\n 캠핑카 자세한 정보 : " + campingcar_detail 
						+ "\n 캠핑카 등록 유저 아이디 : " + user_id);

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
