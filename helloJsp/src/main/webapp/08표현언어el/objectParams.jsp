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
<h2>객체 매개변수 설정</h2>
<%
	request.setAttribute("personObj", 
								new Person("momo", 25));
	request.setAttribute("str", "문자열");
	request.setAttribute("integer", new Integer(99));
%>
<jsp:forward page="objectResult.jsp"></jsp:forward>
</body>
</html>