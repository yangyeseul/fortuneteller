package com.qnaboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class QnaBoardDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private static QnaBoardDAO instance = null;
	
	public QnaBoardDAO() {
	}
	
	public static QnaBoardDAO getInstance() {
		if(instance == null) {
			synchronized (QnaBoardDAO.class) {
				instance = new QnaBoardDAO();
			}
		}
		return instance;
	}
	public List<QnaBoardVO> getBoardList(int start, int end) {
		conn = null;
		rs = null;
		String sql = "";
		List<QnaBoardVO> list = null;

		try {
			sql = "select * from (select rownum rnum, qa_num, qa_writer, qa_subject, qa_readcount,"
					+ "qa_regdate, qa_content from (select * from qnaboard order by qa_num desc))"
					+ "where rnum >=? and rnum <=?";
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list =  new ArrayList<QnaBoardVO>(end - start+1);
			do {
				QnaBoardVO article = new QnaBoardVO();
				article.setQa_num(rs.getInt("qa_num"));
				article.setQa_writer(rs.getString("qa_writer"));
				article.setQa_subject(rs.getString("qa_subject"));
				article.setQa_readcount(rs.getInt("qa_readcount"));
				article.setQa_regdate(rs.getDate("qa_regdate"));
				article.setQa_content(rs.getString("qa_content"));
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
	}// end getBoardList
	public List<QnaBoardVO> getBoardList(String keyword, String search, int start, int end) {
		conn = null;
		rs = null;
		String sql = "";
		List<QnaBoardVO> list = null;

		try {
			sql = "select * from (select rownum rnum, qa_num, qa_writer, qa_subject, qa_readcount,"
			+ "qa_regdate, qa_content from (select * from qnaboard where "+keyword+" like '%"+search+"%' order by qa_num desc))"
			+ "where rnum >=? and rnum <=?";
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,start);
				pstmt.setInt(2, end);
				rs = pstmt.executeQuery();
			if(rs.next()) {
				list =  new ArrayList<QnaBoardVO>(end - start+1);
			do {
				QnaBoardVO article = new QnaBoardVO();
				article.setQa_num(rs.getInt("qa_num"));
				article.setQa_writer(rs.getString("qa_writer"));
				article.setQa_subject(rs.getString("qa_subject"));
				article.setQa_readcount(rs.getInt("qa_readcount"));
				article.setQa_regdate(rs.getDate("qa_regdate"));
				article.setQa_content(rs.getString("qa_content"));
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
	}//end getBoardList
	public QnaBoardVO getBoard(String num) {
		conn = null;
		rs = null;
		String sql = "";
		QnaBoardVO article = null;
		
		try {
			sql = "select qa_num, qa_subject, qa_content, qa_writer, qa_regdate, qa_readcount from qnaboard where qa_num=?";
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				article = new QnaBoardVO();
				article.setQa_num(rs.getInt("qa_num"));
				article.setQa_subject(rs.getString("qa_subject"));
				article.setQa_content(rs.getString("qa_content"));
				article.setQa_writer(rs.getString("qa_writer"));
				article.setQa_regdate(rs.getDate("qa_regdate"));
				article.setQa_readcount(rs.getInt("qa_readcount"));
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
			pstmt = conn.prepareStatement("select count(*) from qnaboard");
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
	public int getBoardCount(String keyword, String search) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int result = 0;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(
			"select count(*) from qnaboard where "+keyword+" like '%"+search+"%'");
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
	public void setViewCount(QnaBoardVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("update qnaboard set qa_readcount=qa_readcount+1 where qa_num=?");
			pstmt.setInt(1, vo.getQa_num());
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
	public void insertQna(QnaBoardVO vo) {
		conn = null;
		pstmt = null;
		String sql = "";
		rs = null;
		try {
			sql = "insert into qnaboard (qa_num, qa_writer, qa_subject, qa_regdate, qa_content)"
					+ " values(qna_no.nextval, ?, ?, ?, ?)";
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getQa_writer());
			pstmt.setString(2, vo.getQa_subject());
			pstmt.setDate(3, vo.getQa_regdate());
			pstmt.setString(4, vo.getQa_content());
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
	}// end insertQna
	public void updateQna(QnaBoardVO vo) {
		conn = null;
		pstmt = null;
		String sql = "";
		rs = null;
		try {
			sql = "update qnaboard set qa_writer=?, qa_subject=?, qa_regdate=?, qa_content=? where qa_num=?";
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getQa_writer());
			pstmt.setString(2, vo.getQa_subject());
			pstmt.setDate(3, vo.getQa_regdate());
			pstmt.setString(4, vo.getQa_content());
			pstmt.setInt(5, vo.getQa_num());
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
	}// end updateQna
	public void deleteQna(QnaBoardVO vo) {
		conn = null;
		pstmt = null;
		String sql = "";
		rs = null;
		try {
			sql = "delete from qnaboard where qa_num=?";
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getQa_num());
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
	} // end deleteQna
}
