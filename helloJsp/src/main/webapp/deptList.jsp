<%@page import="com.momo.dto.DeptDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>부서목록</h2>
<%
	List<DeptDto> list = (List<DeptDto>)request.getAttribute("list");
	out.print(list);

%>

</body>
</html>