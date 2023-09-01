package com.constellation;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;



public class ConstellationDAO {
	
	private static ConstellationDAO instance=null;
	
	public ConstellationDAO() {}
	
	public static ConstellationDAO getInstance() {
		
		if(instance==null) {
			synchronized (ConstellationDAO.class) {
				instance = new ConstellationDAO();
			}
		}
		return instance;
	}
	
//아이디를 넣어서 멤버테이블에 검색을 해서 이름이랑 월을 찾고 그 이름이랑 월을 내 vo에 저장
	
	public ConstellationVO getMonth(String id) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ConstellationVO vo=null;
		
		try {
			conn = ConnUtil.getConnection();
			
			String sql = "select name,month,day from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new ConstellationVO();
				vo.setName(rs.getString("name"));
				vo.setConstellMonth(rs.getInt("month"));
				vo.setConstellDay(rs.getInt("day"));
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
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
	}//getMonth
	
	
	public ConstellationVO getResult(int month) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ConstellationVO vo=null;
		
		try {
			
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select * from constellation where constell_month=?");
			pstmt.setInt(1, month);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo =new ConstellationVO();
				vo.setConstellName(rs.getString("constell_name"));
				vo.setTestContent(rs.getString("test_content"));
				vo.setColor(rs.getString("color"));
				vo.setItem(rs.getString("item"));
			}
			
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
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
		
		
		
	}//
	
	
	
	
	/*
	 * public List<InfoVO> getInfo(String id) { Connection conn = null;
	 * PreparedStatement pstmt = null; ResultSet rs = null;
	 * 
	 * List<InfoVO> list = null; try {
	 * 
	 * conn = ConnUtil.getConnection(); pstmt =
	 * conn.prepareStatement("select * from constell_history where id=?");
	 * pstmt.setString(1, id); rs=pstmt.executeQuery();
	 * 
	 * if(rs.next()) { list = new ArrayList<InfoVO>();
	 * 
	 * while(rs.next()) { InfoVO vo =new InfoVO(); vo.setNum(rs.getInt("num"));
	 * vo.setId(rs.getString("id")); vo.setRegdate(rs.getTimestamp("regdate"));
	 * vo.setImage(rs.getString("image")); list.add(vo); } }
	 * 
	 * }catch (Exception e) { e.printStackTrace(); }finally { if(conn != null) { try
	 * {conn.close(); } catch (SQLException s) {s.printStackTrace();} } if(pstmt !=
	 * null) { try {pstmt.close(); } catch (SQLException s) {s.printStackTrace();} }
	 * if(rs != null) { try {rs.close(); } catch (SQLException s)
	 * {s.printStackTrace();} } }
	 * 
	 * return list;
	 * 
	 * 
	 * }//
	 */
	
	

}


