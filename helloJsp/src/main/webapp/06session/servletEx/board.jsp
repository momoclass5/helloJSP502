
<%@page import="com.momo.dto.Criteria"%>
<%@page import="java.util.List"%>
<%@page import="com.momo.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  
  
<form method="get" name="loginForm">
<%
	// getAttribute의 반환 타입은 Object이므로 형변환이 필요합니다.
	// nullpointException을 방지하기 위해서 null체크를 진행
	// 로그인 버튼이 나오려면 - 
	// 로그아웃 버튼 나오려면 - 
	if(session.getAttribute("userId") != null
		&& !"".equals(session.getAttribute("userId").toString())){
		// 로그인한 사용자 - 로그아웃 버튼 출력 -> 세션을 만료 시키고 로그인페이지로 이동
%>
	<%=session.getAttribute("userId") %>님 환영합니다. 
	<button id="logoutBtn">로그아웃</button>
<%
	} else {
		// 로그인하지 않은 사용자 - 로그인버튼 출력 -> 로그인 페이지로 이동
%>
	<button id="loginBtn">로그인</button>
<%
	}
%>
</form>
<h2>게시글 목록</h2>
<table border="1">
	<tr>
		<th>일련번호</th>
		<th>제목</th>
		<th>내용</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<%	
	if(request.getAttribute("list") != null){
		List<BoardDto> list = (List<BoardDto>)request.getAttribute("list"); 
		for(BoardDto dto :list){
	%>
			
			<tr>
				<td><%= dto.getNum()%></td>
				<td><a href="/boardRead?num=<%=dto.getNum()%>"><%= dto.getTitle()%></a></td>
				<td><%= dto.getContent()%></td>
				<td><%= dto.getId()%></td>
				<td><%= dto.getPostdate()%></td>
				<td><%= dto.getVisitcount()%></td>

			</tr>
	<%	}
	} 
	%>
</table>


<!-- 페이지 네비게이션 작성 
	- 페이지 번호 pageNo
	- 페이지블럭당 페이지 수 ?
		페이지블럭의 시작번호 ~ 페이지블럭의 끝번호
		
	- 총 게시물의 수 totalCnt
	- 페이지당 게시물의 수 amount
		진짜 블럭의 끝번호

-->

<%
	out.print("<br>페이지블럭 시작 ========================================================");
	int startNo=0;
	int endNo=0;

	// 연산을 위해서 (올림처리를 위해) double 타입으로 선언
	// java에서 int/int = int
	double pagePerBlock = 10.0;
	
	Criteria cri = new Criteria();
	int totalCnt = 0;
	if(request.getAttribute("cri") != null 
			&& !"".equals(request.getAttribute("cri"))){
		cri = (Criteria)request.getAttribute("cri");
		out.print("<br>요청페이지번호 - pageNo : " + cri.getPageNo());
		out.print("<br>페이지당 게시물수 - amount : " + cri.getAmount());
	}
	if(request.getAttribute("totalCnt") != null 
			&& !"".equals(request.getAttribute("totalCnt"))){
		totalCnt = Integer.parseInt(request.getAttribute("totalCnt").toString());
		out.print("<br>총 게시물의 수 - totalCnt : " + totalCnt);
	}
	
	// 페이지 블럭의 시작 번호와 끝번호 구하기
	// 끝번호 구하기
	// 7페이지 요청 : 올림(7/10.0) * 10
	// 11페이지 요청 : 올림(11/10.0) * 10
	endNo = (int)(Math.ceil( cri.getPageNo() / pagePerBlock ) * pagePerBlock);
	startNo = endNo - ((int)pagePerBlock - 1);
	out.print("<br>");
	
	//페이지 블럭을 생성
	for(int i=startNo;i<=endNo;i++){
		out.print("<a href='/boardList?pageNo="+i+"'>" + i + "</a> ");
	}
%>





</body>
</html>








