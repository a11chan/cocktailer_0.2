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
%>
<!DOCTYPE html>
<html>
<head>
<title>COCKTAILER - Booking List</title>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/common.css" />
<link rel="stylesheet" href="../css/update.css" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="shortcut icon" href="../imgs/favicon.ico" />

<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="../js/menu.js"></script>

<script>
	function check( ) {
		if (document.updateFrm.pass.value == "") {
			alert("수정을 위해 비밀번호를 입력하세요.");
			document.updateFrm.pass.focus( );
			return false;
		}
		document.updateFrm.submit( );
	}
</script>
</head>

<body>

	<%@ include file="../includes/board_header.jsp"%>
	
	<div class="container">
		<h4>
			Detail <span>Page</span>
		</h4>
		<form name="updateFrm" method="post" action="updateProc.jsp" >
			<div class="input-group mb-2">
				<label class="input-group-text" for="eventSelect">참여형태</label>
				<select class="form-select" id="eventSelect" name="event">
					<option selected><%=event%></option>
					<option value="">==========</option>
					<option value="칵테일 클래스">칵테일 클래스</option>
					<option value="럼 공장 투어">럼 공장 투어</option>
					<option value="럼 시음 투어">럼 시음 투어</option>
				</select>
			</div>
			<div class="input-group mb-2">
				<span class="input-group-text">신청인</span>
				<input type="text" name="name" class="form-control" value="<%=name%>" pattern="^[가-힣a-zA-Z]+$" required>
			</div>
			<div class="input-group mb-2">
				<span class="input-group-text">연락처</span>
				<input type="text" name="tel" class="form-control" value="<%=tel%>" maxlength="13" required>
			</div>
			<div class="input-group mb-2">
				<span class="input-group-text">참여인원</span>
				<input type="text" name="member" class="form-control" value="<%=member%>" min="1" required>
			</div>
			<div class="input-group mb-2">
				<span class="input-group-text">방문일</span>
				<input type="date" name="vDate" class="form-control" value="<%=vDate%>" required>
			</div>
			<div class="input-group end">
				<span class="input-group-text">비밀번호</span>
				<input type="password" name="pass" class="form-control" placeholder="비밀번호" maxlength="8" required>
			</div>
			
			<div class="btnSet d-flex justify-content-center">
	    		<input type="button" value="이전화면" onClick="history.go(-1)" class="btn btn-secondary me-2">
	    		<input type="reset" value="원래대로" class="btn btn-secondary me-2">
	    		<input type="button" value="수정완료" onClick="check( )" class="btn btn-secondary">
	   		</div>
	   		
			<input type="hidden" name="nowPage" value="<%=nowPage %>">
			<input type='hidden' name="num" value="<%=num%>">
		</form>
	</div>
	
	<%@ include file="../includes/footer.jsp"%>
	</body>
</html>