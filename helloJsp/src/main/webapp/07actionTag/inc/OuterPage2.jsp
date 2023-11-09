<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
outerPage2
	<h2>외부파일 2</h2>
	<%
		String newVar2 = "외부파일2에서 선언한 변수";
	%>
	<ul>
		<li>page영역 속성 : <%=pageContext.getAttribute("attrPage") %></li>
		<li>request영역 속성이 : <%=request.getAttribute("attrRequest") %></li>
	</ul>
</body>
</html>