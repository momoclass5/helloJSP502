package com.momo.utils;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;

public class JSFunction {
	/**
	 * 알림창을 띄우고 이전 페이지로 이동 합니다.
	 */
	public static void alertBack(String msg
									, JspWriter out) {
		// 삽입할 자바스크립트 코드를 생성
		String script = ""
						+ "<script type='text/javascript'>"
						+ "		alert('" + msg + "');"
						+ "		history.go(-1);"
						+ "</script>";
		
		try {
			// out 객체를 활용하여 스크립트를 화면에 출력 합니다.
			out.print(script);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 알림창을 띄우고 URL로 이동 합니다.
	 * @param msg
	 * @param url
	 * @param out
	 */
	public static void alertLocation(String msg
										, String url
										, JspWriter out) {
		// 삽입할 자바스크립트 코드를 생성
		String script = ""
						+ "<script type='text/javascript'>"
						+ "		alert('" + msg + "');"
						+ "		location.href='" + url + "';"
						+ "</script>";
		
		try {
			// out 객체를 활용하여 스크립트를 화면에 출력 합니다.
			out.print(script);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}




