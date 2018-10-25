<%@page import="com.jhj.qna.QnaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int ref = 0;
	int step = 0;
	int depth = 0;
	try {
	ref = Integer.parseInt(request.getParameter("ref"));
	step = Integer.parseInt(request.getParameter("step"));
	depth = Integer.parseInt(request.getParameter("depth"));
	} catch (Exception e) {
	}
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
			<form action="qnaWriteProcess.jsp" method="post">
				<div class="form-group">
					<label for="title">제목:</label> <input type="text"
						class="form-control" id="title" placeholder="Enter title"
						name="title">
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
				<button type="submit" class="btn btn-default">등록</button>
				<input type="hidden" value="<%=ref%>" name="ref">
				<input type="hidden" value="<%=step%>" name="step">
				<input type="hidden" value="<%=depth%>" name="depth">
			</form>
		</div>
	</div>
	<%@ include file="../../../../../../../temp/footer.jsp"%>
</body>
</html>