<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>jobList 서블릿 호출결과</h2>
직급목록<br>
<%=request.getAttribute("list") %>
</body>
</html>