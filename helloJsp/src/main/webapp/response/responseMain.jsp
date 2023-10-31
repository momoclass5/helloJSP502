<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>내장객체 - response</h2>
<%
	String msg = "";
	// 1. 만약 loginErr가 1이면 아이디/비밀번호를 확인해주세요
	if("1".equals(request.getParameter("loginErr"))){
		msg = "아이디/비밀번호를 확인해주세요";
	}
	out.print(msg);
	// forward를 사용할 경우 request 요청정보가 공유가 된다
	// 2. id입력 칸에 사용자가 입력한 아이디를 출력
	String id="momo";
	if(request.getParameter("id") != null){
		id = request.getParameter("id"); 
	}
	
	//out.print(request.getParameter("loginErr") + " / ");
	//out.print(request.getParameter("id"));
%>
<form action="responseLogin.jsp" method="post">
	아이디 : <input type="text" name="id" value="<%=id%>">
	비밀번호 : <input type="password" name="pw" value="1234">
	<button>로그인</button>
</form>

<h2>응답헤더 확인하기</h2>
<form action="responseHeader.jsp" method="get">
	<button>응답헤더</button>
</form>
</body>
</html>