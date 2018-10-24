<%@page import="com.jhj.member.MemberDAO"%>
<%@page import="com.jhj.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberDTO dto = new MemberDTO();
	dto.setId(request.getParameter("id"));
	dto.setPw(request.getParameter("password"));
	dto.setName(request.getParameter("name"));
	dto.setEmail(request.getParameter("email"));
	
	MemberDAO dao = new MemberDAO();
	int result = dao.update(dto);
	
	if(result > 0){
		MemberDTO s = (MemberDTO)session.getAttribute("member");
		s.setPw(dto.getPw());
		s.setName(dto.getName());
		s.setEmail(dto.getEmail());
		response.sendRedirect("./memberList.jsp");
		
	}else{
		request.setAttribute("message", "수정 실패");
		request.setAttribute("path", "./memberList.jsp");
		
		RequestDispatcher view = request.getRequestDispatcher("../common/result.jsp");
		view.forward(request, response);
	}
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