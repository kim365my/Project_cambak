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
   /** 유저 데이터 수정 
    * 	수정 가능한 데이터 : 비번, 이메일, 전화번호
    * 	아이디는 PK로 잡혀있기에 수정이 불가능함
    * */
   public int updateUser(UserVO vo) {
	   int cnt = 0;
	   try {
		   conn = JDBCConnection.getConnection();
		   String sql = "update cb_user set  user_pw = ?, user_tel = ?, user_email = ? where user_id = ?";
		   stmt = conn.prepareStatement(sql);
		   // 맵핑
		   stmt.setString(1, vo.getUser_pw());
		   stmt.setString(2, vo.getUser_tel());
		   stmt.setString(3, vo.getUser_email());
		   stmt.setString(4, vo.getUser_id());
		   
		   // 실행
		   cnt = stmt.executeUpdate();
		   if(cnt == 0) System.out.println("유저 데이터 수정시 DB 오류");
		   
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	   
	   return cnt;
   }
   
   // 삭제
   public int deleteUser(String user_id) {
	   int cnt = 0;
	   try {
			conn = JDBCConnection.getConnection();
			// 자식 데이터를 먼저 삭제해야 오류가 나지 않음
			String sql = "delete from cb_user where user_id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, user_id);
			cnt = stmt.executeUpdate();
			if(cnt == 0) System.out.println("유저 삭제가 되지 않음");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	   return cnt;
   }
}