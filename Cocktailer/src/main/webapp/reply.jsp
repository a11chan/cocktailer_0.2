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
	String state = bean.getState();
%>

<!DOCTYPE html>
<html>
<head>
<title>COCKTAILER - Booking List</title>

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/common.css" />
<link rel="stylesheet" href="css/reply.css" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="jqueryUIplugin/jquery-ui.css" />
<link rel="shortcut icon" href="imgs/favicon.ico" />

<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="jqueryUIplugin/jquery-ui.js"></script>
<script src="js/menu.js"></script>

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