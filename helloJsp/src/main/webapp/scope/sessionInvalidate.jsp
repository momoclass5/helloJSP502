<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>세션 무효화</h2>
<%
	// 세션의 기본 유효시간은 30분
	// 세션 무효화
	session.invalidate();
	
	// 세션 아이디를 새로 발급 
	request.getSession(true);
%>
<a href="sessionLocation.jsp">sessionLocation.jsp 바로가기</a>
</body>
</html>



