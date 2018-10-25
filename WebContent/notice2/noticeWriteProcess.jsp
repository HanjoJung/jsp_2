<%@page import="com.jhj.notice.NoticeDAO"%>
<%@page import="com.jhj.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<jsp:useBean id="dto" class="com.jhj.notice.NoticeDTO" scope="page"></jsp:useBean>
	<jsp:setProperty property="*" name="dto"/>
	<%
	//NoticeDTO dto = new NoticeDTO();
	//dto.setTitle(request.getParameter("title"));
	//dto.setContents(request.getParameter("contents"));
	//dto.setWriter(request.getParameter("writer"));
	NoticeDAO dao = new NoticeDAO();
	int result = dao.insert(dto);
	String str = "등록 완료";
	if (result == 0) {
		str = "등록 실패";
	}
	
	//map과 같은 형태로 request 속성 추가
	request.setAttribute("message", str);
	request.setAttribute("path", "./noticeList.jsp");

	//forword
	RequestDispatcher view = request.getRequestDispatcher("../common/result.jsp");
	view.forward(request, response); 
	

	//redirect
	/* response.sendRedirect("../index.jsp");//이동해야할 주소 */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
</head>
<body>

</body>
</html>