<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.BoardBean"%>
<%@ page import="java.util.Vector"%>

<jsp:useBean id="bMgr" class="board.BoardMgr" />
<%
request.setCharacterEncoding("utf-8");

int totalRecord = 0; // 전체 게시물 수
int numPerPage = 10; // 페이지당 게시물 수
int pagePerBlock = 5; // 페이지당 페이지 블럭수(다음 페이지로 넘기는 숫자들[n])
int totalPage = 0; // 전체 페이지 수
int totalBlock = 0; // 전체 블럭수
int nowPage = 1; // 현재 페이지
int nowBlock = 1; // 현재 블럭
int start = 0; // 게시물을 출력할 때 시작번호
int end = 10; // 게시물을 출력할 때 끝번호
int listSize = 0; // 현재 읽어온 게시물의 수
String keyWord = "", keyField = ""; //검색어, 검색 목록
Vector<BoardBean> vlist = null; // VO를 담을 Vector 객체

if (request.getParameter("keyWord") != null) {
	keyWord = request.getParameter("keyWord");
	keyField = request.getParameter("keyField");
}

if (request.getParameter("reload") != null) {
	if (request.getParameter("reload").equals("true")) {
		keyWord = "";
		keyField = "";
	}
}

if (request.getParameter("nowPage") != null) {
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
}

// 페이지 및 블록페이지 처리를 위한 코드
start = (nowPage * numPerPage) - numPerPage; // (현재페이지 수 x 페이지당 레코드 수(10)) - 페이지당 레코드 수 : 0, 10, 20...
end = start + numPerPage; // 시작페이지에서 페이지당 레코드수를 더하면 끝 페이지가 된다. : 10, 20, 30...
totalRecord = bMgr.getTotalCount(keyField, keyWord); // 전체 게시물 개수
totalPage = (int) Math.ceil((double) totalRecord / numPerPage); // 전체페이지 수(전체 게시물 수/페이지당 레코드 수)
nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock); // 현재 블럭페이지 계산(현재페이지/블럭당 페이지수)  
totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock); // 전체블럭계산(전체 페이지 수/블럭당 페이지수)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>COCKTAILER - Booking List</title>

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/common.css" />
<link rel="stylesheet" href="css/list.css" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="jqueryUIplugin/jquery-ui.css" />
<link rel="shortcut icon" href="imgs/favicon.ico" />

<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="jqueryUIplugin/jquery-ui.js"></script>
<script src="js/list.js"></script>

