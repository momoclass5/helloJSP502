<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	window.onload = function(){
		let submitBtn = document.querySelector("#submitBtn");
		
		// 여러개의 이벤트를 적용 하고 싶은경우 이용
		submitBtn.addEventListener("click", function(){
			actionForm.action="formResult.jsp";
			actionForm.method="post"; // get, post
			// 폼 전송
			actionForm.submit();
		})
	}
</script>
<h2>폼값 전송하기</h2>
<form name="actionForm">
	이름 : <input type="text" name="name" /><br />
	성별 : <input type="radio" name="gender" value="Man" />남자
	       <input type="radio" name="gender" value="Woman" />여자<br />
	학력 :
	    <select name="grade">
	        <option value="ele">초딩</option>
	        <option value="mid">중딩</option>
	        <option value="high">고딩</option>
	        <option value="uni">대딩</option>
	    </select><br />
	관심 사항 : 
	    <input type="checkbox" name="inter" value="pol" />정치
	    <input type="checkbox" name="inter" value="eco" />경제
	    <input type="checkbox" name="inter" value="ent" />연예
	    <input type="checkbox" name="inter" value="spo" />운동<br />
	<input type="button" value="전송하기" id="submitBtn"/>
</form>
</body>
</html>