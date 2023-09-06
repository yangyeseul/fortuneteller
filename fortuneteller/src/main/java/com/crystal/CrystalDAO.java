package com.crystal;

import java.util.*;
import java.sql.*;
import javax.sql.*;

public class CrystalDAO {

	private static CrystalDAO instance=null;
	
	public CrystalDAO() {
		
	}
	
	public static CrystalDAO getInstance() { //DB 연동
		
		if(instance==null) {
			synchronized (CrystalDAO.class) { //변수와 함수에 사용해서 동기화
				instance=new CrystalDAO();
			}
		}
		return instance;
	}
	


//아이디로 멤버테이블 검색해서 이름찾아 불러오기
	public CrystalVO getName(String id) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CrystalVO vo=null;
		
		try {
			conn = ConnUtil.getConnection();
			
			String sql="select name from member where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery(); // 수행 결과로 resultSet객체의 값을 반환(select 구문 사용시 이용되는 함수)
			
			if(rs.next()) {
				vo=new CrystalVO();
				vo.setName(rs.getString("name"));
			}
			
		}catch (Exception e) { //예외처리
			e.printStackTrace(); //에러의 발생근원지를 찾아서 단계별로 에러를 출력
		}finally {
			if(conn != null) {
				try {conn.close();
				} catch (SQLException s) {s.printStackTrace();}
			}
			if(pstmt != null) {
				try {pstmt.close();
				} catch (SQLException s) {s.printStackTrace();}
			}
			if(rs != null) {
				try {rs.close();
				} catch (SQLException s) {s.printStackTrace();}
			}
		}
		return vo;
	}
	
	
	
//결과값(랜덤) 불러오기-------content
	public CrystalVO getResult(String crystalResult) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CrystalVO vo=null;
		
		//String crystalContent="";
		//String crystalImage="";
		System.out.println();
		
		try {
			conn = ConnUtil.getConnection(); //DB 연결
			
			String sql= "Select * from (select * from "+crystalResult+" order by DBMS_RANDOM.value) where rownum = 1";
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, crystalResult);
			
			rs = pstmt.executeQuery(); // 수행 결과로 resultSet객체의 값을 반환(select 구문 사용시 이용되는 함수)
			
			if(rs.next()) {
				vo=new CrystalVO();
				//crystalContent=rs.getString("content");
				//crystalImage=rs.getString("image");
				
				vo.setContent(rs.getString("content"));
				vo.setImage(rs.getString("image"));
			}
			
		}catch (Exception e) { //예외처리
			e.printStackTrace(); //에러의 발생근원지를 찾아서 단계별로 에러를 출력
		}finally {
			if(conn != null) {
				try {conn.close();
				} catch (SQLException s) {s.printStackTrace();}
			}
			if(pstmt != null) {
				try {pstmt.close();
				} catch (SQLException s) {s.printStackTrace();}
			}
			if(rs != null) {
				try {rs.close();
				} catch (SQLException s) {s.printStackTrace();}
			}
		}
		
		System.out.println("테스트 결과: " + vo.getContent());
		/* return crystalContent; */
		return vo;
	}
}