<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>connection pool</h2>
요청이 있을때마다 매번 Connection객체를 생성할 경우,<br>
매번 네트워크통신을 통해 인증과정을 거쳐야 하므로 빈번한 연결과 해제는 시스템 성능에 큰 영향을 끼칠수 있다<br>

Connection객체를 Connection Pool이라는 공간에 미리 생성해 놓고 요청이 있을때<br>
이미 생성된 Connection객체를 가져다 사용 하고 사용이 끝나면 다시 반납하는 기법<br>

대부분의 WAS에서는 커넥션 풀을 비롯한 여러 자원을 JNDI서비스로 제공하고 있다<br>


<h2>JNDI</h2>
Java Naming and Directory Interface<br>
자바 프로그램에서 다양한 정보와 자원을 찾아내고 사용할 수 있게 도와주는 도구<br>
객체나 데이터의 전체경로를 몰라도 '이름'만 알고 있으면 객체를 찾아서 사용할수 있는 디렉터리 서비스






</body>
</html>