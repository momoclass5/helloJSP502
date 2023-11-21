<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>import태그</h2>
<!-- 
	import : 외부파일을 현재 위치에 삽입
	
		url 	: 외부파일 파일 경로(나를 기준으로 잡아주세요!!!)
		scope 	: 영역
		var 	: 변수명
					변수명을 사용하면 선언과 삽입을 분리 할수 있습니다.
 -->
<!-- ../ : 상위폴더로 이동 -->
<hr>
<h2>외부파일에 매개변수 넣기</h2>
<!-- 
	- url의 쿼리스트링으로 전달하기
	- c:param 태그를 이용하기
 -->

<c:import url="../inc/link.jsp" var="link">
	<c:param name="title">링크페이지에 오신걸 환영 합니다.</c:param>
</c:import>
<hr>
<!-- html 주석  -->
<%-- java 주석 --%>
<%-- c:import url="../inc/otherPage.jsp"></c:import--%>

${link }
<h2>iframe을 이용한 외부자원 삽입하기</h2>
<iframe src="../inc/otherPage.jsp" style="width:100px;height:100px;"></iframe>

<h2>out태그 - el표현언어를 출력 합니다.</h2>
<!-- value속성을 이용해서 값을 지정 하고 태그안에도 값을 지정 한경우, 오류가 발생 할 수 있어요!!!!!  
	set태그를 이용해서 값을 지정 할때는 한가지 방법으로만 지정 합시다-->
<c:set var="iTag">
	i태그는 <i>기울임</i>을 표현합니다.
</c:set>

<c:out value="${iTag }"></c:out><br>

<!-- HTML 태그를 해석하여 마크업이 적용된 상태로 출력 -->
<c:out value="${iTag }" escapeXml="false"></c:out><br>
<c:out value="${param.text }" default="값없음"></c:out>
<c:out value="" default="빈 문자열도 값입니다"></c:out>

<h2>redirect</h2>
<!-- redirect : request영역이 공유되지 않아요!! -->
<%--
<c:redirect url="../inc/otherPage.jsp">
	<c:param name="title">제목</c:param>
</c:redirect>
 --%>


</body>
</html>
















