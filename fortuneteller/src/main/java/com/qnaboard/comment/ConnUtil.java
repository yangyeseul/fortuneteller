package com.qnaboard.comment;
import java.sql.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
public class ConnUtil {
	public static Connection getConnection() {
		Connection conn = null;

		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
			conn = ds.getConnection();
			
		}catch(Exception e) {
			System.out.println("안된당!");
		}
			
		return conn;
	}
	
}
