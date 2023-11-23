package com.momo.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBConnPool {
	public Connection con;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;
	
	public DBConnPool() {
		
		try {
			// JNDI를 통해 커넥션풀 얻어오기
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
			
			// 커넥션풀을 통해 연결 객체를 멤버변수 con에 담아줍니다 
			con = ds.getConnection();
			
			System.out.println("JNDI를 통해 커넥션풀에서 커넥션을 얻어오기");
		} catch (NamingException e) {
			System.out.println("=========== DBConnPool NamingException");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("=========== DBConnPool SQLException");
			e.printStackTrace();
		}
	}
	
	/**
	 * 연결해제(자원반납)
	 */
	public void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(stmt != null) stmt.close();
			if(con != null) con.close();
			
			System.out.println("자원 반납 성공");
		} catch (Exception e) {
			System.out.println("자원반납중 예외가 발생 하였습니다.");
			e.printStackTrace();
		}
	}
	
	/**
	 * 페이지쿼리를 생성해주는 메서드
	 * @param sql
	 * @return
	 */
	public String pageingQuery(String sql) {
		
		String before = "select * from (\r\n"
						+ "    select t.*, ROWNUM rnum from (";

		String after = "    )t \r\n"
						+ ")\r\n"
						+ "where rnum between ? and ?";
		
		return before + sql + after;
	}
}










