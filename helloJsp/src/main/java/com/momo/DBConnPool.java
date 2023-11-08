package com.momo;

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
    public PreparedStatement psmt;
    public ResultSet rs;
    
    // 기본생성자
	public DBConnPool() {
		Context initContext;
		try {
			// JNDI를 통해 커넥션풀 얻어오기
			initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
			// 커넥션풀을 통해 연결 객체 얻기
			con = ds.getConnection();
			System.out.println("JNDI를 통한 커넥션 생성 성공");
		} catch (NamingException e) {
			System.out.println("JNDI를 통한 커넥션 생성 실패");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("JNDI를 통한 커넥션 생성 실패");
			e.printStackTrace();
		}
		
	}
	
}
