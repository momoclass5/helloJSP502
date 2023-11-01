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

<h3>requestMain페이지 forward!!</h3>

<%

	String request_str = "값 없음";
	Person request_person = new Person();
	
	if(request.getAttribute("request_str") != null){
		request_str = request.getAttribute("request_str").toString();
	}
	if(request.getAttribute("reqest_person") != null){
		request_person = (Person)request.getAttribute("reqest_person");
	}
%>
<br><%= request_str %>
<br><%= request_person %>

</body>
</html>








