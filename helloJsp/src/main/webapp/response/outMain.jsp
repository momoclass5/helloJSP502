<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - out</title>
</head>
<body>
<%
	// 다양한 타입의 값을 출력 할 수 있어요!
	out.print(1);
	out.print(false);
	out.print('가');
	out.print("잘가~");
	
	// 버퍼의 내용을 삭제
	out.clearBuffer();
	
	// 버퍼의 정보를 확인
	// 출력 버퍼의 크기
	out.print("<br>출력 버퍼의 크기" 
				+  out.getBufferSize());
	// 남은 버퍼의 크기
	out.print("<br>남은 버퍼의 크기" + out.getRemaining());
%>
</body>
</html>