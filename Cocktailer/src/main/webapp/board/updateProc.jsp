<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="bMgr" class="cocktail.board.BoardMgr" />
<jsp:useBean id="bean" class="cocktail.board.BoardBean" scope="session"/> <!-- 수정전 게시물 -->
<jsp:useBean id="upBean" class="cocktail.board.BoardBean"/><!-- 수정후 게시물 -->
<jsp:setProperty name="upBean" property="*"/>

<%
	String nowPage = request.getParameter("nowPage");
	String upPass = upBean.getPass( );
	String inPass = bean.getPass( );
	if(upPass.equals(inPass)) {
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
%>