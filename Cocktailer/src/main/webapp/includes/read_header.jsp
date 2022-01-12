<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<header>
		<h1 onClick="javascript:location.href='../index.jsp'" class="logo">
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
			<li><a href="/sub1.jsp">our rums</a></li>
			<li><a href="/sub2.jsp">flavors range</a></li>
			<li><a href="/sub3.jsp">experiences</a></li>
			<li><a href="#"><i class="fab fa-facebook"></i></a> <a href="#"><i
					class="fab fa-twitter"></i></a> <a href="#"><i
					class="fab fa-instagram"></i></a></li>
		</ul>
	</nav>