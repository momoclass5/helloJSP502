<%@page import="com.momo.dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>sendRedirect</h2>
<p>request영역은 하나의 요청에 대한 응답이 완료될 때 소멸 됨!!</p>

<% 
	// request 영역에 2개의 값을 저장
	// request 영역을 이용시 값이 유지 되지 않으므로 다른방법을 이용 해야 함
	request.setAttribute("request_str", "request_str");
	request.setAttribute("request_person", new Person("momo", 30));
	
	// session 영영에 값을 저장
	session.setAttribute("session_str", "session_str");

	// queryString을 통해 파라메터를 전달
	response.sendRedirect("requestRedirect.jsp?isRedirect=1");
	
	
%>









</body>
</html>