<script>
	function list() {
		document.listFrm.action = "list.jsp";
		document.listFrm.submit();
	}

	function pageing(page) {
		//페이지 번호[n] 를 클릭했을 때 실행, 페이지 번호에 해당하는 페이지를 보여줌
		document.readFrm.nowPage.value = page;
		//pageing()의 매개변수로 전달한 페이지 번호로 현재 페이지 번호를 지정
		document.readFrm.submit();
	}

	function block(value) { //블럭 페이지 이동 함수
		// Prev, Next 버튼을 클릭하면 실행, 이전 블럭 번호(nowBlock+1)와 다음 블럭 번호(nowBlock+1)를 value에 전달
		document.readFrm.nowPage.value =
	<%=pagePerBlock%>
	* (value - 1) + 1;
		document.readFrm.submit();
	}

	function read(num) { // 제목을 클릭하면 실행, 레코드 번호에 해당하는 글 내용 페이지를 보여준다.
		document.readFrm.num.value = num;
		document.readFrm.action = "readPass.jsp";
		document.readFrm.submit();
	}

	function check() { // 검색함수
		if (document.searchFrm.keyWord.value == "") {
			alert("검색어를 입력하세요.");
			document.searchFrm.keyWord.focus();
			return;
		}
		document.searchFrm.submit();
		// 검색어가 있으면 검색목록과 검색어를 list.jsp의 bMgr.getBoardList(keyField, keyWord, start, end); 로 전달
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
			Booking <span>List</span>
		</h4>

		<p>
			<span class="badge bg-secondary">Total : <%=totalRecord%>행(현재페이지:<%=nowPage%>/전체페이지:<%=totalPage%>)
			</span>
		</p>
		<%
		vlist = bMgr.getBoardList(keyField, keyWord, start, end);
		// start~end 페이지 번호만큼 게시물을 얻는다. 
		listSize = vlist.size(); // 화면에 보여질 게시물 개수(지금은 10개)
		if (vlist.isEmpty()) {
			out.println("등록된 게시물이 없습니다.");
		} else {
		%>
		<table class="table table-striped table-hover text-center">
			<thead>
				<tr>
					<th scope="col">번 호</th>
					<th scope="col" class="subject">참여형태</th>
					<th scope="col">신청인</th>
					<th scope="col">방문일</th>
					<th scope="col">처리상태</th>
				</tr>
			</thead>
			<%
			for (int i = 0; i < numPerPage; i++) { // numPerPage(페이지당 레코드 개수)
				if (i == listSize)
					break;
				BoardBean bean = vlist.get(i);
				int num = bean.getNum();
				String event = bean.getEvent();
				String name = bean.getName();
				int member = bean.getMember();
				String vDate = bean.getvDate();
				String state = bean.getState();
				int depth = bean.getDepth();
			%>
				<tr>
					<td><%=totalRecord - ((nowPage - 1) * numPerPage) - i%></td>
					<%
					//글번호, num과 다름
					%>
					<td>
						<a href="javascript:read('<%=num%>')" class="readNum"><%=event%></a>
					</td>
					<td><%=name%></td>
					<td><%=vDate%></td>
					<td><%=state%></td>
				</tr>
			<%
			} //내용 끝
			%>
		<%
		 }//if (vlist.isEmpty()) else:END
		%>
		</table>
		<!-- 페이징 및 블럭 처리 : 시작 -->
		<%
		int pageStart = (nowBlock - 1) * pagePerBlock + 1;
		// nowBlock(현재블럭), pagePerBlock(페이지당 블럭 개수:5)
		int pageEnd = ((pageStart + pagePerBlock) < totalPage) ? (pageStart + pagePerBlock) : totalPage + 1;
		//블럭당 시작페이지의 번호와 페이지당 블럭 개수를 더한 값이 총 페이지 개수보다 작으면
		if (totalPage != 0) {
		%>
		<div class="btn-toolbar justify-content-center">
			<div class="btn-group">
				<% if (nowBlock > 1) { %>
				<button type="button" class="btn btn-outline-secondary"
					onClick="javascript:block('<%=nowBlock - 1%>')" style="padding-top:3px">&laquo;
				</button>
				<% } %>
				
				<% for (; pageStart < pageEnd; pageStart++) { %>
				<button type="button" class="btn btn-outline-secondary
					<% if (pageStart==nowPage) { %>active<% } %>"
					onClick="javascript:pageing('<%=pageStart%>')" >
						<%=pageStart%>
				</button>
				<% } %>
				
				<% if (totalBlock > nowBlock) { %>
				<button type="button" class="btn btn-outline-secondary"
					onClick="javascript:block('<%=nowBlock + 1%>')" style="padding-top:3px">&raquo;
				</button>
				<% } %>
			</div>
		</div>
		<% } %>
		<!-- 페이징 및 블럭 처리 End-->
		
		<div class="d-flex justify-content-center">
			<button class="btn btn-secondary booking me-2" type="button"
			onClick="javascript:location.href='list.jsp'">예약현황</button>
			<button class="btn btn-secondary booking" type="button"
			onClick="javascript:location.href='sub3.jsp#application'">예약하기</button>
		</div>
		
		<form name="searchFrm" method="post" action="list.jsp" class="searchFrm ">
			<div class="input-group">
				<select name="keyField" class="form-select w-auto">
					<option selected>검색방법</option>
					<option value="event">참여형태</option>
					<option value="name">신청인</option>
					<option value="vDate">방문일</option>
					<option value="state">처리상태</option>
				</select>
				<input type="text" name="keyWord" placeholder="검색어 입력"
					class="form-control w-50">
				<button type="button" class="btn btn-secondary" onClick="javascript:check( )">찾기</button>
			</div>
			<input type="hidden" name="nowPage" value="1">
		</form>
		
		<form name="listFrm" method="post">
			<input type="hidden" name="reload" value="true">
			<input type="hidden" name="nowPage" value="1">
		</form>
		<form name="readFrm" method="get">
			<input type="hidden" name="num">
			<input type="hidden" name="nowPage" value="<%=nowPage%>">
			<input type="hidden" name="keyField" value="<%=keyField%>">
			<input type="hidden" name="keyWord" value="<%=keyWord%>">
		</form>
	</div>

	<div class="clear"></div>

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
				<i class="fab fa-facebook"></i> <i class="fab fa-twitter"></i> <i
					class="fab fa-instagram"></i>
			</div>
			<div class="sitemap">
				<span>사이트맵</span> <a href="#">↗</a>
			</div>
		</div>
	</footer>
</body>
</html>