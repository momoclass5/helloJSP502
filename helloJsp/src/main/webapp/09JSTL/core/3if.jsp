<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>jstl 제어문을 통해 짝수/홀수 판단하기</h2>
<c:set var="num" value="101"/>

	<!-- 제어문에서 사용되는 속성
    	test 	: if 문에서 사용할 조건 지정 (표현언어 사용 가능)
    	var 	: 조건의 결과를 저장할 변수명
    	scope	: 변수가 저장될 영역
     -->
	<c:if test="${num mod 2 eq 0}" var="result">
		<!-- 조건이 참일때만 실행 됩니다.
		else문장이 없어요 -> 단일조건문 처리만 가능 합니다. -->
		<br>${num }은 짝수입니다.
	</c:if>
	result : ${result }
	<c:if test="${not result }">
		<br>${num }은 홀수 입니다
	</c:if>





</body>
</html>