package com.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
	
	private static MemberDAO instance=null;
	
	public MemberDAO() {}
	
	public static MemberDAO getInstance() {
		
		if(instance==null) {
			synchronized (MemberDAO.class) {
				instance = new MemberDAO();
			}
		}
		return instance;
	}
	
	//
	public boolean idCheck(String id) {
		
		boolean result = true;//아이디가 있을 경우
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = ConnUtil.getConnection();
			
			String sql = "select * from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(!rs.next()) result=false;
			//db에 아이디가 없을 경우
			
			
		}catch(SQLException ss){
			ss.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			
			if(conn !=null){
				try{
					conn.close();
				}catch(Exception ee){
					ee.printStackTrace();
				}
			}
			
			if(pstmt !=null){
				try{
					pstmt.close();
				}catch(Exception ee){
					ee.printStackTrace();
				}
			}
			
			if(rs !=null){
				try{
					rs.close();
				}catch(Exception ee){
					ee.printStackTrace();
				}
			}
			
		}
			
		return result;
	}//idCheck
	
public boolean memberInsert(MemberVO vo) {
		
		boolean flag= false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = ConnUtil.getConnection();
			
			String sql = "insert into member values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPass());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getGender());
			pstmt.setInt(6, vo.getYear());
			pstmt.setInt(7, vo.getMonth());
			pstmt.setInt(8, vo.getDay());
			
			int count = pstmt.executeUpdate();
			if(count>0) flag = true;
			
			
		}catch(SQLException ss){
			System.out.println("sql Exception");
		}catch(Exception e){
			System.out.println("Exception");
		}finally{
			
			if(rs != null){
				try{rs.close();}
				catch(SQLException s){}
			}
			
			if(pstmt != null){
				try{pstmt.close();}
				catch(SQLException s){}
			}
			
			if(conn != null){
				try{conn.close();}
				catch(SQLException s){}
			}
		}
	
		return flag;
		
	}//end memberInsert
	
public int loginCheck(String id, String pass) {
	
	int check = -1;//아이디 존재 x
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		
		conn = ConnUtil.getConnection();
		
		pstmt = conn.prepareStatement("select pass from member where id=?");
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			String dbpass = rs.getString("pass");
			
			if(pass.equals(dbpass)) {
				
				check = 1;
			}else {
				check=0;
			}
			
		}
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException s) {
				s.printStackTrace();
			}
		}
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException s) {
				s.printStackTrace();
			}
		}
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException s) {
				s.printStackTrace();
			}
		}
	}
	return check;
}//

public MemberVO getMember(String id) {//db에 있는 걸 vo로 옮겨야됨 그리고 그 vo를 form으로 옮겨
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	MemberVO vo = null;
	
	try {
		
		conn = ConnUtil.getConnection();
		pstmt = conn.prepareStatement("select * from member where id=?");
		pstmt.setString(1, id);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			vo = new MemberVO();
			vo.setId(rs.getString("id"));
			vo.setPass(rs.getString("pass"));
			vo.setName(rs.getString("name"));
			vo.setEmail(rs.getString("email"));
			vo.setGender(rs.getString("gender"));
			vo.setYear(rs.getInt("year"));
			vo.setMonth(rs.getInt("month"));
			vo.setDay(rs.getInt("day"));
		}
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException s) {
				s.printStackTrace();
			}
		}
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException s) {
				s.printStackTrace();
			}
		}
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException s) {
				s.printStackTrace();
			}
		}
	}
	return vo;
	
	
}


public void updateStudent(MemberVO vo) {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		
		conn = ConnUtil.getConnection();
		pstmt = conn.prepareStatement("update member set pass=?, email=? where id=?");
		pstmt.setString(1, vo.getPass());
		pstmt.setString(2, vo.getEmail());
		pstmt.setString(3, vo.getId());
		
		pstmt.executeUpdate();
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException s) {
				s.printStackTrace();
			}
		}
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException s) {
				s.printStackTrace();
			}
		}
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException s) {
				s.printStackTrace();
			}
		}
	}
	}//

public int deleteMember(String id,String pass) {
	int x = -1;
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		
		conn = ConnUtil.getConnection();
		
		pstmt = conn.prepareStatement("select * from member where id=?"); 
		pstmt.setString(1,id);
		rs=pstmt.executeQuery();
		
		if(rs.next()) {
			
			String dbpass = rs.getString("pass");
			if(dbpass.equals(pass)) {
				pstmt = conn.prepareStatement("delete from member where id=?");
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				x= 1;
			}else {
				x= 0;
			}
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException s) {
				s.printStackTrace();
			}
		}
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException s) {
				s.printStackTrace();
			}
		}
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException s) {
				s.printStackTrace();
			}
		}
	}
	return x;
}
	
	
}
