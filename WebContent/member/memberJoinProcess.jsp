<%@page import="com.jhj.member.MemberDTO"%>
<%@page import="com.jhj.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberDTO dto = new MemberDTO();
	dto.setId(request.getParameter("id"));
	dto.setPw(request.getParameter("password"));
	dto.setName(request.getParameter("name"));
	dto.setEmail(request.getParameter("email"));
	dto.setKind(request.getParameter("kind"));
	dto.setClassMate("cm" + request.getParameter("grade") + request.getParameter("class"));
	MemberDAO dao = new MemberDAO();
	int result = dao.insert(dto);
	String str = "가입되었습니다";
	if (result == 0) {
		str = "가입하지 못하였습니다";
	}
	request.setAttribute("message", str);
	request.setAttribute("path", "../index.jsp");
	
	//이동해야할 페이지의 주소
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