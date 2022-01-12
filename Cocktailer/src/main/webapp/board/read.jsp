<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cocktail.board.BoardBean"%>

<jsp:useBean id="bMgr" class="cocktail.board.BoardMgr" />

<% /* 변수설정 */
	request.setCharacterEncoding("utf-8");

	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	
	BoardBean bean = bMgr.getBoard(num);
	String event = bean.getEvent( );
	String name = bean.getName( );
	String tel = bean.getTel( );
	int member = bean.getMember( );
	String vDate = bean.getvDate( );
	String state = bean.getState( );
	
	session.setAttribute("bean", bean);
%>
<!DOCTYPE html>
<html>
<head>
<title>COCKTAILER - Booking List</title>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/common.css" />
<link rel="stylesheet" href="../css/read.css" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="shortcut icon" href="../imgs/favicon.ico" />

<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="../js/menu.js"></script>

<script>
	function list( ) {
		document.listFrm.action="list.jsp";
		document.listFrm.submit();
	}
</script>
</head>

<body>
	
	<%@ include file="../includes/read_header.jsp"%>
	
	<div class="container">
		<h4>
			Detail <span>Page</span>
		</h4>
		<div class="input-group mb-2">
			<span class="input-group-text">참여형태</span>
			<input type="text" class="form-control" value="<%=event%>" disabled>
		</div>
		<div class="input-group mb-2">
			<span class="input-group-text">신청인</span>
			<input type="text" class="form-control" value="<%=name%>" disabled>
		</div>
		<div class="input-group mb-2">
			<span class="input-group-text">연락처</span>
			<input type="text" class="form-control" value="<%=tel%>" disabled>
		</div>
		<div class="input-group mb-2">
			<span class="input-group-text">참여인원</span>
			<input type="text" class="form-control" value="<%=member%>" disabled>
		</div>
		<div class="input-group mb-2">
			<span class="input-group-text">방문일</span>
			<input type="text" class="form-control" value="<%=vDate%>" disabled>
		</div>
		<div class="input-group end">
			<span class="input-group-text">처리현황</span>
			<input type="text" class="form-control" value="<%=state%>" disabled>
		</div>
		
		<div class="btnSet d-flex justify-content-center">
			<a href="javascript:list( )" class="btn btn-secondary me-2">목 록</a> 
			<a href="update.jsp?nowPage=<%=nowPage%>&num=<%=num%>" class="btn btn-secondary me-2">수 정</a>
			<a href="delete.jsp?nowPage=<%=nowPage%>&num=<%=num%>" class="btn btn-secondary me-2">삭 제</a>
		</div>
	</div>
	
	<form name="listFrm" method="post">
		<input type="hidden" name="num" value="<%=num%>">
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<% if(!(keyWord==null || keyWord.equals("null"))) { %>
			<input type="hidden" name="keyField" value="<%=keyField%>">
			<input type="hidden" name="keyWord" value="<%=keyWord%>">
		<% } %>
	</form>
	
	<%@ include file="../includes/footer.jsp"%>
	
	</body>
</html>