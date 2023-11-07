package com.momo;

import java.sql.SQLException;

import com.momo.common.DBConnection;
import com.momo.dto.Person;

public class EmpDao extends DBConnection{
	 public void getList() {
		 try {
			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from employee");
			
			while(rs.next()) {
				System.out.print(rs.getString(1));
				System.out.print(rs.getString(2));
				System.out.print(rs.getString(3));
				System.out.println();
			}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	 }
	 
	 public static void main(String[] args) {
		EmpDao dao = new EmpDao();
		dao.getList();
	}
}
