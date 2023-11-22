
<%@page import="com.momo.dto.Criteria"%>
<%@page import="java.util.List"%>
<%@page import="com.momo.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<script type="text/javascript">
// 화면에서 동적인 처리
window.onload = function(){
	console.log('onload event ==============');
	let logoutBtn = document.querySelector("#logoutBtn");
	let loginBtn = document.querySelector("#loginBtn");

	if(logoutBtn != null){
		logoutBtn.onclick = function(){
			// 로그아웃
			loginForm.action="/logout";
			loginForm.submit();
		}
	}
	
	if(loginBtn != null){
		
		loginBtn.addEventListener('click', function(){			
			// 로그인페이지로 이동
			// 같은 경로에 있는 파일을 호출 했기 때문에 오류가 발생 하지 않았어요!
			loginForm.action="/06session/servletEx/loginForm.jsp";
			loginForm.submit();
		});
	}
	
	// select 요소의 옵션을 선택 하는 방법
	var searchField = '${pageDto.cri.searchField }';
	console.log("searchField : ", searchField);
	
	var options = searchForm.searchField.options;
	
	// select 요소의 옵션의 selected 속성을 제거
	for(let i = 0; i < options.length; i++){
		options[i].removeAttribute("selected");
	}
	
	// select 요소의 옵션의 selected 속성을 부여
	for(var i = 0; i< searchForm.searchField.options.length; i++){
		console.log(searchForm.searchField.options[i].value);
		if(searchForm.searchField.options[i].value == searchField){
			searchForm.searchField.options[i].setAttribute("selected", "selected");
		}
	}
	
}

// 함수는 onload 함수 외부에 작성 합니다!!!
/**
 * 입력받은 페이지 번호로 이동 합니다.
 */
function goPage(pageNo){
	// 파라메터로 넘어온 페이지 번호를 searchForm에 pageNo에 입력
	searchForm.action = '/boardList'
	searchForm.pageNo.value = pageNo;
	searchForm.submit();
}
/**
 * 상세 페이지로 이동하기
 */
function goDetail(num){
	// 파라메터로 넘어온 페이지 번호를 searchForm에 pageNo에 입력
	/*
		/boardRead?num=${dto.num }
	*/
	searchForm.action = '/boardRead';
	searchForm.num.value= num;
	searchForm.submit();
}


/**
 * 폼을 전송(요청) 합니다.
 */
function formSubmit(){
	//1. 폼을 선택 - 폼의 이름을 불러줍니다.
	//2. 폼의 요소를 선택 - 폼이름.요소의이름
	searchForm.pageNo.value = '페이지 번호';
	
	//3. 폼 전송하기 	- form의 action속성에 정의된 url을 요청 합니다.
	// 				- 폼안에 요소들을 파라메터로 전달
	searchForm.submit();
	
	
}
</script>
<!-- 로그인 여부를 체크
	로그인을 했을때 = 세션에 userId가 저장되어 있으면
		- 로그아웃 버튼을 출력
	없으면 
		- 로그인 버튼을 출력
 -->
<!-- 

	submit : form의 요소들을 파라메터로 가지고 서버에 요청
	action : 서버에 요청할 url 주소
	method : 요청 방식
				get : 조회용 파라메터 
				post: 등록, 수정용 파라메터
				
	* 버튼 생성했더라도 form안에 버튼이 하나밖에 없다면 해당 버튼은 서브밋 버튼이 된다!!!!!
  -->
  
  
<%@ include file="header.jsp" %>

<table width="90%" align="center">
	<tr>
		<td>
		
<h2>게시글 목록</h2>
<!-- 검색폼
pageDto : ${pageDto }
<br>cri : ${pageDto.cri }
<br>pageNo : ${pageDto.cri.pageNo }
<br>searchField : ${pageDto.cri.searchField }
<br>searchWord : ${pageDto.cri.searchWord }
 -->
<form name="searchForm">
pageNo : <input type="text" name="pageNo" value="${pageDto.cri.pageNo }">
num : <input type="text" name="num" value="">
<div class="input-group">
  <select class="form-select" name="searchField" id="inputGroupSelect04" aria-label="Example select with button addon">
    <!-- 선택된 요소의 value값이 서버로 넘어 갑니다. -->
	<option value="title" 
			${pageDto.cri.searchField eq 'title' ? 'selected' : ''}
			>제목</option>
	<option value="id" 
			${pageDto.cri.searchField eq 'id' ? 'selected' : ''}
			>작성자</option>
	<option value="content"
			${pageDto.cri.searchField eq 'content' ? 'selected' : ''}
			>내용</option>
  </select>
  <input type="text" name="searchWord" value="${pageDto.cri.searchWord }" class="form-control" aria-label="Text input with dropdown button">
  <button class="btn btn-outline-secondary" type="submit">검색</button>
</div>

</form>
<br>

<table border="1" class="table"> 
	<thead>
	<tr>
		<th>일련번호</th>
		<th>제목</th>
		<th>내용</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	</thead>
	
	<tbody>
<!-- 만약 리스트의 사이즈가 0이라면 조회된 데이터가 없습니다를 출력 -->
<!-- 만약 리스트의 사이즈가 0이 아니라면 목록을 출력 -->
	<c:if test="${empty list}" var="result">
		<tr><td colspan="6">조회된 데이터가 존재하지 않습니다.</td></tr>
	</c:if>
	
	<c:forEach items="${list }" var="dto">
		<tr>
			<td>${dto.num }</td>
			<td><a onclick="goDetail(${dto.num })">${dto.title }</a></td>
			<td>${dto.content }</td>
			<td>${dto.id }</td>
			<td>${dto.postdate }</td>
			<td>${dto.visitcount }</td>
		
		</tr>
	</c:forEach>
	</tbody>
</table>

<!-- pageNavi include -->
<%@include file="PageNavi.jsp" %>



		</td>
	</tr>
</table>


</body>
</html>








