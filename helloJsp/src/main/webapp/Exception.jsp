<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int status = response.getStatus();
	
	if(status == 404){
		out.print("404 예외가 발생 하였습니다.");
		out.print("<br>파일 경로를 확인해주세요.");
	} else {
		out.print("예외사항이 발생 하였습니다.");
		out.print("관리자에게 문의해주세요.");
	}
%>
</body>
</html>













