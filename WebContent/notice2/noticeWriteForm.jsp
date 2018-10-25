<%@page import="com.jhj.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>Bootstrap Theme Company Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="../temp/bootstrap.jsp"></jsp:include>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="60">

<jsp:include page="../temp/header.jsp"></jsp:include>

	<%
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
	%>
	<div class="container-fluid">
		<div class="row">
			<form action="noticeWriteProcess.jsp" method="post">
				<div class="form-group">
					<label for="title">제목:</label> <input type="text"
						class="form-control" id="title" placeholder="Enter title"
						name="title">
				</div>
				<div class="form-group">
					<label for="contents">작성자:</label> <input type="text"
						class="form-control" id="writer" name="writer"
						value="<%=memberDTO.getId()%>" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="contents">내용:</label>
					<textarea rows="10" cols="3" class="form-control" id="contents"
						placeholder="Enter contents" name="contents"></textarea>
				</div>
				<button type="submit" class="btn btn-default">등록</button>
			</form>
		</div>
	</div>
	<jsp:include page="../temp/footer.jsp"></jsp:include>
</body>
</html>