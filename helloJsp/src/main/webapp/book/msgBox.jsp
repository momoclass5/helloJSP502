<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 메세지 출력후 다른 페이지를 요청 하거나 뒤로가기 합니다. -->
<script type="text/javascript">
	let msg = '${msg}';
	let url = '${url}';
	if(msg != ''){
		alert(msg);
	}
	if(url != ''){
		location.href = url;
	} else {
		history.go(-1);
	}
	
	// 웹브라우저객체 BOM - location
	// 페이지 요청
	// location.href='/book/list';
	// 뒤로가기
	// history.go(-1);
	
	
</script>
</body>
</html>