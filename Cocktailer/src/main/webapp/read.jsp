<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cocktail.board.BoardBean"%>

<jsp:useBean id="bMgr" class="cocktail.board.BoardMgr" />

<%
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
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/common.css" />
<link rel="stylesheet" href="css/read.css" />

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
	function list( ) {
		document.listFrm.action="list.jsp";
		document.listFrm.submit();
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
			<!-- <i class="fas fa-user"></i> -->
			<i class="fas fa-sign-in-alt"
				onClick="javascript:location.href='reply.jsp?nowPage=<%=nowPage%>&num=<%=num%>'">
			</i>
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