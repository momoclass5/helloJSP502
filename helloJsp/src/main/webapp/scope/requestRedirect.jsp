<%@page import="com.momo.dto.Person"%>
<%@page import="java.time.Period"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>sendRedirect </h2>
<%
	/*
	redirect 방식을 이용시 다음 요청 페이지에 값을 넘기는 방법
		request 영역이 공유 되지 않으므로 request영역에 값을 저장 해도 유지가 안됨
		
		1. queryString을 이용 하는 방법
			queryString을 이용 할때에는 getParamater 메서드를 이용하여 값을 꺼내올수 있다
			
		2. session을 이용 하는 방법
			세션은 서버에 저장되는 영역므로 필요시 생성후 바로 제거 해준다
	*/
	String str = "";
	Person person = new Person();
	
	if(request.getAttribute("request_str") != null){
		str = request.getAttribute("request_str").toString();
	}

	if(request.getAttribute("request_person") != null){
		person = (Person)request.getAttribute("request_person");
	}
	
%>
<h2>getAttribute 출력</h2>
<p>리다이렉트시 request영역은 공유 되지 않으므로 값이 출력 되지 않음</p>
str : <%= str%>
<br>person : <%=person %>

<h2>queryString 출력</h2>
<p>queryString으로 전달한 데이터는 getParameter메서드를 이용해서 수집</p>
isRedirect : <%= request.getParameter("isRedirect") %>

<h3>session을 이용한 값 출력</h3>
session_str : <%=session.getAttribute("session_str") %>

<%
	// 세션에 저장된 속성을 제거 합니다.
	session.removeAttribute("session_str");
%>
<h3>세션 제거</h3>
session_str : <%=session.getAttribute("session_str") %>

</body>
</html>








