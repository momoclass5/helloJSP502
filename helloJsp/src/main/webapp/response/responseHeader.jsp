<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>응답헤더 정보 출력하기</h2>
	<%
	response.addIntHeader("age", 100);	
	response.addHeader("id", "momo"); // 추가
	response.setHeader("id", "test"); // 수정
	
	
	Collection<String> headerNames 
					= response.getHeaderNames();
	for(String hName : headerNames){
		String hValue = response.getHeader(hName);
		out.print("<br>헤더명 : " + hName);
		out.print(" / 헤더값 : " + hValue);
	%>
	
	<li><%=hName %> : <%=hValue %></li>
	
	<%
	}
	%>
</body>
</html>