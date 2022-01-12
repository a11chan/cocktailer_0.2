<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cocktail.board.BoardBean"%>
<%@ page import="cocktail.board.MemberBean"%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="bMgr" class="cocktail.board.BoardMgr" />
<jsp:useBean id="upBean" class="cocktail.board.BoardBean"/>
<jsp:setProperty name="upBean" property="*"/>

<%
	String nowPage = request.getParameter("nowPage");
	MemberBean memBean = bMgr.getPass();
	BoardBean bean = (BoardBean) session.getAttribute("bean");
	
	if(request.getParameter("pass") != null) {
		String upPass = upBean.getPass( );
		String dbPass = bean.getPass( );
		String dbaPass = memBean.getPass( );
		
		if(upPass.equals(dbPass)||upPass.equals(dbaPass)) {
			bMgr.updateBoard(upBean);
			String url = "read.jsp?nowPage="+nowPage+"&num="+upBean.getNum( );
			response.sendRedirect(url);
		} else {
			%>
			<script>
				alert("입력하신 비밀번호가 아닙니다.");
				history.back( );
			</script>
		<%
		}
	}
	%>