<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String kind = request.getParameter("kind");
	String classmate = "cm" + request.getParameter("grade")+ request.getParameter("class");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=id %>
<%=pw %>
<%=classmate %>

</body>
</html>