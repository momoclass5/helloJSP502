<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl의 core태그를 사용하기 위해 태그라이브러리 지시자를 추가 합니다.  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩 css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<style type="text/css">
	.pointer {
		curson : pointer;
	}
	
</style>
<script type="text/javascript">
/*
 	스크립트에서 함수를 정의 하는 방법
	function 함수명(파람0, 파람1, ...){
		
	}
	
	함수의 호출
	함수명(파람0, 파람1, ...);
	
*/

function msg(str){
	alert(str);
}
msg("안녕하세요");
msg("반가워요~!");

// 화면 요청
// location.href = "/book/view?no=1"; 
</script>

</head>
<body>
<h2>도서목록</h2>
list : ${list }

<table class="table">
  <thead>
    <tr>
      <th scope="col">도서번호</th>
      <th scope="col">도서명</th>
      <th scope="col">작가</th>
      <th scope="col">대여여부</th>
    </tr>
  </thead>
  <tbody>
  
<!-- 리스트가 비어 있다면 메세지 출력 --> 
<c:if test="${empty list}" var="res">
	<tr>
		<td colspan="4">도서목록이 존재 하지 않습니다.</td>
	</tr>
</c:if>

<!-- 리스트가 비어 있지 않다면 도서목록을 출력 -->
<c:if test="${not res }">
	<c:forEach items="${list }" var="dto">
    <tr>
      <th scope="row">${dto.no }</th>
      <td class = "pointer" onclick="msg('제목이 클릭 되었어요')" >
      		${dto.title }
      </td>
      <td>${dto.author }</td>
      <!-- Y/N -> 대여/대여중 -->
      <td>${dto.rentYnStr }</td>
    </tr>
    </c:forEach>
</c:if>



  </tbody>
</table>

<!-- 부트스트랩 js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>