package biz.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import biz.common.JDBCConnection;

public class ReviewDAO {
	Connection conn;
	PreparedStatement stmt;
	ResultSet rs;
	
	// 생성
	public int addReview(ReviewVO vo) {
		int cnt = 0;
		try {
			conn = JDBCConnection.getConnection();
			String sql = "insert into cb_review values(review_no_seq.nextval, ?, ?, ?, ?)";
			stmt = conn.prepareStatement(sql);
			// 맵핑
			stmt.setInt(1, vo.getReview_score());
			stmt.setString(2, vo.getReview_content());
			stmt.setString(3, vo.getUser_id());
			stmt.setInt(4, vo.getCampingcar_no());
			
			// 실행
			cnt = stmt.executeUpdate();
			if(cnt == 0) System.out.println("리뷰 데이터 추가중 오류가 발생");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(stmt, conn);
		}
		return cnt;
	}
	
	// 읽기
	/** 캠핑카 번호에 따라 리뷰 데이터를 전부 가져오는 메소드 */
	public ArrayList<ReviewVO> getAllReview(int campingcar_no){
		ArrayList<ReviewVO> reviewList = new ArrayList<ReviewVO>();
		try {
			conn = JDBCConnection.getConnection();
			String sql = "select * from cb_review where campingcar_no = ?";
			stmt = conn.prepareStatement(sql);
			// 맵핑
			stmt.setInt(1, campingcar_no);
			// 실행
			rs = stmt.executeQuery();
			while (rs.next()) {
				ReviewVO vo = new ReviewVO();
				vo.setReview_no(rs.getInt(1));
				vo.setReview_score(rs.getInt(2));
				vo.setReview_content(rs.getString(3));
				vo.setUser_id(rs.getString(4));
				vo.setCampingcar_no(rs.getInt(5));
				// 리스트에 추가
				reviewList.add(vo);
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, stmt, conn);;
		}
		
		return reviewList;
	}
	/** 캠핑카 번호에 따라 리뷰 데이터를 가져오는 메소드 */
	public ReviewVO getReview(int review_no) {
		ReviewVO vo = new ReviewVO();
		try {
			conn = JDBCConnection.getConnection();
			String sql = "select * from cb_review where review_no = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, review_no);
			// 실행
			rs = stmt.executeQuery();
			if (rs.next()) {
				vo.setReview_no(rs.getInt(1));
				vo.setReview_score(rs.getInt(2));
				vo.setReview_content(rs.getString(3));
				vo.setUser_id(rs.getString(4));
				vo.setCampingcar_no(rs.getInt(5));
			} else {
				System.out.println("리뷰 데이터 가져오는 과정에서 오류 발생");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	// 수정
	/** 리뷰 데이터 수정하는 메소드 */
	public int upReview(ReviewVO vo) {
		int cnt = 0;
		try {
			conn = JDBCConnection.getConnection();
			String sql = "update cb_review set review_score = ?, review_content = ? "
					+ "where review_no = ?";
			stmt = conn.prepareStatement(sql);
			// 맵핑
			stmt.setInt(1, vo.getReview_score());
			stmt.setString(2, vo.getReview_content());
			stmt.setInt(3, vo.getReview_no());
			
			// 실행
			cnt = stmt.executeUpdate();
			if(cnt == 0) System.out.println("리뷰 데이터 추가중 오류가 발생");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(stmt, conn);
		}
		return cnt;
	}
	
	// 삭제
	/**하나의 리뷰만 삭제하는 메소드*/
	public int deleteReview(int review_no) {
		int cnt = 0;
		try {
			conn = JDBCConnection.getConnection();
			String sql = "delete from cb_review where review_no = ?";
			stmt = conn.prepareStatement(sql);
			// 맵핑
			stmt.setInt(1, review_no);

			// 실행
			cnt = stmt.executeUpdate();
			if(cnt == 0) System.out.println("리뷰 데이터 삭제중 오류가 발생");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(stmt, conn);
		}
		return cnt;
	}
	/**유저를 기준으로 리뷰를 전부 삭제*/
	public int deleteReview(String user_id) {
		int cnt = 0;
		try {
			conn = JDBCConnection.getConnection();
			String sql = "delete from cb_review where user_id = ?";
			stmt = conn.prepareStatement(sql);
			// 맵핑
			stmt.setString(1, user_id);
			
			// 실행
			cnt = stmt.executeUpdate();
			if(cnt == 0) System.out.println("리뷰 데이터 삭제중 오류가 발생");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(stmt, conn);
		}
		return cnt;
	}
	
}
