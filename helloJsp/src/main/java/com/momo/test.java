package com.momo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class test {
	public static void main(String[] args) {
		try {
			// 1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 2. 커넥션 생성
			// 데이터 베이스에 접속 하기 위해 필요한 정보
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String id= "test";
			String pw= "1234";
			
			
			// 커넥션 생성 
			Connection conn = DriverManager.getConnection(url, id, pw);
			
			PreparedStatement pstmt 
				= conn.prepareStatement("insert into job values(?,?)");
			pstmt.setString(1, "99");
			pstmt.setString(2, "test");
			int res = pstmt.executeUpdate();
			System.out.println(res + "건 처리 되었습니다.");
			
			System.out.println(conn);
		} catch (ClassNotFoundException e) {
			System.out.println("라이브러리를 확인해주세요");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DB Connection 생성에 실패 하였습니다.");
			e.printStackTrace();
		}
		
	}
}
