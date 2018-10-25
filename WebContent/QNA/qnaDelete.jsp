<%@page import="com.jhj.qna.QnaDTO"%>
<%@page import="com.jhj.qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	QnaDAO dao = new QnaDAO();
	int num = Integer.parseInt(request.getParameter("num"));

	int result = dao.delete(num);

	String s = "삭제 실패";
	if (result > 0) {
		s = "삭제되었습니다";
	}
	request.setAttribute("message", s);
	request.setAttribute("path", "./qnaList.jsp");
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