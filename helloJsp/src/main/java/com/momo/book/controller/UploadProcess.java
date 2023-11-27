package com.momo.book.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

@WebServlet("/upload/uploadProcess")
public class UploadProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("method : get").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// enctype을 지정 하게 되면 request.getParamater()를 이용해서 폼요소의 값을 읽어올 수 없다!!! 
		System.out.println("request.getParamater()" + request.getParameter("name"));
				
		// 업로드된 파일의 정보를 출력
		
		/* 1. MultipartRequest 객체 생성
		 * 		요청파일을 해당 경로에 저장
		 * 		- 파일을 저장할 경로를 지정 해주어야 합니다.
		 * 		- 파일의 최대 사이즈를 지정 합니다.
		 * 		- 한글깨짐이 발생 할수 있으므로 인코딩 타입을 지정 합니다.
		 * 
		 * 		객체가 정상적으로 생성되면 파일은 자동으로 지정경로에 저장 됩니다.
		 * 		생성자의 매개변수로 저장경로, 파일의 최대크기, 인코딩방식을 지정
		*/
		MultipartRequest mr = new MultipartRequest(request, "c:/upload", 1024*1000, "utf-8");
		System.out.println("mr.getParameter()" + mr.getParameter("name"));
		
		// name속성을 이용해 파일을 확인
		String fileName = mr.getFilesystemName("attachedFile");
		System.out.println("파일명 : " + fileName);
		
	}

}
