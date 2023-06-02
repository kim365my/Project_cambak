package view.user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.user.UserDAO;
import biz.user.UserVO;

/**
 * Servlet implementation class getAllUserList
 */
@WebServlet("/getAllUserList")
public class getAllUserList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// 비지니스 로직 실행
		UserDAO udao = new UserDAO();
		ArrayList<UserVO> userList = udao.getALLUser();
		
		// 유저리스트 반환
		request.setAttribute("userList", userList);
		RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
		dis.forward(request, response);

	}
}
