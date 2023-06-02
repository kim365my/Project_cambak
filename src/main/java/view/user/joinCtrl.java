package view.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.user.UserDAO;
import biz.user.UserVO;

/**
 * Servlet implementation class joinCtrl
 */
@WebServlet("/joinCtrl")
public class joinCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
	      // 폼데이터
	      String id = request.getParameter("user_id");
	      String pw = request.getParameter("user_pw");
	      String pw2 = request.getParameter("pw2");
	      String email = request.getParameter("user_email");
	      String tel = request.getParameter("user_tel");
	      
	      
	      // 비밀번호가 동일한 지 확인 결과 출력
	      PrintWriter out = response.getWriter();
	      if(pw.equals(pw2)) {
	    	  // 비밀번호가 동일한 경우 회원가입처리
	    	  // 자바빈에 데이터 저장
	    	  UserVO bean = new UserVO();
	    	  bean.setUser_id(id);
	    	  bean.setUser_pw(pw);
	    	  bean.setUser_email(email);
	    	  bean.setUser_tel(tel);
	         UserDAO udao = new UserDAO();
	         udao.addUser(bean);
	         out.println("alert('회원가입 처리되었습니다.');");
	         out.println("location.href='index.jsp';");
	      } else {
	    	  out.println("alert('비밀번호가 달라요.');");
	    	  out.println("location.href='index.jsp';");
	      } //end of if
	      out.close();
	}

}
