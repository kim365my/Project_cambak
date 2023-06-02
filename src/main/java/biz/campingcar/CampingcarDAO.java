package biz.campingcar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import biz.common.JDBCConnection;

public class CampingcarDAO {
	Connection conn;
	PreparedStatement stmt;
	ResultSet rs;
	
	// 생성
	/** 캠핑카 데이터 추가 메소드 
	 * <<주의>> 데이터를 null 값이 안들어가게 연결할 때 신경 써서 처리해야 함
	 * */
	public int addCampingcar(CampingcarVO vo) {
		int cnt = 0;
		String option = "";
		for(String op : vo.getCampingcar_option()) {
			option += op + ", ";
		}
		
		try {
			// DB 연결
			conn = JDBCConnection.getConnection();
			String sql = "insert into cb_campingcar values(CAMPINGCAR_NO_SEQ.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?, ?,sysdate)";
			stmt = conn.prepareStatement(sql);
			// 맴핑
			stmt.setString(1, vo.getCampingcar_name()); // 이름
			stmt.setString(2, vo.getCampingcar_infos()); // 상세정보
			stmt.setString(3, vo.getCampingcar_tel()); // 전화번호
			stmt.setString(4, vo.getCampingcar_address()); // 주소
			stmt.setString(5, vo.getCampingcar_website()); // 웹 사이트
			stmt.setString(6, vo.getCampingcar_img()); // 이미지 이름
			stmt.setString(7, option); // 옵션
			stmt.setInt(8, vo.getCampingcar_rider()); // 탑승 가능 인원수
			stmt.setInt(9, vo.getCampingcar_sleeper()); // 취침 가능인원수
			stmt.setString(10, vo.getCampingcar_release_time()); // 대여일 대여시간
			stmt.setString(11, vo.getCampingcar_return_time()); // 반납일 반납시간
			stmt.setString(12, vo.getCampingcar_license()); // 운전면허 종류
			stmt.setInt(13, vo.getCampingcar_wd_fare()); // 주중 요금
			stmt.setInt(14, vo.getCampingcar_ph_fare()); // 공휴일 요금
			stmt.setString(15, vo.getCampingcar_detail()); // 상세페이지
			stmt.setString(16, vo.getUser_id()); // 유저 아이디
			stmt.setInt(17, 0); // 조회수
			
			// 실행
			cnt = stmt.executeUpdate();
			// 오류처리
			if (cnt == 0) System.out.println("캠핑카 추가 로직에서 오류남");
			
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
	/** 상세페이지 | 개별 데이터 불러와서 읽는 메소드 */
	public CampingcarVO getCampingcar(int campingcar_no) {
		CampingcarVO vo = null;
		try {
			conn = JDBCConnection.getConnection();
			String sql = "select * from cb_campingcar where campingcar_no = ?";
			stmt = conn.prepareStatement(sql);
			// 맴핑
			stmt.setInt(1, campingcar_no);
			
			// 실행
			rs = stmt.executeQuery();
			if (rs.next()) {
				vo = new CampingcarVO();
				vo.setCampingcar_no(rs.getInt(1)); // 번호
				vo.setCampingcar_name(rs.getString(2)); // 이름
				vo.setCampingcar_infos(rs.getString(3)); // 상세정보
				vo.setCampingcar_tel(rs.getString(4)); // 전화번호
				vo.setCampingcar_address(rs.getString(5)); // 주소
				vo.setCampingcar_website(rs.getString(6)); // 웹 사이트
				vo.setCampingcar_img(rs.getString(7)); // 이미지
				// 배열로 전환
				String op = rs.getString(8);
				vo.setCampingcar_option(op.split(", ")); // 옵션
				vo.setCampingcar_rider(rs.getInt(9)); // 탑승가능 인원수
				vo.setCampingcar_sleeper(rs.getInt(10)); // 취침가능 인원수
				vo.setCampingcar_release_time(rs.getString(11)); // 대여일 대여시간
				vo.setCampingcar_return_time(rs.getString(12)); // 반납일 반납시간
				vo.setCampingcar_license(rs.getString(13)); // 면허증 종류
				vo.setCampingcar_wd_fare(rs.getInt(14)); // 주중요금 
				vo.setCampingcar_ph_fare(rs.getInt(15)); // 공휴일 요금
				vo.setCampingcar_detail(rs.getString(16)); // 세부 정보
				vo.setUser_id(rs.getString(17)); // 유저 아이디
				vo.setCampingcar_cnt(rs.getInt(18)); // 조회수
				vo.setCampingcar_regdate(rs.getString(19)); // 생성일
			} else {
				System.out.println(campingcar_no + "번의 캠핑카 데이터를 불러오는 과정에서 오류발생");
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		
		return vo;
	}
	
	/** 전체 데이터 불러와서 읽는 메소드 */
	public ArrayList<CampingcarVO> getALLCampingcar() {
		ArrayList<CampingcarVO> campingcarList = new ArrayList<CampingcarVO>();
		try {
			conn = JDBCConnection.getConnection();
			String sql = "select * from cb_campingcar";
			stmt = conn.prepareStatement(sql);
			// 실행
			rs = stmt.executeQuery();
			while (rs.next()) {
				CampingcarVO vo = new CampingcarVO();
				vo.setCampingcar_no(rs.getInt(1)); // 번호
				vo.setCampingcar_name(rs.getString(2)); // 이름
				vo.setCampingcar_infos(rs.getString(3)); // 상세정보
				vo.setCampingcar_tel(rs.getString(4)); // 전화번호
				vo.setCampingcar_address(rs.getString(5)); // 주소
				vo.setCampingcar_website(rs.getString(6)); // 웹 사이트
				vo.setCampingcar_img(rs.getString(7)); // 이미지
				// 배열로 전환
				String op = rs.getString(8);
				vo.setCampingcar_option(op.split(", ")); // 옵션
				vo.setCampingcar_rider(rs.getInt(9)); // 탑승가능 인원수
				vo.setCampingcar_sleeper(rs.getInt(10)); // 취침가능 인원수
				vo.setCampingcar_release_time(rs.getString(11)); // 대여일 대여시간
				vo.setCampingcar_return_time(rs.getString(12)); // 반납일 반납시간
				vo.setCampingcar_license(rs.getString(13)); // 면허증 종류
				vo.setCampingcar_wd_fare(rs.getInt(14)); // 주중요금 
				vo.setCampingcar_ph_fare(rs.getInt(15)); // 공휴일 요금
				vo.setCampingcar_detail(rs.getString(16)); // 세부 정보
				vo.setUser_id(rs.getString(17)); // 유저 아이디
				vo.setCampingcar_cnt(rs.getInt(18)); // 조회수
				vo.setCampingcar_regdate(rs.getString(19)); // 생성일
				// 리스트에 주가하기
				campingcarList.add(vo);
			}
			if (rs.getRow() == 0) System.out.println("캠핑카 데이터를 전부 불러오는 과정에서 오류발생");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		
		return campingcarList;
	}
	

	/** 대시보드 페이지 | 필요한 데이터 모두 불러오기 */
	public ArrayList<CampingcarViewVO> getALLCampingcar(String user_id) {
		ArrayList<CampingcarViewVO> campingcarList = new ArrayList<>();
		try {
			conn = JDBCConnection.getConnection();
			String sql = "select * from cd_deshBoard_view where user_id = ?";
			stmt = conn.prepareStatement(sql);
			// 맵핑
			stmt.setString(1, user_id);
			
			// 실행
			rs = stmt.executeQuery();
			while (rs.next()) {
				CampingcarViewVO vo = new CampingcarViewVO();
				vo.setCampingcar_no(rs.getInt(1));
				vo.setCampingcar_regdate(rs.getString(2));
				vo.setReview_score(rs.getInt(3));
				vo.setCampingcar_cnt(rs.getInt(4));
				vo.setUser_id(rs.getString(5));
				
				// 리스트에 주가하기
				campingcarList.add(vo);
			}
			if (rs.getRow() == 0) System.out.println("대시보드의 캠핑카뷰 데이터를 전부 불러오는 과정에서 오류발생");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		
		return campingcarList;
	}
	
	
	
	
	// 수정
	/** 캠핑카 데이터 개별 수정하는 메소드 
	 * 전체 수정하는건 나중에
	 * */
	public int upCampingcar(String column, String data) {
		int cnt = 0;
		try {
			// DB 연결
			conn = JDBCConnection.getConnection();
			String sql = "update table cb_campingcar set "+column+" = ?";
			stmt = conn.prepareStatement(sql);
			// 맴핑
			stmt.setString(1, data);
			
			// 실행
			cnt = stmt.executeUpdate();
			// 오류처리
			if (cnt == 0) System.out.println("캠핑카 업데이트 로직에서 오류남");
			
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
	/** 캠핑카 데이터 개별 삭제하는 메소드 */
	public int deleteCampingcar(int campingcar_no) {
		int cnt = 0;
		try {
			// DB 연결
			conn = JDBCConnection.getConnection();
			String sql = "delete cb_campingcar where campingcar_no = ?";
			stmt = conn.prepareStatement(sql);
			// 맴핑
			stmt.setInt(1, campingcar_no);
			// 실행
			cnt = stmt.executeUpdate();
			// 오류처리
			if (cnt == 0) System.out.println("캠핑카 삭제 로직에서 오류남");
			
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
