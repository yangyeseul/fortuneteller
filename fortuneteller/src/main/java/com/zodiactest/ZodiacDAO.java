package com.zodiactest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.member.MemberVO;

public class ZodiacDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private static ZodiacDAO instance = null;
	
	public ZodiacDAO() {
		
	}
	
	public static ZodiacDAO getInstance() {

		if(instance == null) {
			synchronized (ZodiacDAO.class) {
				instance = new ZodiacDAO();
			}
		}
		return instance;
	}
	
	public MemberVO setMember(String id) throws SQLException{
		conn = null;
		rs = null;
		MemberVO article = null;
		String sql = "";
		try {
			
			sql = "select year from member where id=?";
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				article = new MemberVO();
				article.setYear(rs.getInt("year"));
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
	}// end setMember
	
	public ZodiacTestVO todayZodiac(int year) throws SQLException {
		conn = null;
		rs = null;
		ZodiacTestVO article = null;
		String sql = "";
		try {
			
			sql = "select zc_zodiac, zc_today from zodiac where zc_byear=?";
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				article = new ZodiacTestVO();
				article.setZc_today(rs.getString("zc_today"));
				article.setZc_zodiac(rs.getString("zc_zodiac"));
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
	}// end today
	
	public ZodiacTestVO tomorrowZodiac(int year) throws SQLException {
		conn = null;
		rs = null;
		ZodiacTestVO article = null;
		String sql = "";
		try {
			
			sql = "select zc_tomorrow, zc_zodiac from zodiac where zc_byear=?";
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				article = new ZodiacTestVO();
				article.setZc_tomorrow(rs.getString("zc_tomorrow"));
				article.setZc_zodiac(rs.getString("zc_zodiac"));
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
	}
	public ZodiacTestVO weekZodiac(int year) throws SQLException {
		conn = null;
		rs = null;
		ZodiacTestVO article = null;
		String sql = "";
		try {
			
			sql = "select zc_zodiac, zc_week from zodiac where zc_byear=?";
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				article = new ZodiacTestVO();
				article.setZc_week(rs.getString("zc_week"));
				article.setZc_zodiac(rs.getString("zc_zodiac"));
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
	}// end month
	public ZodiacTestVO nweekZodiac(int year) throws SQLException {
		conn = null;
		rs = null;
		ZodiacTestVO article = null;
		String sql = "";
		try {
			
			sql = "select zc_zodiac, zc_nweek from zodiac where zc_byear=?";
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				article = new ZodiacTestVO();
				article.setZc_nweek(rs.getString("zc_nweek"));
				article.setZc_zodiac(rs.getString("zc_zodiac"));
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
	}// end year
}
