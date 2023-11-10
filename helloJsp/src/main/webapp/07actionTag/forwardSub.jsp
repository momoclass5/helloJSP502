<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>포워드 결과 확인</h2>
	<ul>
		<li>
			page영역 : 
			<%=pageContext.getAttribute("pageAttr") %>
		</li>
		<li>
			request 영역 : 		
			<%=request.getAttribute("requestAttr") %>
		</li>
		
		<%
			//request.setCharacterEncoding("utf-8");
		%>
		<li>
			액션태그 param : 
			<%=request.getParameter("param") %>
		</li>
	</ul>


</body>
</html>

















