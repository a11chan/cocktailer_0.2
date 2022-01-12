<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cocktail.board.BoardBean"%>

<% /* 변수설정 */
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	BoardBean bean = (BoardBean)session.getAttribute("bean");
	String event = bean.getEvent();
	String name = bean.getName(); 
	String tel = bean.getTel();
	int member = bean.getMember();
	String vDate = bean.getvDate();
	String state = bean.getState();
%>

<!DOCTYPE html>
<html>
<head>
<title>COCKTAILER - Booking List</title>

<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/common.css" />
<link rel="stylesheet" href="../css/reply.css" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="shortcut icon" href="../imgs/favicon.ico" />

<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="../js/menu.js"></script>

</head>

<body>
	<%@ include file="../includes/board_header.jsp"%>
	
	<div class="container">
		<h4>
			Administrator <span>Only</span>
		</h4>
		<form name="updateFrm" method="post" action="replyProc.jsp" onsubmit="return check()">
			<div class="input-group mb-2">
				<label class="input-group-text" for="eventSelect">처리내용</label>
				<select class="form-select" id="eventSelect" name="state">
					<option selected><%=state%></option>
					<option value="">==========</option>
					<option value="처리대기중">처리대기중</option>
					<option value="일정수립중">일정수립중</option>
					<option value="처리완료">처리완료</option>
				</select>
			</div>
			<div class="input-group end">
				<span class="input-group-text">비밀번호</span>
				<input type="password" name="pass" class="form-control" placeholder="관리자 비밀번호" required>
			</div>
				
			<div class="btnSet d-flex justify-content-center">
				<input type="button" value="이전화면" onClick="history.back( )" class="btn btn-secondary me-2">
				<input type="submit" value="처리확정" class="btn btn-secondary" >
			</div>
			
			<input type="hidden" name="name" value="<%=event%>">
			<input type="hidden" name="name" value="<%=name%>">
			<input type="hidden" name="tel" value="<%=tel%>">
			<input type="hidden" name="member" value="<%=member%>">
			<input type="hidden" name="vDate" value="<%=vDate%>" >
			<input type="hidden" name="nowPage" value="<%=nowPage %>">
			<input type='hidden' name="num" value="<%=num%>">
		</form>
	</div>
	
	<%@ include file="../includes/footer.jsp"%>
	
</body>
</html>