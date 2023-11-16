<%@page import="com.momo.dto.Criteria"%>
<%@page import="com.momo.dto.PageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<%

	int totalCnt = 160;
	Criteria cri = new Criteria(); // pageNo = 1, amount = 10
	cri.setPageNo(13);
	PageDto pageDto = new PageDto(totalCnt, cri);
	
	/*
	int pageNo = 12;
	int startNo = 11;
	int endNo = 15;
	
	boolean prev = (startNo==1)? false : true;
	boolean next = true;
	*/
%>
</head>
<body>
<br>
<!-- 페이지네이션 -->
<nav aria-label="...">
  <ul class="pagination">
  	<!-- 앞으로 가기 버튼 시작 disabled : 비활성화 -->
    <li class="page-item <%= pageDto.isPrev() ? "" : "disabled"%>">
      <a class="page-link">Previous</a>
    </li>
    <!-- 앞으로가기 버튼 끝 -->
    
    <%for(int i=pageDto.getStartNo(); i<=pageDto.getEndNo(); i++){%>
	    <li class="page-item">
	    	<a class="page-link <%= pageDto.getCri().getPageNo() == i ? "active" : ""%>" href="#">
	    		<%=i %></a>
	    </li>
    <%} %>
    
    <!-- 뒤로가기 버튼 시작 -->
    <li class="page-item <%= pageDto.isNext() ? "" : "disabled"%>">
      <a class="page-link" href="#">Next</a>
    </li>
    <!-- 뒤로가기 버튼 끝 -->
  </ul>
</nav>


<!-- 부트스트랩 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>