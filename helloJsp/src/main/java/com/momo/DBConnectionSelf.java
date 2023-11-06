package com.momo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.momo.dto.Job;

public class DBConnectionSelf {
	
	public static void main(String[] args) {
		
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id = "test";
		String pw = "1234";
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		List<Job> list = new ArrayList<>();
		
		try {
			// 1. 라이브러리 확인
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 2. Connection 객체 생성
			con = DriverManager.getConnection(url, id, pw);
			
			// 3. 질의문 생성
			String sql = "select * from job";
			
			// 4. 질의문 실행
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			// 5. 결과 출력
			while(rs.next()) {
				Job job = new Job();
				job.setJobCode(rs.getString(1));
				job.setJobName(rs.getString(2));
				System.out.print(rs.getString(1));
				System.out.print(rs.getString(2));
				System.out.println();
				
				list.add(job);
			}
			System.out.println("===================");
			System.out.println(list);
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Connection 객체 생성 실패");
			e.printStackTrace();
		} finally {
			try {				
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
				System.out.println("자원 해제중 예외사항이 발생 하였습니다.");
			}
		}
	}
}









