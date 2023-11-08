package com.momo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dao.DeptDao;
import com.momo.dto.DeptDto;


/**
 * URL매핑('/deptList' 페이지를 요청 하면 실행)
 * - 요청 매서드에 따라서 실행되는 메서드가 결정
 * 
 * 주소표시줄, 링크 -> get방식 -> doGet() 메서드 호출
 * 
 * Controller 
 * - 사용자의 요청 정보를 수집
 * - 비지니스로직 호출
 * - View로 페이지 전환
 * 
 */
@WebServlet("/deptList")
public class DeptListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeptListController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// DB에 접근해서 리스트를 조회
		DeptDao dao = new DeptDao(request.getServletContext());
		List<DeptDto> list = dao.getList();
		
		request.setAttribute("list", list);
		// Controller에서 화면을 구성하는 태그를 작성하는것은
		// 매우 번거롭기 때문에 JSP를 이용해서 화면을 작성 후 페이지 전환 합니다  
		request.getRequestDispatcher("deptList.jsp").forward(request, response);
		
	}

}
