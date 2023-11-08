package com.momo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dao.EmpDao;
import com.momo.dto.EmpDto;

@WebServlet("/empList")
public class EmpListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       	
	protected void doGet(HttpServletRequest request
							, HttpServletResponse response) 
									throws ServletException, IOException {
				
		// 사원 리스트 조회
		//EmpDao dao = new EmpDao(getServletContext());
		EmpDao dao = new EmpDao();
		List<EmpDto> list = dao.getList();
		
		// 리스트를 request영역에 저장
		request.setAttribute("list", list);
		
		// view 페이지로 이동
		request
			.getRequestDispatcher("/jdbc/empList.jsp")
			.forward(request, response);
	}
	
}
