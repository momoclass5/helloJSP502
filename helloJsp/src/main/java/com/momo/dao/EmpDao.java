package com.momo.dao;

import java.sql.SQLException;

import javax.servlet.ServletContext;

import com.momo.common.DBConnection;

/**
 * 데이터 베이스에 접근 해서 
 * 데이터 입력, 출력, 삭제, 조회 작업을 처리하는 객체
 * 
 * Dao -> mapper
 * 
 */
public class EmpDao extends DBConnection{

	public EmpDao(ServletContext application) {
		super(application);
	}
	
	public void getList() {
				
		try {
			stmt = con.createStatement();
			String sql = "select * from employee";
			
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				System.out.print(rs.getString(1));
				System.out.print(rs.getString(2));
				System.out.print(rs.getString(3));
				System.out.println();
			}
		} catch (SQLException e) {
			System.out.println("SQLException 예외사항 발생");
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		//EmpDao empDao = new EmpDao();
		//empDao.getList();
	}
}









