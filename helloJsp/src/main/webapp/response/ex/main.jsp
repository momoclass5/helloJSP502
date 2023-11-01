<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>로그인</h2>
<%
	String isError = request.getParameter("isError");
	String id = "momo";
	if(request.getParameter("id") != null){
		id = request.getParameter("id");
	}
%>
<%= "1".equals(isError) ? "아이디 비밀번호를 확인해주세요" : "" %>
<form action="./login.jsp" method="post">
    아이디 : <input type="text" name="id" value="<%=id%>"/><br />
    패스워드 : <input type="text" name="pw" value="1234"/><br />
    <input type="submit" value="로그인" />
</form>


</body>
</html>