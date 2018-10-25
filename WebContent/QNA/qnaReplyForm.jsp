<%@page import="com.jhj.qna.QnaDAO"%>
<%@page import="com.jhj.qna.QnaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	QnaDAO qnaDAO = new QnaDAO();
	QnaDTO qnaDTO = qnaDAO.selectOne(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../../../../../../../temp/bootstrap.jsp"%>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="60">

	<%@ include file="../../../../../../../temp/header.jsp"%>


	<div class="container-fluid">
		<div class="row">
		<H1>RyplyForm</H1>
			<form action="qnaReplyProcess.jsp" method="post">
				<div class="form-group">
					<label for="title">제목:</label> <input type="text" readonly="readonly"
						class="form-control" id="title" name="title" value="<%=qnaDTO.getTitle()%>-re">
				</div>
				<div class="form-group">
					<label for="contents">작성자:</label> <input type="text"
						class="form-control" id="writer" name="writer" value="">
				</div>
				<div class="form-group">
					<label for="contents">내용:</label>
					<textarea rows="10" cols="3" class="form-control" id="contents"
						placeholder="Enter contents" name="contents"></textarea>
				</div>
				<input type="hidden" value="<%=qnaDTO.getRef()%>" name="ref">
				<input type="hidden" value="<%=qnaDTO.getStep()%>" name="step">
				<input type="hidden" value="<%=qnaDTO.getDepth()%>" name="depth">
				<button type="submit" class="btn btn-default">등록</button>
			</form>
		</div>
	</div>
	<%@ include file="../../../../../../../temp/footer.jsp"%>
</body>
</html>