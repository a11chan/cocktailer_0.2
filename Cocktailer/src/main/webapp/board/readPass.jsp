<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="cocktail.board.BoardBean"%>
<%@ page import="cocktail.board.MemberBean"%>

<jsp:useBean id="bMgr" class="cocktail.board.BoardMgr" />

<!DOCTYPE html>
<html>
<head>
<title>COCKTAILER - Booking List</title>

<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/common.css" />
<link rel="stylesheet" href="../css/delete.css" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="shortcut icon" href="../imgs/favicon.ico" />

<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="../js/menu.js"></script>

<% /* 변수설정 및 비밀번호 처리로직 */
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	String keyWordEnc = URLEncoder.encode(keyWord,"UTF-8");
	
	MemberBean memBean = bMgr.getPass();
	String dbaPass = memBean.getPass( ); 
	
	BoardBean bean = bMgr.getBoard(num);
	
	if(request.getParameter("pass") != null) {
		String inPass = request.getParameter("pass");
		String dbPass = bean.getPass( );
		
		if(inPass.equals(dbPass)) {
			String url = "read.jsp?num="+num+"&nowPage="+nowPage+"&keyField="+keyField+"&keyWord="+keyWordEnc;
			response.sendRedirect(url);
		} else if(inPass.equals(dbaPass)) {
			String url = "read.jsp?num="+num+"&nowPage="+nowPage+"&keyField="+keyField+"&keyWord="+keyWordEnc;
			response.sendRedirect(url);
		} else {
%>
	<script>
		alert("입력하신 비밀번호가 아닙니다.");
		history.back( );
	</script>
<%		} //if-if-else:end
	} else { //비밀번호 미입력 시 화면 표시
%>
<script>
	function check( ) {
		if (document.passFrm.pass.value == "") {
			alert("비밀번호를 입력하세요.");
			document.PassFrm.pass.focus( );
			return false;
		}
		document.passFrm.submit( );
	}
</script>
</head>

<body>
	
	<%@ include file="../includes/board_header.jsp"%>

	<div class="container">
		<h4>
			Password <span>Checking</span>
		</h4>
	
		<form name="passFrm" method="post" action="readPass.jsp">
			<div class="input-group end">
				<span class="input-group-text">비밀번호</span>
				<input type="password" name="pass" placeholder="신청서 작성시 비밀번호 입력" class="form-control">
			</div>
			<div class="btnSet d-flex justify-content-center">
				<input type="button" value="이전화면" onClick="history.go(-1)" class="btn btn-secondary me-2">
				<input type="reset" value="원래대로" class="btn btn-secondary me-2">
				<input type="button" value="확 인" onClick="check( )" class="btn btn-secondary"> 
			</div>
			<input type="hidden" name="num" value="<%=num%>">
			<input type="hidden" name="nowPage" value="<%=nowPage%>">
			<input type="hidden" name="keyField" value="<%=keyField%>"> 
			<input type="hidden" name="keyWord" value="<%=keyWord%>">
		</form>
	</div>
	
	<%@ include file="../includes/footer.jsp"%>	
	
	<%
	} //if-else:비밀번호 미입력시
	%>
</body>
</html>