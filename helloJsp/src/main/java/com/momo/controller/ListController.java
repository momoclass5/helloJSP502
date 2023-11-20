package com.momo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dao.BoardDao;
import com.momo.dto.BoardDto;
import com.momo.dto.Criteria;

@WebServlet("/list")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	/**
	 * 리스트롤 조회후 반환
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDao dao = new BoardDao();
		// request 영역에 list를 담아줍시다
		List<BoardDto> list = dao.getList(new Criteria());
		request.setAttribute("list", list);
		System.out.println("list : " + list);
		// forward - request 영역을 공유 하기 위해서
		request.getRequestDispatcher("/09JSTL/core/list.jsp").forward(request, response);
		
	}

}








