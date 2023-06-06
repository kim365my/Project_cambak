package view.campingcar;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

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
		String name = null;
		
		if (ServletFileUpload.isMultipartContent(request)) {
			ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
			// 인코딩 설정
			uploadHandler.setHeaderEncoding("UTF-8");
			List<FileItem> items = uploadHandler.parseRequest((RequestContext) request);
			// foreach 문으로 반복문 돌리기
			for (FileItem item : items) {
				if (item.getFieldName().equals("callback")) {
					callback = item.getString("UTF-8");
				} else if (item.getFieldName().equals("callback_func")) {
					callback_func = "?callback_func=" + item.getString("UTF-8");
				} else if (item.getFieldName().equals("Filedata")) {
					if (item.getSize() > 0) {
						name = item.getName().substring(item.getName().lastIndexOf((File.separator)+1));
						String filename_ext = name.substring(name.lastIndexOf((name.lastIndexOf(".")+1)));
						filename_ext = filename_ext.toLowerCase();
						// 파일 확장자 검사를 위한 배열
						String[] allow_file = {"jpg", "png", "bmp", "gif"};
						
						// 파일 확장자 검사
						int cnt = 0;
						for (int i = 0; i < allow_file.length; i++) {
							if (filename_ext.equals(allow_file[i])) cnt++;
						}
						if (cnt == 0) {
							// 파일 확장자가 맞지 않는다면 에러 메세지를 전송하게 됨
							result = "&errstr=" + name;
						} else {
							// 파일 추가하기
							ServletContext context = getServletContext(); 
							String url = "images/detail"; // 파일을 저장할 URL 지정
							String path = context.getRealPath(url); // 실제로 서버에 저장되는 경로 구하기
							
							// 폴더 생성하기
							CampingcarDAO cdao = new CampingcarDAO();
							String no = Integer.toString(cdao.getNextNo());
							// 번호에 따라 폴더 생성
							File file = new File(path + "\\" + no);
							
							if(!file.exists()) { // 해당 폴더가 존재하는지 하는지 여부
								file.mkdir(); // 해당 폴더 생성
								path += "/" + no; // url 수정
							}
							
							
							try {
								// 파일 사이즈 설정
								int size = 1024 * 1024 * 50; // 50MB
								
								System.out.println("절대 경로 : " + path + "<br/>");
								MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
								
								// images/detail/넘버 폴더에 저장한 전체 파일 이름 가져오기
								Enumeration<?> files = multi.getFileNames();
								String str = (String) files.nextElement();
								// 현재 이름
								String fileName = multi.getFilesystemName(str);
								// 원래 이름 가져오기
								String oriName = multi.getOriginalFileName(str);
								
								
								// 파일에 랜덤 이름넣기
								// String fileName = UUID.randomUUID().toString();
								file_result += "&bNewLine=true&sFileName=" + oriName + "&sFileURL=" + url + "/" + fileName;
								
							} catch (Exception e) {
								e.printStackTrace();
							}
							result = "redirect:" + callback + "?callback_func=" + URLEncoder.encode(callback_func, "UTF-8") + file_result;
						}
						
					}
				}
			}
			
		}
		
		// 결과갑 전송
		response.sendRedirect(result);
	}

}
