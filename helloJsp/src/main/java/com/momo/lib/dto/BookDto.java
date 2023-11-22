package com.momo.lib.dto;

/**
 * 도서 테이블의 정보를 담아줍니다
 * 
 */
public class BookDto {
	private String no;
	private String title;
	private String author;
	
	public BookDto(String no, String title, String author) {
		super();
		this.no = no;
		this.title = title;
		this.author = author;
	}
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	
	
}
