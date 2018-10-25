<%@page import="com.jhj.member.MemberDTO"%>
<%@page import="com.jhj.notice.NoticeDAO"%>
<%@page import="com.jhj.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	NoticeDAO dao = new NoticeDAO();
	NoticeDTO dto = dao.selectOne(num);
	dao.noticeHitUp(dto);
	request.setAttribute("noticeDTO", dto);
%>
<jsp:useBean id="noticeDTO" class="com.jhj.notice.NoticeDTO" scope="request"></jsp:useBean>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>Bootstrap Theme Company Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../temp/bootstrap.jsp"%>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="60">

	<%@ include file="../temp/header.jsp"%>

	<div class="container-fluid">
		<div class="row" align="center">
			<table class="table table-bordered table-hover"
				style="max-width: 1500px">
				<tr>
					<td style="width: 10%">번호</td>
					<td style="width: 50%">제목</td>
					<td style="width: 15%">작성자</td>
					<td style="width: 15%">작성날짜</td>
					<td style="width: 10%">조회수</td>
				</tr>
				<tr>
					<td><%=dto.getNum()%></td>
					<td><%=dto.getTitle()%></td>
					<td><%=dto.getWriter()%></td>
					<td><%=dto.getReg_date()%></td>
					<td><%=dto.getHit()%></td>
				</tr>
				<tr>
					<td colspan="5" align="center">내용</td>
				</tr>
				<tr>
					<td colspan="5" align="center"><%=dto.getContents()%></td>
				</tr>
			</table>
			<%
				MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
				String writer = request.getParameter("writer");
			%>
			<%
				if (memberDTO != null) {
			%>
			<a href="./noticeWriteForm.jsp"><button>새글 작성</button></a>
			<%
				}
			%>
			<%
				if (memberDTO != null && memberDTO.getId().equals(writer)) {
			%>
			<a href="./noticeUpdateForm.jsp?num=<%=dto.getNum()%>"><button>수정</button></a>
			<a href="./noticeDeleteProcess.jsp?num=<%=dto.getNum()%>"><button>삭제</button></a>
			<%
				}
			%>
		</div>
	</div>


</body>
</html>
