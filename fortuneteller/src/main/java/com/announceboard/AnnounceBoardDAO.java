package com.announceboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;




public class AnnounceBoardDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private static AnnounceBoardDAO instance = null;
	
	public AnnounceBoardDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public static AnnounceBoardDAO getInstance() {

		if(instance == null) {
			synchronized (AnnounceBoardDAO.class) {
				instance = new AnnounceBoardDAO();
			}
		}
		return instance;
	}
	
	public List<AnnounceBoardVO> getBoardList(int start, int end) {
		conn = null;
		rs = null;
		String sql = "";
		List<AnnounceBoardVO> list = null;

		try {
			sql = "select * from (select rownum rnum, nt_num, nt_writer, nt_subject, nt_readcount,"
					+ "nt_regdate, nt_adjudate, nt_content from (select * from announcement order by nt_num desc))"
					+ "where rnum >=? and rnum <=?";
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list =  new ArrayList<AnnounceBoardVO>(end - start+1);
			do {
				AnnounceBoardVO article = new AnnounceBoardVO();
				article.setNt_num(rs.getInt("nt_num"));
				article.setNt_writer(rs.getString("nt_writer"));
				article.setNt_subject(rs.getString("nt_subject"));
				article.setNt_readcount(rs.getInt("nt_readcount"));
				article.setNt_regdate(rs.getDate("nt_regdate"));
				article.setNt_adjudate(rs.getDate("nt_adjudate"));
				article.setNt_content(rs.getString("nt_content"));
				list.add(article);
				} while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) 
			try{conn.close();
				}catch(SQLException se) {
					se.printStackTrace();
				}
			if(pstmt != null)
			try {
				pstmt.close();
			}catch(SQLException se) {
				se.printStackTrace();
			}
			if(rs != null)
			try {
				rs.close();
			}catch(SQLException se) {
				se.printStackTrace();
			}
		}
		return list;
	}
	
	public AnnounceBoardVO getBoard(String num) {
		conn = null;
		rs = null;
		String sql = "";
		AnnounceBoardVO article = null;
		
		try {
			sql = "select nt_num, nt_subject, nt_content, nt_writer, nt_regdate, nt_readcount from announcement where nt_num=?";
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				article = new AnnounceBoardVO();
				article.setNt_num(rs.getInt("nt_num"));
				article.setNt_subject(rs.getString("nt_subject"));
				article.setNt_content(rs.getString("nt_content"));
				article.setNt_writer(rs.getString("nt_writer"));
				article.setNt_regdate(rs.getDate("nt_regdate"));
				article.setNt_readcount(rs.getInt("nt_readcount"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) 
			try{conn.close();
				}catch(SQLException se) {
					se.printStackTrace();
				}
			if(pstmt != null)
			try {
				pstmt.close();
			}catch(SQLException se) {
				se.printStackTrace();
			}
			if(rs != null)
			try {
				rs.close();
			}catch(SQLException se) {
				se.printStackTrace();
			}
		}
		return article;
	} // end getBoard
	public int getBoardCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int result = 0;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select count(*) from announcement");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(Exception ee) {
			ee.getMessage();
		}finally {
			if(conn != null)try {
					conn.close();
			}catch(SQLException se) {
				se.getMessage();
			}if(pstmt != null)try {
					pstmt.close();
			}catch(SQLException se) {
				se.getMessage();
			}if(rs != null)try {
					rs.close();
			}catch(SQLException se) {
				se.getMessage();
			}
		}
		return result;
	}// end getBoardCount
	public void insertAnnounce(AnnounceBoardVO vo) {
		conn = null;
		pstmt = null;
		String sql = "";
		rs = null;
		int readcount = 0;
		try {
			sql = "insert into announcement values(announcement_no.nextval, ?, ?, ?, ?, ?, ?)";
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNt_writer());
			pstmt.setString(2, vo.getNt_subject());
			pstmt.setInt(3, readcount);
			pstmt.setDate(4, vo.getNt_regdate());
			pstmt.setDate(5, vo.getNt_adjudate());
			pstmt.setString(6, vo.getNt_content());
			pstmt.executeUpdate();
			
		}catch(Exception ee) {
			ee.getMessage();
		}finally {
			if(conn != null)try {
					conn.close();
			}catch(SQLException se) {
				se.getMessage();
			}if(pstmt != null)try {
					pstmt.close();
			}catch(SQLException se) {
				se.getMessage();
			}if(rs != null)try {
					rs.close();
			}catch(SQLException se) {
				se.getMessage();
			}
		}
	}// end insertBoard
	public void updateAnnounce(AnnounceBoardVO vo) {
		conn = null;
		pstmt = null;
		String sql = "";
		rs = null;
		try {
			sql = "update announcement set nt_writer=?, nt_subject=?, nt_adjudate=?, nt_content=? where nt_num=?";
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNt_writer());
			pstmt.setString(2, vo.getNt_subject());
			pstmt.setDate(3, vo.getNt_adjudate());
			pstmt.setString(4, vo.getNt_content());
			pstmt.setInt(5, vo.getNt_num());
			pstmt.executeUpdate();
			
		}catch(Exception ee) {
			ee.getMessage();
		}finally {
			if(conn != null)try {
					conn.close();
			}catch(SQLException se) {
				se.getMessage();
			}if(pstmt != null)try {
					pstmt.close();
			}catch(SQLException se) {
				se.getMessage();
			}if(rs != null)try {
					rs.close();
			}catch(SQLException se) {
				se.getMessage();
			}
		}
	}// end updateBoard
	public void deleteAnnounce(AnnounceBoardVO vo) {
		conn = null;
		pstmt = null;
		String sql = "";
		rs = null;
		try {
			sql = "delete from announcement where nt_num=?";
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getNt_num());
			pstmt.executeUpdate();
			
		}catch(Exception ee) {
			ee.getMessage();
		}finally {
			if(conn != null)try {
					conn.close();
			}catch(SQLException se) {
				se.getMessage();
			}if(pstmt != null)try {
					pstmt.close();
			}catch(SQLException se) {
				se.getMessage();
			}if(rs != null)try {
					rs.close();
			}catch(SQLException se) {
				se.getMessage();
			}
		}
	} // end deleteBoard
	public List<AnnounceBoardVO> getBoardList(String keyword, String search, int start, int end) {
		conn = null;
		rs = null;
		String sql = "";
		List<AnnounceBoardVO> list = null;

		try {
			sql = "select * from (select rownum rnum, nt_num, nt_writer, nt_subject, nt_readcount,"
					+ "nt_regdate, nt_adjudate, nt_content from (select * from announcement where "+keyword+" like '%"+search+"%' order by nt_num desc))"
					+ "where rnum >=? and rnum <=?";
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,start);
				pstmt.setInt(2, end);
				rs = pstmt.executeQuery();
			if(rs.next()) {
				list =  new ArrayList<AnnounceBoardVO>(end - start+1);
			do {
				AnnounceBoardVO article = new AnnounceBoardVO();
				article.setNt_num(rs.getInt("nt_num"));
				article.setNt_writer(rs.getString("nt_writer"));
				article.setNt_subject(rs.getString("nt_subject"));
				article.setNt_readcount(rs.getInt("nt_readcount"));
				article.setNt_regdate(rs.getDate("nt_regdate"));
				article.setNt_adjudate(rs.getDate("nt_adjudate"));
				article.setNt_content(rs.getString("nt_content"));
				list.add(article);
				} while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) 
			try{conn.close();
				}catch(SQLException se) {
					se.printStackTrace();
				}
			if(pstmt != null)
			try {
				pstmt.close();
			}catch(SQLException se) {
				se.printStackTrace();
			}
			if(rs != null)
			try {
				rs.close();
			}catch(SQLException se) {
				se.printStackTrace();
			}
		}
		return list;
	}
	public int getBoardCount(String keyword, String search) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int result = 0;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(
			"select count(*) from announcement where "+keyword+" like '%"+search+"%'");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(Exception ee) {
			ee.getMessage();
		}finally {
			if(conn != null)try {
					conn.close();
			}catch(SQLException se) {
				se.getMessage();
			}if(pstmt != null)try {
					pstmt.close();
			}catch(SQLException se) {
				se.getMessage();
			}if(rs != null)try {
					rs.close();
			}catch(SQLException se) {
				se.getMessage();
			}
		}
		return result;
	}// end getBoardCount
	public void setViewCount(AnnounceBoardVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("update announcement set nt_readcount=nt_readcount+1 where nt_num=?");
			pstmt.setInt(1, vo.getNt_num());
			rs = pstmt.executeQuery();
		}catch(Exception ee) {
			ee.getMessage();
		}finally {
			if(conn != null)try {
					conn.close();
			}catch(SQLException se) {
				se.getMessage();
			}if(pstmt != null)try {
					pstmt.close();
			}catch(SQLException se) {
				se.getMessage();
			}if(rs != null)try {
					rs.close();
			}catch(SQLException se) {
				se.getMessage();
			}
		}
	}// end setViewCount
}