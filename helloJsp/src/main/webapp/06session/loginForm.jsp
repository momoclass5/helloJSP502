<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>로그인</h2>
<%
	String isError = request.getParameter("isError");
	//out.print(isError);
	if(isError != null && isError.equals("1")){
		out.print("아이디 비밀번호를 확인해주세요");
	}
%>
	<form action="loginProcess.jsp" method="post" name="loginFrm"
        onsubmit="return validateForm(this);">
        아이디 : <input type="text" name="user_id" required="required"/><br />
        패스워드 : <input type="password" name="user_pw" required="required"/><br />
        <input type="submit" value="로그인하기" />
    </form>
</body>
</html>