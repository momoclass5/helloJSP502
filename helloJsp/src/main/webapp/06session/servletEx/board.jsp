
<%@page import="java.util.List"%>
<%@page import="com.momo.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 로그인/로그아웃 링크 보여주기 
	- 세션에 userId가 null 이 아니라면 로그아웃 링크, 아니면 로그인 링크를 화면에 출력 
-->
<%
	Object userId = session.getAttribute("userId");
	if(userId != null && !"".equals(userId)){
%>		
	<%=session.getAttribute("userId") %>님 환영합니다.
	<button>로그아웃</button>
<%	} else { %>
	<button>로그인</button>
<%	} %>
<h2>게시판</h2>

<table border="1">
	<tr>
		<th>일련번호</th>
		<th>제목</th>
		<th>내용</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<%	
	if(request.getAttribute("list") != null){
		List<BoardDto> list = (List<BoardDto>)request.getAttribute("list"); 
		for(BoardDto dto :list){
	%>
			
			<tr>
				<td><%= dto.getNum()%></td>
				<td><%= dto.getTitle()%></td>
				<td><%= dto.getContent()%></td>
				<td><%= dto.getId()%></td>
				<td><%= dto.getPostdate()%></td>
				<td><%= dto.getVisitcount()%></td>

			</tr>
	<%	}
	} 
	%>
</table>




</body>
</html>