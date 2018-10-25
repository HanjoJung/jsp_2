<%@page import="com.jhj.member.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.jhj.notice.NoticeDTO"%>
<%@page import="com.jhj.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	NoticeDAO dao = new NoticeDAO();
	int curPage = 1;
	String kind = request.getParameter("kind");
	String search = request.getParameter("search");
	if (kind == null) {
		kind = "title";
	}
	if (search == null) {
		search = "";
	}
	try {
		curPage = Integer.parseInt(request.getParameter("curPage"));
	} catch (Exception e) {
	}
	int perPage = 10;
	int startRow = (curPage - 1) * perPage + 1;
	int lastRow = curPage * perPage;
	List<NoticeDTO> ar = dao.selectList(startRow, lastRow, kind, search);

	//페이징
	//1. 전체 글의 갯수
	int totalCount = dao.getCount(kind, search);
	//2. 전체 페이지의 갯수
	int totalPage = totalCount / perPage;
	if (totalCount % perPage != 0) {
		totalPage++;
	}
	//3. 전체 블럭의 갯수
	int perBlock = 5; //블럭당 숫자의 갯수
	int totalBlock = totalPage / perBlock;
	if (totalPage % perBlock != 0) {
		totalBlock++;
	}
	//4. curPage의 번호로 curBlock 구하기
	int curBlock = curPage / perBlock;
	if (curPage % perBlock != 0) {
		curBlock = (curPage / perBlock) + 1;
	}
	//5. curBlock 번호로 startNum, lastNum 구하기
	int startNum = (curBlock - 1) * perBlock + 1;
	int lastNum = curBlock * perBlock;
	if (curBlock == totalBlock) {
		lastNum = totalPage;
	}
%>
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
	
	<div class="container-fluid">
		<div class="row" align="center">
			<h1>Notice List</h1>
			<table class="table table-bordered table-hover">
				<tr>
					<td style="width: 10%">번호</td>
					<td style="width: 50%">제목</td>
					<td style="width: 15%">작성자</td>
					<td style="width: 15%">작성날짜</td>
					<td style="width: 10%">조회수</td>
				</tr>
				<%
					for (NoticeDTO noticeDTO : ar) {
				%>
				<tr>
					<td><%=noticeDTO.getNum()%></td>
					<td><a
						href="./noticeSelectProcess.jsp?num=<%=noticeDTO.getNum()%>&writer=<%=noticeDTO.getWriter()%>">
							<%=noticeDTO.getTitle()%></a></td>
					<td><%=noticeDTO.getWriter()%></td>
					<td><%=noticeDTO.getReg_date()%></td>
					<td><%=noticeDTO.getHit()%></td>
				</tr>
				<%
					}
				%>
			</table>

			<a href="./noticeWriteForm.jsp"
				style="float: left; margin-right: 10px;"><button>등록</button></a>
			<ul class="pagination" style="float: left; margin: 0;">
				<%
					if (curBlock > 1) {
				%>
				<li><a
					href="./noticeList.jsp?curPage=<%=1%>&kind=<%=kind%>&search=<%=search%>"><span
						class="	glyphicon glyphicon-step-backward"></span></a></li>
				<li><a
					href="./noticeList.jsp?curPage=<%=startNum - 1%>&kind=<%=kind%>&search=<%=search%>"><span
						class="glyphicon glyphicon-chevron-left"></span></a></li>
				<%
					}
					for (int i = startNum; i <= lastNum; i++) {
						if (curPage == i) {
				%>
				<li class="active"><a
					href="./noticeList.jsp?curPage=<%=i%>&kind=<%=kind%>&search=<%=search%>"><%=i%></a></li>
				<%
					} else {
				%>
				<li><a
					href="./noticeList.jsp?curPage=<%=i%>&kind=<%=kind%>&search=<%=search%>"><%=i%></a></li>
				<%
					}
					}
					if (curBlock < totalBlock) {
				%>
				<li><a
					href="./noticeList.jsp?curPage=<%=lastNum + 1%>&kind=<%=kind%>&search=<%=search%>"><span
						class="glyphicon glyphicon-chevron-right"></span></a></li>
				<li><a
					href="./noticeList.jsp?curPage=<%=totalPage%>&kind=<%=kind%>&search=<%=search%>"><span
						class="glyphicon glyphicon-step-forward"></span></a></li>
				<%
					}
				%>
			</ul>

			<form class="form-inline" action="./noticeList.jsp"
				style="float: right;">
				<div class="form-group">
					<select class="form-control" id="sel1"
						style="display: inline-block;" name="kind">
						<option>title</option>
						<option>contents</option>
						<option>writer</option>
					</select> <input type="text" class="form-control" id="search"
						placeholder="Enter search" name="search">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>
		</div>
	</div>
<%@ include file="../../../../../temp/footer.jsp" %>
</body>
</html>
