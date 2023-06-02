package view.review;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.review.ReviewDAO;
import biz.review.ReviewVO;

@WebServlet("/GetReviewCtrl")
public class GetReviewCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGetPost(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGetPost(request, response);
   }

   protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   int campingcar_no = Integer.parseInt(request.getParameter("campingcar_no"));
		
      ReviewDAO rdao = new ReviewDAO();
      ArrayList<ReviewVO> reviewList = rdao.getAllReview(campingcar_no);
      // 바인딩
      request.setAttribute("reviewList", reviewList);
      // 포워드
      RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
      dis.forward(request, response);
   }


}