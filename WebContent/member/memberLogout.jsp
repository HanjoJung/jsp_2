<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//session.setMaxInactiveInterval(0);
	//session.removeAttribute("member");
	session.invalidate();
	String str = "로그아웃 하셨습니다";
	String path = "../index.jsp";

	request.setAttribute("message", str);
	request.setAttribute("path", path);
	
	RequestDispatcher view = request.getRequestDispatcher("../common/result.jsp");
	view.forward(request, response);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>