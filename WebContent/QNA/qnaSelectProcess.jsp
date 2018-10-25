<%@page import="com.jhj.qna.QnaDTO"%>
<%@page import="com.jhj.qna.QnaDAO"%>
<%@page import="com.jhj.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	QnaDAO qnaDAO = new QnaDAO();
	QnaDTO qnaDTO = qnaDAO.selectOne(num);
	qnaDAO.qnaHitUp(qnaDTO);
%>
<html lang="en">
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>Bootstrap Theme Company Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../../../../../../../temp/bootstrap.jsp" %>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="60">

<%@ include file="../../../../../../../temp/header.jsp" %>

	<div class="container-fluid">
		<div class="row" align="center">
			<table class="table table-bordered table-hover" style="max-width: 1500px">
				<tr>
					<td style="width: 10%">번호</td>
					<td style="width: 50%">제목</td>
					<td style="width: 15%">작성자</td>
					<td style="width: 15%">작성날짜</td>
					<td style="width: 10%">조회수</td>
				</tr>
				<tr>
					<td><%=qnaDTO.getNum()%></td>
					<td><%=qnaDTO.getTitle()%></td>
					<td><%=qnaDTO.getWriter()%></td>
					<td><%=qnaDTO.getReg_date()%></td>
					<td><%=qnaDTO.getHit()%></td>
				</tr>
				<tr>
					<td colspan="5" align="center">내용</td>
				</tr>
				<tr>
					<td colspan="5" align="center"><%=qnaDTO.getContents()%></td>
				</tr>
			</table>
			<% 	MemberDTO memberDTO = (MemberDTO)session.getAttribute("member"); 
				String writer = request.getParameter("writer");
			%>
			<a href="./qnaList.jsp"><button>목록으로</button></a> 
			<%if(memberDTO != null){ %>
			<%} %>
			<%if(memberDTO != null && qnaDTO.getWriter().equals(writer)){ %>
			<a href="./qnaUpdate.jsp?num=<%=qnaDTO.getNum()%>"><button>수정</button></a>
			<a href="./qnaDelete.jsp?num=<%=qnaDTO.getNum()%>"><button>삭제</button></a>
			<a href="./qnaWriteForm.jsp?ref=<%=qnaDTO.getRef()%>&step=<%=qnaDTO.getStep()%>&depth=<%=qnaDTO.getDepth()%>">
			<button>답글 작성</button></a> 
			<%} %>
			<a href="./qnaReplyForm.jsp?num=<%=qnaDTO.getNum()%>">
			<button>답글 작성2</button></a> 
		</div>
	</div>
<%@ include file="../../../../../../../temp/footer.jsp" %>

</body>
</html>
