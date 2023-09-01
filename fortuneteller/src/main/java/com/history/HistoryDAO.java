package com.history;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class HistoryDAO {
	
private static HistoryDAO instance=null;
	
	public HistoryDAO() {}
	
	public static HistoryDAO getInstance() {
		
		if(instance==null) {
			synchronized (HistoryDAO.class) {
				instance = new HistoryDAO();
			}
		}
		return instance;
	}
	
	
public int getTestCount(String id) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		
		
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select count(*) from history where id=?");
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				x= rs.getInt(1);
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
		
		
		return x;
	
}//

public List<InfoVO> getInfo(int start, int end,String id) {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	List<InfoVO> list = null;
	try {
		
		conn = ConnUtil.getConnection();
		pstmt = conn.prepareStatement("select * from (select rownum rnum, num, id, regdate, image, testName, testPage from (select * from history  where id=? order by num desc)) where rnum >= ? and rnum <=?");
		pstmt.setString(1, id);
		pstmt.setInt(2, start );
		pstmt.setInt(3, end );
		
		rs=pstmt.executeQuery();
		
		if(rs.next()) {
			list = new ArrayList<InfoVO>(end - start+1);//4
			
			do {
				InfoVO vo =new InfoVO();
				vo.setNum(rs.getInt("num"));
				vo.setId(rs.getString("id"));
				vo.setRegdate(rs.getTimestamp("regdate"));
				vo.setImage(rs.getString("image"));
				vo.setTestName(rs.getString("testName"));
				vo.setTestPage(rs.getString("testPage"));
				list.add(vo);
			}while(rs.next());
			
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
	
	return list;
}//

public void historyDelete(int num) {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		conn = ConnUtil.getConnection();
		pstmt = conn.prepareStatement("delete from history where num=?");
		pstmt.setInt(1, num);
		pstmt.executeUpdate();
		
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
	
	
	
}//

public List<InfoVO> getInfo(int start, int end,String what,String text,String id) {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	List<InfoVO> list = null;
	try {
		
		conn = ConnUtil.getConnection();
		pstmt = conn.prepareStatement("select * from (select rownum rnum, num, id, regdate, image, testName, testPage from (select * from history where "+what+" like '%"+text+"%' and id=? order by num desc)) where rnum >= ? and rnum <=?");
		pstmt.setString(1, id);
		pstmt.setInt(2, start );
		pstmt.setInt(3, end );
		
		rs=pstmt.executeQuery();
		
		if(rs.next()) {
			list = new ArrayList<InfoVO>(end - start+1);//4
			
			do {
				InfoVO vo =new InfoVO();
				vo.setNum(rs.getInt("num"));
				vo.setId(rs.getString("id"));
				vo.setRegdate(rs.getTimestamp("regdate"));
				vo.setImage(rs.getString("image"));
				vo.setTestName(rs.getString("testName"));
				vo.setTestPage(rs.getString("testPage"));
				list.add(vo);
			}while(rs.next());
			
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
	
	return list;
}//

public int getTestCount(String what,String text,String id) {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int x = 0;
	
	
	try {
		conn = ConnUtil.getConnection();
		pstmt = conn.prepareStatement("select count(*) from history where "+what+" like '%"+text+"%' and id=? ");
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		
		if(rs.next()) {
			x= rs.getInt(1);
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
	
	
	return x;

}//
public void insertInfo(InfoVO vo) {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		conn = ConnUtil.getConnection();
		pstmt = conn.prepareStatement("insert into history values(history_seq.nextval,?,?,?,?,?)");
		
		pstmt.setString(1, vo.getId());
		pstmt.setTimestamp(2, vo.getRegdate());
		pstmt.setString(3, vo.getImage());
		pstmt.setString(4, vo.getTestName());
		pstmt.setString(5, vo.getTestPage());
		
		pstmt.executeUpdate();
		
		
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
	
	
	
}//
}