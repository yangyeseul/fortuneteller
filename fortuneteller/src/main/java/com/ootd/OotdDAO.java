package com.ootd;

import java.sql.*;
import com.member.MemberVO;
import com.review.ReviewVO;

public class OotdDAO {
	
	private static OotdDAO instance = null;
	
	private OotdDAO() {
		
	}
	
	public static OotdDAO getInstance() {
		if(instance == null) {
			synchronized (OotdDAO.class) {
				instance = new OotdDAO();
			}
		}
		
		return instance;
	}
	
	
	// 회원 아이디로 회원 이름 찾아오기
	public String searchName(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String userName = "";
		String sql = "";
		
		try {
			conn = ConnUtil.getConnection();
			sql = "select name from member where id = '" + userId + "'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userName = rs.getString("name");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {rs.close();} catch(SQLException s) {}
			} 
			
			if(pstmt != null) {
				try {pstmt.close();} catch(SQLException s) {}
			} 
			
			if(conn != null) {
				try {conn.close();} catch(SQLException s) {}
			} 
		}
		
		System.out.println("회원 이름: " + userName);
		return userName;
	}
	
	
	// 테스트 결과(옷)
	public String searchLook(int resultNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String result = "";
		String sql = "";
		
		try {
			conn = ConnUtil.getConnection();
			sql = "select t_result from ootd where t_num = " + resultNum;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getString("t_result");;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {rs.close();} catch(SQLException s) {}
			} 
			
			if(pstmt != null) {
				try {pstmt.close();} catch(SQLException s) {}
			} 
			
			if(conn != null) {
				try {conn.close();} catch(SQLException s) {}
			} 
		}
		
		System.out.println("테스트 결과: " + result);
		return result;
	}
	
	// 테스트 결과(카드)
	public String searchCard(int resultNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String result = "";
		String sql = "";
		
		try {
			conn = ConnUtil.getConnection();
			sql = "select t_name from ootd where t_num = " + resultNum;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getString("t_name");;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {rs.close();} catch(SQLException s) {}
			} 
			
			if(pstmt != null) {
				try {pstmt.close();} catch(SQLException s) {}
			} 
			
			if(conn != null) {
				try {conn.close();} catch(SQLException s) {}
			} 
		}
		
		System.out.println("테스트 결과: " + result);
		return result;
	}
}
