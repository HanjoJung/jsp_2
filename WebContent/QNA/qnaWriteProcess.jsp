<%@page import="com.jhj.qna.QnaDTO"%>
<%@page import="com.jhj.qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<jsp:useBean id="qnaDTO" scope="page" class="com.jhj.qna.QnaDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="qnaDTO"/>
<%
	QnaDAO qnaDAO = new QnaDAO();
	int result = qnaDAO.insert(qnaDTO);
	
	String str = "등록 완료";
	if (result == 0) {
		str = "등록 실패";
	}
	
	//map과 같은 형태로 request 속성 추가
	request.setAttribute("message", str);
	request.setAttribute("path", "./qnaList.jsp");

	//forword
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