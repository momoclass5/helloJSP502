package com.momo.book.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.momo.common.DBConnPool;
import com.momo.dto.Criteria;
import com.momo.lib.dto.BookDto;

/**
 * DB에 접근하여 쿼리를 질의 합니다.
 * 
 */
public class BookDao extends DBConnPool{
	
	/**
	 * 도서목록을 조회 후 반환 합니다.
	 * @return 도서목록
	 */
	public List<BookDto> getList(Criteria cri){
		List<BookDto> list = new ArrayList<>();
		
		String where = ""; 
		if(!"".equals(cri.getSearchField())
				&& !"".equals(cri.getSearchWord())) {
			
			where = " where " + cri.getSearchField() 
					+ " like '%"+cri.getSearchWord()+"%'";
		}
		
		String sql = "        select *\r\n"
					+ "        from book\r\n"
					+ "        -- 최신게시물을 먼저 조회 하기 위해서 정렬 합니다\r\n"
					+ where
					+ "        order by no desc";
		
		
		try {
			// pageingQuery를 이용시 페이지 처리를 위한 파라메터 세팅을 해주어야 합니다!!!
			sql = pageingQuery(sql);
			// 쿼리 출력
			System.out.println("sql\n" + sql);
			
			pstmt = con.prepareStatement(sql);
			// 페이지 파라메터 세팅
			pstmt.setInt(1, cri.getStartNum());
			pstmt.setInt(2, cri.getEndNum());
			
			// 쿼리 실행
			rs = pstmt.executeQuery();
			
			// 결과집합으로부터 도서의 정보를 가지고와서 dto에 저장 후 리스트에 담아줍니다
			while(rs.next()) {
				String no = rs.getString("no");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String rentYn = rs.getString("rentYn");
				
				BookDto dto = new BookDto(no, title, author, rentYn);
				list.add(dto);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	/**
	 * 도서의 상세 정보를 조회 후 반환 합니다.
	 * @param no
	 * @return 도서정보(BookDto)
	 */
	public BookDto view(String no){
		BookDto dto = new BookDto();
		String sql = "select * from book where no = ? ";
		try {
			pstmt = con.prepareStatement(sql);
			// ?의 갯수만큼 파라메터를 설정 합니다.
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNo(rs.getString("no"));
				dto.setTitle(rs.getString("title"));
				dto.setAuthor(rs.getString("author"));
				dto.setRentYn(rs.getString("rentYn"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dto;
	}
	
	/**
	 * 도서의 총 건수를 조회 합니다.
	 * @return
	 */
	public int getTotalCnt(Criteria cri) {
		int res = 0;
		String where = ""; 
		if(!"".equals(cri.getSearchField())
				&& !"".equals(cri.getSearchWord())) {
			
			where = " where " + cri.getSearchField() 
					+ " like '%"+cri.getSearchWord()+"%'";
		}
		String sql = "select count(*) from book " + where;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				res = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}

	/**
	 * 도서 등록
	 * @param dto
	 * @return
	 */
	public int regBook(BookDto dto) {
		String sql = "insert into book (no, title, rentyn, author)\r\n"
					+ "        values (seq_book_no.nextval, ?, 'N', ?)";
		int res = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getAuthor());

			
			// select 문장은 결과집합을 반환 : rs = pstmt.executeQuery()
			// insert, delete, update의 반환 타입은 몇건이 처리되었는지 결과
			res = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return res;
	}
	
}




















