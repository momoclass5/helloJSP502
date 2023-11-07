package com.momo.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnection {
	public Connection con;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;
	
	/**
	 * 생성자 - Connection 객체 생성
	 */
	public DBConnection(){
		try {
			// 1. 드라이버 로딩
			Class.forName("oracle.jdbc.OracleDriver");
			
            // DB에 연결하기 위해 필요한 정보
            String url = "jdbc:oracle:thin:@localhost:1521:orcl";  
            String id = "test";
            String pw = "1234"; 
            
            con = DriverManager.getConnection(url, id, pw);
            
            System.out.println("DB 연결 성공(기본생성자)");
            
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버로딩 실패");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("connection 객체 생성 실패");
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
		} catch (Exception e) {
			System.out.println("자원반납중 예외가 발생 하였습니다.");
			e.printStackTrace();
		}
	}
}










