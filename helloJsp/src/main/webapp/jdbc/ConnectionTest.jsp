
<%@page import="com.momo.dao.EmpDao"%>
<%@page import="com.momo.common.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>JDBC 테스트 1</h2>
<%
	// connection 객체 생성
	DBConnection dbcon = new DBConnection();
	dbcon.stmt = dbcon.con.createStatement();
	dbcon.rs = dbcon.stmt.executeQuery("select sysdate from dual");
	
	dbcon.rs.next();
	out.print("데이터베이스 시간 : " + dbcon.rs.getString(1));
	
	// 자원반납
	dbcon.close();
	
	out.print("<br>init param : " + application.getInitParameter("INIT_PARAM"));
	out.print("<br>init param : " + application.getInitParameter("driver"));
	out.print("<br>init param : " + application.getInitParameter("url"));
	out.print("<br>init param : " + application.getInitParameter("id"));
	out.print("<br>init param : " + application.getInitParameter("pw"));
	
	//EmpDao dao = new EmpDao();
	//dao.getList();
%>
<h2>JDBC 테스트 2</h2>
<%
	DBConnection dbcon2 = new DBConnection(
							application.getInitParameter("driver")
							, application.getInitParameter("url")
							, application.getInitParameter("id")
							, application.getInitParameter("pw")
						);
	dbcon2.close();
%>
<h2>JDBC 테스트 3</h2>
<%
	DBConnection dbcon3 = new DBConnection(application);
	dbcon3.close();
%>
<h2>empDao.getList()</h2>
<%
	EmpDao empDao = new EmpDao(application);
	empDao.getList();
%>












</body>
</html>