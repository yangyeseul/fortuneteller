package com.member;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnUtil {
	
	private static DataSource ds;
	
	static {
		
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}catch (NamingException n) {
			n.printStackTrace();
		}
	}
	
	public static Connection getConnection()throws Exception{
		return ds.getConnection();
	}
	
}
