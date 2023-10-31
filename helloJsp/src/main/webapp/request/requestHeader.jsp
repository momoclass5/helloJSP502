<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>3. 요청 헤더 정보 출력 하기</h2>
	
	<%
	// Enumberation : 객체들을 집합체 형태로 관리하게 해주는 인터페이스
	// Iterator
	// 컬렉션에서 사용됨
	// list, set, map
	Enumeration<String> headers 
					= request.getHeaderNames();
	
	while(headers.hasMoreElements()){
		String headerName = headers.nextElement();
		String headerValue =  request.getHeader(headerName);
		out.print("<br>헤더명 : " + headerName);
		out.print("/ 헤더값 : " + headerValue);
	}
	
	%>
	
</body>
</html>