package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.momo.common.DBConnPool;
import com.momo.dto.FileDto;

public class FileDao extends DBConnPool{

	public int regFile(FileDto fileDto) {
		String sql = "INSERT INTO tbl_file (  file_no, name, title, cate, ofile, sfile)\r\n"
						+ "VALUES ( seq_tbl_file.nextval, ?, ?, ?, ?, ?)";
		int res = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, fileDto.getName());
			pstmt.setString(2, fileDto.getTitle());
			pstmt.setString(3, fileDto.getCate());
			pstmt.setString(4, fileDto.getOfile());
			pstmt.setString(5, fileDto.getSfile());
			
			res = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	public List<FileDto> getList() {
		List<FileDto> list = new ArrayList<>();
		String sql = "SELECT * FROM tbl_file ORDER BY file_no DESC";
		
		try {
			pstmt = con.prepareStatement(sql);
			// 결과집합
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FileDto dto = new FileDto();
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setCate(rs.getString("cate"));
				dto.setFile_no(rs.getInt("file_no"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setPostdate(rs.getString("postdate"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}
	
}










