<%@page import="com.momo.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>로그인 성공</h2>
<%=session.getAttribute("userId") %>님 환영합니다.
<hr>
<%
MemberDto dto = (MemberDto)session.getAttribute("memberDto");
%>
아이디 : <%=dto.getId() %><br>
이 름 : <%=dto.getName() %><br>
등록일 : <%=dto.getRegidate() %><br>



</body>
</html>