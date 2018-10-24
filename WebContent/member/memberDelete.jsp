<%@page import="com.jhj.member.MemberDTO"%>
<%@page import="com.jhj.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = new MemberDTO();
	dto.setId(request.getParameter("id"));

	int result = dao.delete(dto.getId());

	String s = "delete fail";
	if (result > 0) {
		session.invalidate();
		s = "탈퇴되었습니다";
	}
	request.setAttribute("message", s);
	request.setAttribute("path", "../index.jsp");
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