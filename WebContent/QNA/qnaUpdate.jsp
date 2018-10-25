<%@page import="com.jhj.qna.QnaDTO"%>
<%@page import="com.jhj.qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	QnaDAO dao = new QnaDAO();
	QnaDTO dto = dao.selectOne(num);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>Bootstrap Theme Company Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../../../../../../../temp/bootstrap.jsp"%>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="60">

	<%@ include file="../../../../../../../temp/header.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<form action="qnaUpdateProcess.jsp" method="post">
				<input type="hidden" name="num" value="<%=dto.getNum()%>">
				<div class="form-group">
					<label for="title">제목:</label> <input type="text"
						class="form-control" id="title" placeholder="Enter title"
						name="title" value="<%=dto.getTitle()%>">
				</div>
				<div class="form-group">
					<label for="contents">작성자:</label> <input type="text"
						class="form-control" id="writer" name="writer"
						value="<%=dto.getWriter()%>">
				</div>
				<div class="form-group">
					<label for="contents">내용:</label>
					<textarea rows="10" cols="3" class="form-control" id="contents"
						placeholder="Enter contents" name="contents"><%=dto.getContents()%></textarea>
				</div>
				<div class="form-group">
					작성날자 : <input type="text" class="form-control" name="reg_dete"
						value="<%=dto.getReg_date()%>" readonly="readonly"> 조회수 :
					<input type="text" class="form-control" name="hit"
						value="<%=dto.getHit()%>" readonly="readonly">
				</div>
				<button type="submit" class="btn btn-default">등록</button>
			</form>
		</div>
	</div>

	<%@ include file="../../../../../../../temp/footer.jsp"%>
</body>
</html>