package view.campingcar;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.campingcar.CampingcarDAO;
import biz.review.ReviewDAO;

/**
 * 캠핑카 삭제
 */
@WebServlet("/DeleteCampingcarCtrl")
public class DeleteCampingcarCtrl extends HttpServlet {
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

		// 파라미터 값 받기
		int campingcar_no = Integer.parseInt(request.getParameter("campingcar_no"));

		
		CampingcarDAO cdao = new CampingcarDAO();
		
		// 캠핑카 이미지 데이터 삭제
		ServletContext context = getServletContext(); 
		String path = context.getRealPath("images/detail"); // 실제로 서버에 저장되는 경로 구하기
		String folder = cdao.getCampingcar_imgFolder(campingcar_no);
		path += File.separator + folder;
		File file = new File(path);
		if(file.exists()) { 
			// 파일이 존재 시 삭제 코드 실행
			if(file.isDirectory()) { // 폴더가 파일인지 확인
				File[] data = file.listFiles();
				for(File delete : data) {
					if (delete.delete()) {
						System.out.println("파일 삭제 성공");
					} else {
						System.out.println("파일 삭제 실패");
					}
				}
				if (file.delete()) System.out.println("이미지 파일 폴더 삭제 성공"); // 최종적으로 모든 파일이 삭제 되었을 경우 폴더 삭제
			} 
		}
		
		// 캠핑카 데이터 삭제
		int cnt = cdao.deleteCampingcar(campingcar_no);
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
        if(cnt != 0) {
			out.println("alert('캠핑카 삭제 처리되었습니다.');");
			// 로그인 후 이동할 페이지 *일단 임의로 뒤로가게해서 새로고침
			out.println("location.href=document.referrer;");
		} else {
			// 실패했을 경우
			out.println("alert('오류가 발생했습니다');");
			// 로그인 후 이동할 페이지 *일단 임의로 뒤로가게해서 새로고침
			out.println("history.back();");	
		}
        out.println("</script>");
        out.close();
	}

}
