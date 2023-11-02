<%@page import="com.momo.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");

// 체크박스는 값이 선택된경우 에만 넘어옵니다!!
// 체크박스의 값을 수집
String save_check 
		= request.getParameter("save_check");

out.print("save_check : " + save_check);
//save_check값이 null이 아니라면
if(save_check != null){
	// 쿠키에 아이디를 저장 합니다.
	CookieManager.makeCookie(response, "userId", id, 3600);
	
	/*
	Cookie cookie = new Cookie("userId", id);
	cookie.setMaxAge(3600);
	response.addCookie(cookie);
	*/
	out.print("아이디를 쿠키에 저장 했습니다.");
	
}
if(true){
//if("momo".equals(id) && "1234".equals(pw)){
	out.print("<h2>로그인 성공<h2>");
} else {
	String script = 
		"<script type='text/javascript'>"
		+ "	alert('id/pw를 확인해주세요');"
		+ "	history.go(-1);"
		+ "</script>";
	out.print(script);
%>
<!-- 
<script type="text/javascript">
	alert('id/pw를 확인해주세요');
	history.go(-1);
</script>
 -->
<%
} 
%>

</body>
</html>