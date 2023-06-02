package biz.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import biz.common.JDBCConnection;

public class UserDAO {
	Connection conn;
	PreparedStatement stmt;
	ResultSet rs;
	// 생성
	/** 회원가입 처리 */
   public int addUser(UserVO vo) {
      int cnt = 0;
      try {
         conn = JDBCConnection.getConnection();
         // sql
         String sql = "insert into cb_user values(?,?,?,?)";
         stmt = conn.prepareStatement(sql);
         // 매핑
         stmt.setString(1, vo.getUser_id());
         stmt.setString(2, vo.getUser_pw());
         stmt.setString(3, vo.getUser_email());
         stmt.setString(4, vo.getUser_tel());
         // 실행
         cnt = stmt.executeUpdate();
         
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         JDBCConnection.close(stmt, conn);
      }
      return cnt;
   }
   
	// 읽기
	/** 로그인 처리 */
   public int getUser(String id, String pw) {
      int cnt = 0;
      try {
         // db
         conn = JDBCConnection.getConnection();
         // sql
         String sql = "select count(max(user_id)) from cb_user where user_id = ? and user_pw = ? "
         		+ "group by user_id";
         // stmt
         stmt = conn.prepareStatement(sql);
         // 매핑
         stmt.setString(1, id);
         stmt.setString(2, pw);
         // 실행
         rs = stmt.executeQuery();
         if(rs.next()) {
        	 cnt = rs.getInt(1);
         } else {
        	 System.out.println("로그인 처리중 비지니스로직에서 오류");
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         JDBCConnection.close(rs, stmt, conn);
      }
      return cnt;
   }// end of method
   
   /**회원 정보 전부 가져오기*/
   public ArrayList<UserVO> getALLUser() {
	   ArrayList<UserVO> userList = new ArrayList<UserVO>();
	   try {
		conn = JDBCConnection.getConnection();
		String sql = "select * from cb_user";
		stmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery();
		while (rs.next()) {
			UserVO vo = new UserVO();
			vo.setUser_id(rs.getString(1));
			vo.setUser_pw(rs.getString(2));
			vo.setUser_email(rs.getString(3));
			vo.setUser_tel(rs.getString(4));
			userList.add(vo);
		}
		if(rs.getRow() == 0) System.out.println("로그인 처리중 비지니스로직에서 오류");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, stmt, conn);
	    }
	   
	   return userList;
   }
   
   // 수정
   
   // 삭제
   
}