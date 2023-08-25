package com.qnaboard.comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qnaboard.ConnUtil;


public class QnaCommentDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private static QnaCommentDAO instance = null;
	
	public QnaCommentDAO() {
	}
	
	public static QnaCommentDAO getInstance() {
		if(instance == null) {
			synchronized (QnaCommentDAO.class) {
				instance = new QnaCommentDAO();
			}
		}
		return instance;
	}
	public List<QnaCommentVO> getCommentList(String num) {
		conn = null;
		rs = null;
		String sql = "";
		List<QnaCommentVO> list = null;

		try {
			sql = "select * from qa_comment where com_ref in (select qa_num from qnaboard where qa_num=?) order by com_regdate desc";
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list =  new ArrayList<QnaCommentVO>();
			do {
				QnaCommentVO article = new QnaCommentVO();
				article.setCom_num(rs.getInt("com_num"));
				article.setCom_writer(rs.getString("com_writer"));
				article.setCom_regdate(rs.getDate("com_regdate"));
				article.setCom_content(rs.getString("com_content"));
				article.setCom_ref(rs.getInt("com_ref"));
				article.setCom_step(rs.getInt("com_step"));
				article.setCom_depth(rs.getInt("com_depth"));
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
	}// end getCommentList
	public int getCommentCount(String num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int result = 0;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select count(*) from qa_comment where com_ref=?");
			pstmt.setString(1, num);
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
	}// end getCommentCount
	public void insertComment(QnaCommentVO vo) {
		conn = null;
		pstmt = null;
		String sql = "";
		rs = null;
		try {
			sql = "insert into qa_comment (com_num, com_writer, com_content, com_regdate, com_ref)values(com_no.nextval, ?, ?, ?, ?)";
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getCom_writer());
			pstmt.setString(2, vo.getCom_content());
			pstmt.setDate(3, vo.getCom_regdate());
			pstmt.setInt(4, vo.getCom_num());
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
	}// end insertComment
	public void updateComment(QnaCommentVO vo) {
		conn = null;
		pstmt = null;
		String sql = "";
		rs = null;
		try {
			sql = "update qa_comment set com_writer=?, com_regdate=?, com_content=? where com_num=?";
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getCom_writer());
			pstmt.setDate(2, vo.getCom_regdate());
			pstmt.setString(3, vo.getCom_content());
			pstmt.setInt(4, vo.getCom_num());
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
	public void deleteComment(QnaCommentVO vo) {
		conn = null;
		pstmt = null;
		String sql = "";
		rs = null;
		try {
			sql = "delete from qa_comment where com_num=?";
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getCom_num());
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
	} // end deleteComment
}
