package com.momo.el;

public class MyElClass {
	
	public String gender="str";
	
	/**
	 * 주민등록번호를 입력 받아서 성별을 반환
	 * jumin : 000000-0000000
	 * @param jumin
	 * @return 성별(남,여)
	 */
	public String getGender(String jumin) {
		String gender = "";
		
		// 문자열의 위치 확인 indexOf
		int startIndex = jumin.indexOf("-") + 1;
		
		// subString(시작인덱스-포함, 끝인덱스-불포함)
		String str = jumin.substring(startIndex, startIndex + 1);
		// 주민등록 번호 뒤의 첫번째 문자가 1,3 이면 남을 반환 2,4 이면 여를 반환
		if("1".equals(str) || "3".equals(str)) 
			gender = "남자";
		else if("2".equals(str) || "4".equals(str))
			gender = "여자";
		else
			gender = "주민등록 번호를 확인 해주세요";

		this.gender = gender;
		return gender;
	}
	
	public static void main(String[] args) {
		MyElClass e = new MyElClass();
		
		System.out.println(e.getGender("000000-1000000"));
		System.out.println(e.getGender("000000-2000000"));
		System.out.println(e.getGender("000000-3000000"));
		System.out.println(e.getGender("000000-4000000"));
		System.out.println(e.getGender("000000-6000000"));
		
		
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
}
