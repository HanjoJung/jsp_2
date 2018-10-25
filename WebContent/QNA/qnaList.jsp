<%@page import="java.util.ArrayList"%>
<%@page import="com.jhj.qna.QnaDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.jhj.qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	QnaDAO qnaDAO = new QnaDAO();

	String kind = request.getParameter("kind");
	String search = request.getParameter("search");
	if (kind == null) {
		kind = "title";
	}
	if (search == null) {
		search = "";
	}

	//페이징
	//한 페이지 글의 출력
	int curPage = 1; //현재 페이지
	try {
		curPage = Integer.parseInt(request.getParameter("curPage"));
	} catch (Exception e) {
	}
	int perPage = 10; //한 페이지 글 갯수
	int startRow = (curPage - 1) * perPage + 1; //페이지 시작 번호
	int lastRow = curPage * perPage;
	List<QnaDTO> ar = qnaDAO.selectList(startRow, lastRow, kind, search);

	//1.전체 글의 수
	int totalCount = qnaDAO.getCount();
	//2.전체 페이지의 수
	int totalPage = totalCount / perPage;
	if (totalCount % perPage != 0) {
		totalPage++;
	}
	//3.전체 블럭수
	int perBlock = 10;
	int curBlock = totalPage / perBlock;
	if (curPage % perBlock != 0) {
		curBlock++;
	}
	int totalBlock = totalPage / perBlock;
	if (totalPage % perBlock != 0) {
		totalBlock++;
	}
	//4.블럭 수
	int startNum = (curBlock - 1) * perBlock + 1;
	int lastNum = curBlock * perBlock;
	if (curBlock == totalBlock) {
		lastNum = totalPage;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../temp/bootstrap.jsp"%>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	
	<div class="container-fluid">
		<div class="row" align="center">
			<h1>QNA List</h1>
			<table class="table table-bordered table-hover">
				<tr>
					<td style="width: 10%">번호</td>
					<td style="width: 50%">제목</td>
					<td style="width: 15%">작성자</td>
					<td style="width: 15%">작성날짜</td>
					<td style="width: 10%">조회수</td>
				</tr>
				<%
					for (QnaDTO qnaDTO : ar) {
				%>
				<tr>
					<td><%=qnaDTO.getNum()%></td>
					<td><a href="./qnaSelectProcess.jsp?num=<%=qnaDTO.getNum()%>&writer=<%=qnaDTO.getWriter()%>">
						
							<%for(int i=0;i<qnaDTO.getDepth();i++){%>
							=><%} %>
							<%=qnaDTO.getTitle()%></a></td>
					<td><%=qnaDTO.getWriter()%></td>
					<td><%=qnaDTO.getReg_date()%></td>
					<td><%=qnaDTO.getHit()%></td>
				</tr>
				<%
					}
				%>
			</table>

			<a href="./qnaWriteForm.jsp"
				style="float: left; margin-right: 10px;"><button>등록</button></a>
			<ul class="pagination" style="float: left; margin: 0;">
				<%
					if (curBlock > 1) {
				%>
				<li><a
					href="./qnaList.jsp?curPage=<%=1%>&kind=<%=kind%>&search=<%=search%>"><span
						class="	glyphicon glyphicon-step-backward"></span></a></li>
				<li><a
					href="./qnaList.jsp?curPage=<%=startNum - 1%>&kind=<%=kind%>&search=<%=search%>"><span
						class="glyphicon glyphicon-chevron-left"></span></a></li>
				<%
					}
					for (int i = startNum; i <= lastNum; i++) {
						if (curPage == i) {
				%>
				<li class="active"><a
					href="./qnaList.jsp?curPage=<%=i%>&kind=<%=kind%>&search=<%=search%>"><%=i%></a></li>
				<%
					} else {
				%>
				<li><a
					href="./qnaList.jsp?curPage=<%=i%>&kind=<%=kind%>&search=<%=search%>"><%=i%></a></li>
				<%
					}
					}
					if (curBlock < totalBlock) {
				%>
				<li><a
					href="./qnaList.jsp?curPage=<%=lastNum + 1%>&kind=<%=kind%>&search=<%=search%>"><span
						class="glyphicon glyphicon-chevron-right"></span></a></li>
				<li><a
					href="./qnaList.jsp?curPage=<%=totalPage%>&kind=<%=kind%>&search=<%=search%>"><span
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
	<%@ include file="../temp/footer.jsp"%>

</body>
</html>