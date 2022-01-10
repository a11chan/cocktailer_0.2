<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cocktail.board.MemberBean"%>
<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="bMgr" class="cocktail.board.BoardMgr"/>
<jsp:useBean id="bean" class="cocktail.board.BoardBean" scope="session"/><!-- 수정전 게시물 -->
<jsp:useBean id="upBean" class="cocktail.board.BoardBean"/>
<jsp:setProperty name="upBean" property="*"/>

<%
	MemberBean memBean = bMgr.getPass();
	String nowPage = request.getParameter("nowPage");
	String outPass = upBean.getPass( );//입력 비밀번호
	String inPass = memBean.getPass( );//초기 비밀번호
	if(outPass.equals(inPass)) {
		bMgr.updateState(upBean); //게시물 수정처리(DB에 등록)
		String url = "read.jsp?nowPage="+nowPage+"&num="+upBean.getNum( );
		response.sendRedirect(url);
	} else {
%>
	<script>
		alert("입력하신 비밀번호는 유효하지 않습니다.");
		history.back( );
	</script>
<%
	}
%>