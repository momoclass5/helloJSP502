<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	id : momo / pw : 1234 
	loginOk로 페이지 전환
	오류 메세지를 출력 할수 있도록 main페이지로 파라메터를 전달 
-->
<%

	// post방식에서 한글깨짐 처리
	// request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if("momo".equals(id) && "1234".equals(pw)){
		// request영역이 공유가 되지 않음
		// 웹브라우저로 다른 페이지를 요청할수 있도록 처리
		// 2번의 요청이 발생
		response.sendRedirect("loginOk.jsp?id=" + id);
	} else {
		// 1번의 요청으로 페이지를 전환 하므로 request영역이 공유가 된다
		RequestDispatcher d = request.getRequestDispatcher("main.jsp?isError=1");				
		d.forward(request, response);
	}

%>





</body>
</html>