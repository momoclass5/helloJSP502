<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 로그인/로그아웃 링크 보여주기 
	- 세션에 userId가 null 이 아니라면 로그아웃 링크, 아니면 로그인 링크를 화면에 출력 
-->
<script type="text/javascript">
window.onload=function(){
	loginBtn.onclick=function(){
		loginForm.action = "loginForm.jsp";
		loginForm.submit();
	}
	
	logoutBtn.addEventListener('click',function(){
		//alert('test');
		loginForm.action = "logout.jsp";
		loginForm.submit();
	});
	
}
</script>
<form name="loginForm">
<%
	Object userId = session.getAttribute("userId");
	if(userId != null && !"".equals(userId)){
%>		
	<%=session.getAttribute("userId") %>님 환영합니다.
	<button id="logoutBtn">로그아웃</button>
<%	} else { %>
	<button id="loginBtn">로그인</button>
<%	} %>
<button id="logoutBtn">로그아웃</button>
</form>
<h2>게시판</h2>
</body>
</html>