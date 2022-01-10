<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="board.BoardBean"%>
<% 
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
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/common.css" />
<link rel="stylesheet" href="css/update.css" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="jqueryUIplugin/jquery-ui.css" />
<link rel="shortcut icon" href="imgs/favicon.ico" />

<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="jqueryUIplugin/jquery-ui.js"></script>
<script src="js/menu.js"></script>

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
	<header>
		<h1 onClick="javascript:location.href='index.html'" class="logo">
			cock<span>tailer</span>
		</h1>
		<div class="topmenu">
			<!-- <a href="#">login</a> <a href="#">join</a> -->
		</div>
		<div class="topmenulogo">
			<!-- <i class="fas fa-user"></i> <i class="fas fa-sign-in-alt"></i> -->
		</div>
	</header>

	<div id="trigger">
		<span></span> <span></span> <span></span>
	</div>

	<nav id="mainmenu">
		<ul class="mainmenu__menu">
			<li><a href="sub1.html">our rums</a></li>
			<li><a href="sub2.html">flavors range</a></li>
			<li><a href="sub3.jsp">experiences</a></li>
			<li><a href="#"><i class="fab fa-facebook"></i></a> <a href="#"><i
					class="fab fa-twitter"></i></a> <a href="#"><i
					class="fab fa-instagram"></i></a></li>
		</ul>
	</nav>
	
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
	
	<footer>
		<div class="footerleft pc">
			<h6>칵테일러</h6>
			<p>김대표 | 광주 북구 경양로 170 | tel. 062-123-4567 fax.062-123-4568 |
				cocktailer@naver.com</p>
		</div>
		<div class="footerleft tb">
			<h6>칵테일러</h6>
			<h6>김대표</h6>
			<p>
				<span>|</span> 광주 북구 경양로 170
			</p>
			<p>
				<span>|</span> tel. 062-123-4567 fax.062-123-4568
			</p>
			<p>
				<span>|</span> cocktailer@naver.com
			</p>
		</div>
		<div class="footerright">
			<div class="footersnsbox">
				<i class="fab fa-facebook"></i>
				<i class="fab fa-twitter"></i>
				<i class="fab fa-instagram"></i>
			</div>
			<div class="sitemap">
				<span>사이트맵</span> <a href="#">↗</a>
			</div>
		</div>
	</footer>
</body>
</html>