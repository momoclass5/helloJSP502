package com.momo.dto;

/**
 * 리스트를 조회 하기 위한 파라메터 세팅
 */
public class Criteria {
	// 기본값을 설정
	
	// 페이지 번호
	private int pageNo = 1;
	// 페이지당 게시물 수 
	private int amount = 10;
	
	// 검색어
	private String searchWord="";
	// 검색필드
	private String searchField="";
	
	// 페이지 번호와 페이지당 게시물의 수를 받아서 조회할 
	// 게시글의 시작 번호와 끝번호를 구합니다.
	// 조회할 게시글의 시작 번호
	private int startNum;
	// 조회할 게시글의 끝번호
	private int endNum;
	
	public Criteria() {
		// 시작 번호와 끝번호를 구합니다.
		// -> 페이지 조회 쿼리에서 사용됩니다~~~~~
		endNum = pageNo * amount;
		startNum = endNum - (amount-1);
	}
	
	/**
	 * 생성자를 통해 페이지번호와 페이지당 게시물의 수를 받아와서 
	 * 시작번호와 끝번호를 구합니다.
	 * @param pageNo
	 * @param amount
	 */
	public Criteria(String pageNo, String amount) {
		
		if(pageNo != null && !"".equals(pageNo)) {
			this.pageNo = Integer.parseInt(pageNo);			
		}
		if(amount != null && !"".equals(amount)) {
			this.amount = Integer.parseInt(amount);			
		}
		
		endNum = this.pageNo * this.amount;
		startNum = endNum - (this.amount-1);
		
	}
	
	/**
	 * 생성자를 통해 페이지번호와 페이지당 게시물의 수를 받아와서 
	 * 시작번호와 끝번호를 구합니다.
	 * @param pageNo
	 * @param amount
	 */
	public Criteria(String pageNo, String amount, String searchField, String searchWord) {
		
		// 페이지 정보 세팅
		if(pageNo != null && !"".equals(pageNo)) {
			this.pageNo = Integer.parseInt(pageNo);			
		}
		if(amount != null && !"".equals(amount)) {
			this.amount = Integer.parseInt(amount);			
		}
		
		endNum = this.pageNo * this.amount;
		startNum = endNum - (this.amount-1);
		
		// 검색어 세팅
		if(searchField != null && !"".equals(searchField)) {
			this.searchField = searchField;			
		}
		if(searchWord != null && !"".equals(searchWord)) {
			this.searchWord = searchWord;			
		}
		
		
	}

	@Override
	public String toString() {
		// 재정의 하지 않으면 메모리주소가 출력됩니다
		// toString메서드를 재정의 하여 객체가 가진 필드값을 출력 해줍시다
		return "[searchWord]" + searchWord
				+ "\n[searchField]" + searchField
				+ "\n[pageNo]" + pageNo
				+ "\n[amount]" + amount;
	}
	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public String getSearchField() {
		return searchField;
	}

	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}
	
	

}
