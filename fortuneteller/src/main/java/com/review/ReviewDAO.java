package com.review;

import java.util.*;
import java.sql.*;

public class ReviewDAO {

	private static ReviewDAO instance = null;
	
	private ReviewDAO() {
		
	}

	public static ReviewDAO getInstance() {
		
		if(instance == null) {
			synchronized (ReviewDAO.class) {
				instance = new ReviewDAO();
			}
		}

		return instance;
	}
	
	
	// 글쓰기 폼에서 넘어온 데이터를 실제 데이터베이스에 넣어줄 메소드
	public void insertArticle(ReviewVO article) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num = article.getNum();
		
		int number = 0;
		String sql = "";
		
		try {
			conn = ConnUtil.getConnection();
			sql = "select max(num) from review";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				number = rs.getInt(1) + 1;
			} else {
				number = 1;
			}
			
			sql = "insert into review(num, writer, title, pass, content, postdate, category) values(review_seq.nextval, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getTitle());
			pstmt.setString(3, article.getPass());
			pstmt.setString(4, article.getContent());
			pstmt.setTimestamp(5, article.getPostdate());
			pstmt.setString(6, article.getCategory());
			pstmt.executeUpdate();
			
		}catch(Exception e) {
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
		
		System.out.println("리뷰게시판 글 작성 완료");
	} // end insertArticle


	// 전체 글 갯수를 가져오는 메소드
	public int getArticleCount() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select count(*) from review");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x = rs.getInt(1);
			}
			
		}catch(Exception e) {
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
		
		return x;
	
	} // end getArticleCount
	
	
	// 전체 글 갯수를 가져오는 메소드
	// 한페이지에 몇개만 리스트로 잡을지 정하기
	public List<ReviewVO> getArticles(int start, int end) { // 여기 수정해야됨 1 : 파라미터 start, end 삽입
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ReviewVO> articleList = null;
		
		try {
			conn = ConnUtil.getConnection();
			// 여기 수정해야됨 2
			String sql = "select * from (select rownum rnum, num, writer, title, pass, readcount, content, postdate, category from (select * from review order by num desc)) where rnum >=? and rnum <=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// 여기 수정해야됨 3
				articleList = new ArrayList<ReviewVO>(end - start+1);
				
				do {
					ReviewVO article = new ReviewVO();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setTitle(rs.getString("title"));
					article.setPass(rs.getString("pass"));
					article.setReadcount(rs.getInt("readcount"));
					article.setContent(rs.getString("content"));
					article.setPostdate(rs.getTimestamp("postdate"));
					article.setCategory(rs.getString("category"));
					articleList.add(article);
				} while(rs.next());
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
		
		return articleList;
	} // end getArticles
	
	
	// list.jsp 페이지에서 제목을 클릭했을 경우 글 내용을 볼 수 있게 구현
	// num을 파라미터로 하나의 글에 대한 상세 정보를 데이터베이스에서 가져오기
	public ReviewVO getArticle(int num) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ReviewVO article = null;
		
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("update review set readcount=readcount+1 where num=?"); // 조회수 증가
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("select * from review where num=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				article = new ReviewVO();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setTitle(rs.getString("title"));
				article.setPass(rs.getString("pass"));
				article.setReadcount(rs.getInt("readcount"));
				article.setContent(rs.getString("content"));
				article.setPostdate(rs.getTimestamp("postdate"));
				article.setCategory(rs.getString("category"));
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
		
		return article;
	} // end getArticle
	
	
	// 글 수정버튼 클릭시 updateForm.jsp 페이지로 이동
	// 글 수정시 글 목록 보기에서 조회수를 증가시킬 필요x, 조회수 증가는 제외하고 수정처리
	public ReviewVO updateGetArticle(int num) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ReviewVO article = null;
		
		try {
			
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select * from review where num=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				article = new ReviewVO();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setTitle(rs.getString("title"));
				article.setPass(rs.getString("pass"));
				article.setReadcount(rs.getInt("readcount"));
				article.setContent(rs.getString("content"));
				article.setPostdate(rs.getTimestamp("postdate"));
				article.setCategory(rs.getString("category"));
			}
			
			
		}  catch(Exception e) {
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
		
		return article;
	} // end updateGetArticle
	
	
	// 수정 버튼을 클릭했을 경우 데이터베이스에 저장되어 있던 글도 수정처리가 되어야 함
	public int updateArticle(ReviewVO article) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String dbPasswd= "";
		String sql = "";
		int result = -1;
		
		try {
			
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select pass from review where num=?");
			pstmt.setInt(1, article.getNum());
			rs = pstmt.executeQuery();
			
			if(rs.next()) { // 입력 번호와 데이터베이스 비밀번호 비교
				dbPasswd = rs.getString("pass");
				
				if(dbPasswd.equals(article.getPass())) { // 비밀번호가 일치하면
					sql = "update review set writer=?, title=?, content=?, category=? where num=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, article.getWriter());
					pstmt.setString(2, article.getTitle());
					pstmt.setString(3, article.getContent());
					pstmt.setString(4, article.getCategory());
					pstmt.setInt(5, article.getNum());
					pstmt.executeUpdate();
					
					result = 1;
				} else {
					result = 0;
				}
			}
			
			
		}  catch(Exception e) {
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
		
		System.out.println("리뷰게시판 글 수정 완료");
		return result;
	} // end updateArticle
	
	
	// 비밀번호 입력하고 삭제 버튼을 클릭하면 데이터베이스에 저장된 비밀번호와 비교하여 일치하면 삭제 처리
	public int deleteArticle(int num, String pass) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String dbPasswd= "";
		int result = -1;
		
		try {
			
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select pass from review where num=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) { // 입력 번호와 데이터베이스 비밀번호 비교
				dbPasswd = rs.getString("pass"); // 데이터베이스의 비밀번호 dbPasswd에 저장
				
				if(dbPasswd.equals(pass)) { // 비밀번호가 일치하면
					pstmt = conn.prepareStatement("delete from review where num=?");
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					
					result = 1; // 삭제 성공
 				} else {
					result = 0; // 삭제 실패
				}
			}
			
			
		}  catch(Exception e) {
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
		
		System.out.println("리뷰게시판 글 삭제 완료");
		return result;
	} // end deleteArticle
	
	
	// 검색 기능
	public int getSearchCount(String searchCondition, String searchKeyword){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// 데이터베이스에서 searchCondition(검색조건) searchKeyword(검색어) 일치하는 레코드 수를 저장하는 변수
		int searchCount = 0;
		String sql = "select count(*) from review where " + searchCondition + " like '%" + searchKeyword + "%'";
		
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				searchCount = rs.getInt(1);
			}
		} catch (Exception e) {
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
		
		return searchCount; // 총 레코드 수 리턴
	}
	
	
	// 리스트 페이지에 보여줄 검색 관련 로직(페이징 처리)
	public List<ReviewVO> getSearchList(int startRow, int endRow, String searchCondition, String searchKeyword) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// 검색 페이징 처리를 위한 sql / 인라인뷰, rownum 사용
		String sql = "select * from (select rownum rnum, num, writer, title, pass, readcount, content, postdate, category from (select * from review where "+ searchCondition +" like '%"+ searchKeyword +"%' order by num desc)) where rnum between ? and ?";
		List<ReviewVO> list = null;
		try {
			conn = ConnUtil.getConnection(); // 커넥션을 얻어옴
			pstmt = conn.prepareStatement(sql); // sql 정의
			pstmt.setInt(1, startRow); // sql 물음표에 값 매핑
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery(); // sql 실행
			
			if (rs.next()) { // 데이터베이스에 데이터가 있으면 실행
				list = new ArrayList<>(); // list 객체 생성
				
				do {
					// 반복할 때마다 ReviewVO 객체를 생성 및 데이터 저장
					ReviewVO article = new ReviewVO();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setTitle(rs.getString("title"));
					article.setPass(rs.getString("pass"));
					article.setReadcount(rs.getInt("readcount"));
					article.setContent(rs.getString("content"));
					article.setPostdate(rs.getTimestamp("postdate"));
					article.setCategory(rs.getString("category"));
					list.add(article); // list에 0번 인덱스부터 board 객체의 참조값을 저장
				} while (rs.next());
			}
		} catch (Exception e) {
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
		
		System.out.println("리뷰게시판 글 검색 완료: " + searchCondition + "/" + searchKeyword);
		return list; // list 반환
	}
	
	
	// 카테고리별 글 갯수를 가져오는 메소드
	public int getCategoryCount(String category) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select count(*) from review where category='" + category + "'");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x = rs.getInt(1);
			}
			
		}catch(Exception e) {
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
		
		return x;
	
	} // end getCategoryCount
		
		
	// 카테고리 글 목록
	// 전체 글 갯수를 가져오는 메소드
	// 한페이지에 몇개만 리스트로 잡을지 정하기
	public List<ReviewVO> getCategoryArticles(int start, int end, String category) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ReviewVO> articleList = null;
		
		try {
			conn = ConnUtil.getConnection();
			// 여기 수정해야됨 2
			String sql = "select * from (select rownum rnum, num, writer, title, pass, readcount, content, postdate, category from (select * from review where category='" + category + "' order by num desc)) where rnum >=? and rnum <=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// 여기 수정해야됨 3
				articleList = new ArrayList<ReviewVO>(end - start+1);
				
				do {
					ReviewVO categoryArticle = new ReviewVO();
					categoryArticle.setNum(rs.getInt("num"));
					categoryArticle.setWriter(rs.getString("writer"));
					categoryArticle.setTitle(rs.getString("title"));
					categoryArticle.setPass(rs.getString("pass"));
					categoryArticle.setReadcount(rs.getInt("readcount"));
					categoryArticle.setContent(rs.getString("content"));
					categoryArticle.setPostdate(rs.getTimestamp("postdate"));
					categoryArticle.setCategory(rs.getString("category"));
					articleList.add(categoryArticle);
				} while(rs.next());
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
		
		return articleList;
	} // end getCategoryArticles
	
	
	// 검색 기능
	public int getCategorySearchCount(String searchCondition, String searchKeyword, String category){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// 데이터베이스에서 category searchCondition(검색조건) searchKeyword(검색어) 일치하는 레코드 수를 저장하는 변수
		int searchCount = 0;
		String sql = "select count(*) from review where category='" + category + "' and " + searchCondition + " like '%" + searchKeyword + "%'";
		
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				searchCount = rs.getInt(1);
			}
		} catch (Exception e) {
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
		
		return searchCount; // 총 레코드 수 리턴
	}
	
	
	// 리스트 페이지에 보여줄 검색 관련 로직(페이징 처리)
	public List<ReviewVO> getCategorySearchList(int startRow, int endRow, String searchCondition, String searchKeyword, String category) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// 검색 페이징 처리를 위한 sql / 인라인뷰, rownum 사용
		String sql = "select * from (select rownum rnum, num, writer, title, pass, readcount, content, postdate, category from (select * from review where category='" + category + "' and " + searchCondition +" like '%" + searchKeyword + "%' order by num desc)) where rnum between ? and ?";
		List<ReviewVO> list = null;
		try {
			conn = ConnUtil.getConnection(); // 커넥션을 얻어옴
			pstmt = conn.prepareStatement(sql); // sql 정의
			pstmt.setInt(1, startRow); // sql 물음표에 값 매핑
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery(); // sql 실행
			
			if (rs.next()) { // 데이터베이스에 데이터가 있으면 실행
				list = new ArrayList<>(); // list 객체 생성
				
				do {
					// 반복할 때마다 ReviewVO 객체를 생성 및 데이터 저장
					ReviewVO article = new ReviewVO();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setTitle(rs.getString("title"));
					article.setPass(rs.getString("pass"));
					article.setReadcount(rs.getInt("readcount"));
					article.setContent(rs.getString("content"));
					article.setPostdate(rs.getTimestamp("postdate"));
					article.setCategory(rs.getString("category"));
					list.add(article); // list에 0번 인덱스부터 board 객체의 참조값을 저장
				} while (rs.next());
			}
		} catch (Exception e) {
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
		
		System.out.println("리뷰게시판 글 카테고리별 검색 완료: " + category + "/" + searchCondition + "/" + searchKeyword);
		return list; // list 반환
	}
}
