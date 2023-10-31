<%@page import="java.util.Arrays"%>
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
	// POST방식일때 발생하는 한글 깨짐 처리 -> 필터로 처리
	// 필터작성 : web.xml, 어노테이션
	request.setCharacterEncoding("UTF-8");	

	String id = request.getParameter("id");
	String sex = request.getParameter("sex");
	String favo = "";
	
	// 체크박스는 여러개가 선택 될수 있기 때문에 배열형태로 받아서 처리해야 합니다.
	String[] favoArr = request.getParameterValues("favo");
	// 1. 반복문을 이용해서 하나씩 출력
	// 배열의 처음부터 끝까지 돌면서 값을 저장
	for(String favoStr : favoArr){
		favo += favoStr + " ";
	}
	// 2. 인덱스를 이용한 반복 - 범위 지정 
	//for(int i=0;i<favoArr.length;i++){
	//	favo += favoArr[i] + " ";
	//}
	
	// 2. Arrays.toString()
	out.print("======================");
	out.print(Arrays.toString(favoArr));
	
	String intro = request.getParameter("intro");
%>
<ul>
	<li>아이디 : <%=id %></li>
	<li>성별 : <%=sex %></li>
	<li>관심사항 : <%=favo %></li>
	<li>자기소개 : <%=intro %></li>
</ul>








</body>
</html>