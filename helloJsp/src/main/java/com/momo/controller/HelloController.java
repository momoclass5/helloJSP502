package com.momo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloController
 * 
 * 서블릿 호출 방법
 * localhost:포트번호/path/매핑주소
 * 
 */
@WebServlet("/h")
public class HelloController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request
							, HttpServletResponse response) 
									throws ServletException, IOException {
		
		// 한글깨짐을 방지하고 위해 인코딩 설정및 컨텐츠 타입 지정
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.append("<h2>out 객체를 이용한 출력<h2>");
		
	}

}
