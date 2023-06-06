package view.campingcar;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Enumeration;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import biz.campingcar.CampingcarDAO;

/**
 * 캠핑카 등록시 상세페이지 이미지 저장하는 페이지
 */
@WebServlet("/AddCampingcarDetailImgCtrl")
public class AddCampingcarDetailImgCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/x-json; charset=UTF-8");
		
		System.out.println("서블릿파일 접속");
		// 변수 선언
		String callback = null; //smarteditorVO.getCallback();
		String callback_func = null; //smarteditorVO.getCallback_func();
		String file_result = "";
		String result = null;
		
		
		// 실제로 서버에 저장되는 경로 구하기
		ServletContext context = getServletContext();
		// 파일을 저장할 URL 지정
		String url = "images/detail";
		String path = context.getRealPath(url);
		
		// 폴더 생성하기
		CampingcarDAO cdao = new CampingcarDAO();
		String no = Integer.toString(cdao.getNextNo());
		// 번호에 따라 폴더 생성
		File file = new File(path + "\\" + no);
		if(file.exists()) {
			// 파일이 생성 된 것이 맞을 경우 url 수정
			file.mkdir(); // 파일 생성
			path += "/" + no; // url 수정
		}
		
		
		String imgName = "";
		try {
			// 파일 사이즈 설정
			int size = 1024 * 1024 * 50; // 50MB
			
			System.out.println("절대 경로 : " + path + "<br/>");
			MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
			
			// images/detail/넘버 폴더에 저장한 전체 파일 이름 가져오기
			Enumeration<?> files = multi.getFileNames();
			
			while (files.hasMoreElements()) {					
				// 개별 접근
				String str = (String) files.nextElement();
				// 중복처리, 이름이 중복되면 파일 이름을 변경해서 출력함 (다운로드 기능 만들것도 아니니까 변경된 이름만 저장)
				imgName += multi.getFilesystemName(str) + ", ";
			}
			
			// 파일에 랜덤 이름넣기
			String fileName = UUID.randomUUID().toString();
			file_result += "&bNewLine=true&FileName=" + oriName + "&sFileURL=" + url;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		result = "redirect:" + callback + "?callback_func=" + URLEncoder.encode(callback_func, "UTF-8") + file_result;
		
		
		return result;
	}

}
