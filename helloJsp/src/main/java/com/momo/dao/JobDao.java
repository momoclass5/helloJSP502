package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import com.momo.common.DBConnection;
import com.momo.dto.Job;

public class JobDao extends DBConnection{
	
	public JobDao(ServletContext application) {
		super(application);
	}
	
	/**
	 * job 테이블의 내용을 조회 후 리스트에 담아서 반환
	 * @return
	 */
	public List<Job> getList(){
		List<Job> list = new ArrayList<>();
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from job");
			while(rs.next()) {
				Job job = new Job();
				job.setJobCode( rs.getString(1) );
				job.setJobName( rs.getString(2) );
				
				list.add(job);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}
}









