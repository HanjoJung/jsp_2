<%@page import="com.jhj.qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="com.jhj.qna.QnaDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	QnaDAO dao = new QnaDAO();

	int result = dao.update(dto);
	String str = "수정 완료";
	if (result == 0) {
		str = "수정 실패";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert('<%=str%>');
	location.href = "./qnaList.jsp";
</script>
</head>
<body>

</body>
</html>