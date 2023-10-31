<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page buffer="1kb" autoFlush="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
버퍼
	응답 결과를 웹 브라우저로 즉시 전송하지 않고, 
	출력할 내용을 버퍼에 저장해 두었다가 일정량이 차면 클라이언트로 전송

	(CPU나 메모리에 비해 IO(입출력) 속도가 느리므로 응답결과를 버퍼에 
		저장해 두었다가 전송)
		
autoFlush
	true 	: 버퍼가 차면, 자동 전송
	false 	: 버퍼가 차면, 예외 Exception 발생으로 실행 중지
 -->
 
 <%
 	for(int i=0;i<100;i++){
 		out.println("abcde12345");
 	}
 	out.println("<br>");
 	out.println(out.getBufferSize());
 	out.println(out.isAutoFlush());
 
 %>
 
</body>
</html>