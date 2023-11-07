package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import com.momo.common.DBConnection;
import com.momo.dto.DeptDto;

public class DeptDao extends DBConnection{
	
	public DeptDao(ServletContext application) {
		super(application);
	}
	
	public List<DeptDto> getList() {
		List<DeptDto> list = new ArrayList<>();
		String sql = "select * \r\n"
					+ "from department d, location l\r\n"
					+ "where d.location_id = l.local_code";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				DeptDto dto = new DeptDto();
				dto.setDept_id(rs.getString("dept_id"));
				dto.setDept_title(rs.getString("dept_title"));
				dto.setLocal_code(rs.getString("local_code"));
				dto.setLocal_name(rs.getString("local_name"));
				dto.setLocation_id(rs.getString("location_id"));
				dto.setNational_code(rs.getString("national_code"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("SQLException 예외가 발생 하였습니다.");
			e.printStackTrace();
		}
		
		return list;
	}
}














