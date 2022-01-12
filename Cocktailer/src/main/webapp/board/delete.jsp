<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cocktail.board.BoardBean"%>

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
	String nowPage = request.getParameter("nowPage");
	int num = Integer.parseInt(request.getParameter("num"));
	
	if(request.getParameter("pass") != null) {
		String inPass = request.getParameter("pass");
		BoardBean bean = (BoardBean) session.getAttribute("bean");
		String dbPass = bean.getPass( );
		
		if(inPass.equals(dbPass)) {
			bMgr.deleteBoard(num);
			/*String url = "list.jsp?nowPage=" + nowPage;*/
			String url = "list.jsp";
			response.sendRedirect(url);
		} else {
%>
	<script>
		alert("입력하신 비밀번호가 아닙니다.");
		history.back( );
	</script>
<%		} //if-if-else:end
	} else {
%>
<script>
	function check( ) { // 비밀번호 입력 체크
		if (document.delFrm.pass.value == "") { // 비밀번호를 입력하지 않았으면
			alert("패스워드를 입력하세요.");
			document.delFrm.pass.focus( );
			return false;
		}
		document.delFrm.submit( );
	}
</script>
</head>

<body>
	<%@ include file="../includes/board_header.jsp"%>

	<div class="container">
		<h4>
			Password <span>Checking</span>
		</h4>
	
		<form name="delFrm" method="post" action="delete.jsp">
			<div class="input-group end">
				<span class="input-group-text">비밀번호</span>
				<input type="password" name="pass" placeholder="비밀번호 입력" class="form-control">
			</div>
			<div class="btnSet d-flex justify-content-center">
				<input type="button" value="이전화면" onClick="history.go(-1)" class="btn btn-secondary me-2">
				<input type="reset" value="초기화" class="btn btn-secondary me-2">
				<input type="button" value="삭 제" onClick="check( )" class="btn btn-secondary"> 
			</div>
			<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
			<input type="hidden" name="num" value="<%=num%>">
		</form>
	</div>
	
	<%@ include file="../includes/footer.jsp"%>
	
	<%
	} //if-else:end
	%>
</body>
</html>