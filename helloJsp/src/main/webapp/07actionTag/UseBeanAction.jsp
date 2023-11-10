<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>액션태그로 폼값 한번에 받기</h2>
	<jsp:useBean id="person" class="com.momo.dto.Person"></jsp:useBean>
	<!-- 와일드카드(*)를 사용하면 모든폼의 값을 한번에 자바빈즈에 입력할수 있다  -->
	<jsp:setProperty property="*" name="person"/>
	
	<ul>
		<li>
			<jsp:getProperty property="name" name="person"/>
		</li>
		<li>
			<jsp:getProperty property="age" name="person"/>
		</li>
	</ul>
	
	
</body>
</html>