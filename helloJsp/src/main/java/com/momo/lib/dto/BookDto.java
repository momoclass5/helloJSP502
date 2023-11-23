package com.momo.lib.dto;

/**
 * 도서 테이블의 정보를 담아줍니다
 * 
 */
public class BookDto {
	private String no;
	private String title;
	private String author;
	private String rentYn;
	private String rentYnStr;
	
	/**
	 * object객체가 가지고 있는 메서드 : '객체의이름@주소값'을 출력
	 */
	@Override
	public String toString() {
		return "[title : " + title + "]";
	}
	public BookDto() {}
	
	public BookDto(String no, String title, String author, String rentYn) {
		super();
		this.no = no;
		this.title = title;
		this.author = author;
		this.rentYn = rentYn;
		
		rentYnStr = rentYn.equals("Y") ? "대여중" : "";
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

	public String getRentYn() {
		return rentYn;
	}

	public void setRentYn(String rentYn) {
		this.rentYn = rentYn;
		this.rentYnStr = rentYn.equals("Y") ? "대여중" : "";
	}

	public String getRentYnStr() {
		return rentYnStr;
	}

	public void setRentYnStr(String rentYnStr) {
		this.rentYnStr = rentYnStr;
	}
	
	
}
