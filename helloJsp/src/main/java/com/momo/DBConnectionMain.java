package com.momo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnectionMain {

	
	public static void main(String[] args) {
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id = "test";
		String pw = "1234";
			
		/* 
		 * 1. 드라이버 로딩
		 * 		DB에 접근하기 위해 필요한 라이브러리가 있는지 확인
		 * 
		 * 2. 커넥션 객체를 생성
		 * 
		 */
		try {
			// 1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 2. 커넥션 생성
			Connection con = DriverManager.getConnection(url, id, pw);

			// 3. 쿼리문장 준비
			String sql = "select sysdate from dual";

			// 4. 쿼리 문장 실행
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			// 숫자를 입력시 1부터
			// 숫자또는 결과집합의 컬럼명
			System.out.println(rs.getString("sysdate"));
			
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩실패 - 라이브러리를 찾을수 없습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Connection 객체 생성 실패");
			e.printStackTrace();
		}
		
	}

}
