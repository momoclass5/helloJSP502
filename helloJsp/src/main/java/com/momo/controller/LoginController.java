package com.momo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.momo.dao.MemberDao;
import com.momo.dto.MemberDto;

@WebServlet("/06session/servletEx/loginProcess")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Controller의 역할
	 * 	- 파라메터 수집
	 * 	- 페이지 전환 (jsp로 요청을 위임)
	 * 
	 * 사용자의 로그인 요청을 처리
	 * 1. 파라메터 수집(id, pw)
	 * 2. DB로 부터 해당 사용자가 있는지 확인
	 * 		2-1. 사용자가 존재하면 로그인 처리(세션에 사용자정보를 저장)
	 * 		2-2. 사용자가 존재하지 않으면 이전페이지로 넘어가서 오류 메세지를 출력
	 * 
	 */
	protected void doPost(HttpServletRequest request
								, HttpServletResponse response) 
										throws ServletException, IOException {
		
		// servlet에서 세션을 사용하기 위해서 request로 부터 꺼내옵니다.
		HttpSession session = request.getSession();
		
		// 파라메터 수집
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		System.out.println("id : " + id);
		System.out.println("pw : " + pw);
		
		// 사용자정보 인증
		MemberDao dao = new MemberDao();
		MemberDto dto = dao.login(id, pw);
		
		// 페이지 전환
		if(dto != null){
			// 로그인 성공 -> session에 로그인 정보 저장 -> board.jsp 이동
			session.setAttribute("userId", dto.getId());
			session.setAttribute("MemberDto", dto);
			
			response.sendRedirect("board.jsp");
			
		} else {
			// 로그인 실패
			response.sendRedirect("loginForm.jsp?isError=1");
		}
		
		
		
		
	}

}
