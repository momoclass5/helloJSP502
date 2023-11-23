package com.momo;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/upload")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String saveDirectory = "C:/upload";	// 저장할 디렉터리의 실제 경로
		int maxPostSize = 1024 * 1000;		// 파일의 최대 크기(1MB)
		String encoding = "utf-8";			// 인코딩 방식

		// 1. MultipartRequest 객체 생성
	    // 		생성자의 매개변수로 저장경로, 파일의 최대크기, 인코딩방식을 지정
	    //		객체가 정상적으로 생성되면 파일은 업로드 됩니다
		MultipartRequest mr = new MultipartRequest(
										request, saveDirectory
										,maxPostSize, encoding);
	    
	    // 2. 새로운 파일명 생성
	    // 	동일한 파일명이 업로드 되는 경우, 기존파일이 소실될 위험이 있으므로 파일명을 변경합니다
	    String fileName = mr.getFilesystemName("attachedFile");
	    
	    // 첨부파일의 확장자
	    String ext = fileName.substring(fileName.lastIndexOf("."));
	    
	    // H : 0~23, S : millisecond
	    // 현재시간을 파일이름으로 지정
	    String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
	    String oFileName = fileName.substring(0, fileName.lastIndexOf("."));
	    
	    String newFileName = oFileName +"_"+ now + ext;
	    System.out.println("원본파일명 : " + fileName);
	    System.out.println("신규파일명 : " + newFileName);
	}

}
