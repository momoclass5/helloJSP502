<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	단독으로 호출 되는 페이지가 아니므로 오류가 발생 할수 있음.
	다른 페이지에서 선언된 변수를 출력하는 화면 
-->
<ul>
	<li>String : <%=page_str %></li>
	<li>int : <%=page_int %></li>
	<li>person : <%=page_p.getAge() %>/<%=page_p.getName() %></li>
</ul>

<ul>
	<li>String : <%= pageContext.getAttribute("page") %></li>
	<li>int : <%= pageContext.getAttribute("page_int") %></li>
	<li>person : <%= pageContext.getAttribute("pagePerson") %></li>
</ul>

</body>
</html>





