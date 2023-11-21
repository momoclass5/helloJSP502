<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.odd{
		background-color: skyblue;
	}
</style>

</head>
<body>
<!-- 일반 for문 형태의 ForEach문 -->
<!-- forEach 태그를 활용한 반복문 
	begin 	: 시작값 
	end 	: 종료값
	step 	: 증가값
	var 	: 변수
-->
<%
	for(int i=1;i<=10;i=i+2){
		out.print("(i="+i+")");
	}
%>
<c:forEach begin="1" end="10" step="2" var="i">
	i : ${i } /
</c:forEach>


<!-- 
   varStatus 루프의 현재 상태를 알려주는 변수 이름  
   	current 	: var에 지정한 현재 루프의 변수값
   	index 		: var에 지정한 현재 루프의 인덱스값
   	count 		: 실제 반복횟수(1부터 시작)
   	first 		: 루프의 처음일때 true
   	last 		: 루프의 마지막일때 true
-->
<!-- 일반 for문의 경우 current, index, var 3가지 값이 동일 합니다. -->
<table border="1">
	<c:forEach begin="3" end="5" var="i" varStatus="loop">
		<!-- 첫번째 행인 경우, 버튼을 출력 합니다. -->
		<c:if test="${loop.first }">
			<tr>
				<td colspan="6"><button>글쓰기</button></td>
			</tr>
		</c:if>
		
		<tr>
			<td>i : ${i }</td>
			<td>loop.current : ${loop.current }</td>
			<td>loop.index : ${loop.index }</td>
			<td>loop.count : ${loop.count }</td>
			<td>loop.first : ${loop.first }</td>
			<td>loop.last : ${loop.last }</td>
		</tr>
		
		<!-- 마지막 행인 경우 버튼을 출력 합니다. -->
		<c:if test="${loop.last }">
			<tr>
				<td colspan="6"><button>글쓰기</button></td>
			</tr>
		</c:if>
	</c:forEach>
</table>

<h2>1~100까지 정수중 홀수의 합을 구해봅시다</h2>
<c:set var="sum" value="0"/>

<c:forEach begin="1" end="100" var="num">
	<c:if test="${num mod 2 eq 1 }">
		${sum = sum+num }	
	</c:if>
</c:forEach>	

<p>1부터 100까지 홀수의 합계 : ${sum }</p>

<h2>향상된 for문 형태의 forEach 태그</h2>
<%
	String[] rgba = {"red", "green", "blue", "black"};
	for(String color : rgba){
		out.print(color + "/");
	}
%>
<table border="1">
<c:forEach items="<%=rgba %>" var="color" varStatus="loop">
	<!-- index : 0부터 시작
		 count : 1부터 시작 (반복한 수만큼 증가)-->
	<c:set value='${loop.count mod 2 eq 1 ? "odd" : ""}' var="odd"></c:set>
	odd : ${odd }
	<tr class="${odd }">
		<td>color : ${color }</td>
		<td>loop.current : ${loop.current }</td>
		<td>loop.index : ${loop.index }</td>
		<td>loop.count : ${loop.count }</td>
		<td>loop.first : ${loop.first }</td>
		<td>loop.last : ${loop.last }</td>
	</tr>
	
</c:forEach>
</table>





</body>
</html>






















