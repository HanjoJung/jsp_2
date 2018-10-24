<%@page import="com.jhj.member.MemberDAO"%>
<%@page import="com.jhj.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberDTO dto = new MemberDTO();
	dto.setId(request.getParameter("id"));
	dto.setPw(request.getParameter("password"));
	String remember = request.getParameter("remember");

	if (remember != null) {
		Cookie cookie = new Cookie("remember", dto.getId());//이름(String)과 값(String)
		cookie.setMaxAge(60 * 60 * 24 * 365);
		response.addCookie(cookie);
	} else {
		Cookie cookie = new Cookie("remember", "");
		cookie.setMaxAge(0);
		response.addCookie(cookie);
	}

	MemberDAO dao = new MemberDAO();
	dto = dao.selectOne(dto);

	String str = "로그인 실패";
	String path = "./memberLogin.jsp";
	if (dto != null) {
		str = "로그인 성공";
		path = "../index.jsp";
		session.setAttribute("member", dto);
		//session.setMaxInactiveInterval(60*10);
	}

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