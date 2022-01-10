<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Cocktailer - experiences</title>

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap.min.css">

<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/common.css" />
<link rel="stylesheet" href="css/sub3.css" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="jqueryUIplugin/jquery-ui.css" />
<link rel="shortcut icon" href="imgs/favicon.ico" />

<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="jqueryUIplugin/jquery-ui.js"></script>

<script src="js/sub3.js"></script>
</head>

<body>
	<header>
		<a href="index.html">
			<h1 class="logo">
				cock<span>tailer</span>
			</h1>
		</a>
		<div class="topmenu">
			<!-- <a href="#">login</a> <a href="#">join</a> -->
		</div>
		<div class="topmenulogo">
			<!-- <i class="fas fa-user"></i> <i class="fas fa-sign-in-alt"></i> -->
		</div>
	</header>
	<div id="trigger">
		<span></span>
		<span></span>
		<span></span>
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

	<div class="banner">
		<div class="rotate">
			<h2>experiences</h2>
		</div>
		<div class="first">
			<h3>일상 속 칵테일 라이프 만들기</h3>
			<p>듣기만 하고 막상 어렵게만 느껴지는 럼을 일상 속에서 만날 수 있는 다양한 프로그램이 준비되어 있습니다.</p>
		</div>
	</div>

	<section class="second">
		<h4>
			Experiences <span class="color-pink">Program</span>
		</h4>
		<p>다양한 체험 프로그램을 통해 색다른 럼을 만나보세요.</p>
		<div class="container">
			<!-- 탭 메뉴 상단 시작 -->
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">class</li>
				<li class="tab-link" data-tab="tab-2">factory</li>
				<li class="tab-link" data-tab="tab-3">tasting</li>
			</ul>
			<!-- 탭 메뉴 상단 끝 -->
			<!-- 탭 메뉴 내용 시작 -->
			<div id="tab-1" class="tab-content current">
				<img src="./imgs/article1-fhd.jpg" />
				<div class="tab-des">
					<h5>cocktail class</h5>
					<p>칵테일 입문자들을 위해 칵테일의 재료, 도구, 기법 등 기본적인 요소에 대해 소개해 드립니다. 럼이 들어가는
						가장 대표적인 칵테일인 모히또와 피나콜라다를 함께 만들어 즐기는 시간을 가져보세요.</p>
					<table>
						<tbody>
							<tr class="con-left">
								<td><img src="./imgs/article-icon1.png" /></td>
								<td>90분</td>
							</tr>
							<tr class="con-right">
								<td><img src="./imgs/article-icon2.png" /></td>
								<td>만 18세 이상</td>
							</tr>
							<tr class="con-left">
								<td><img src="./imgs/article-icon3.png" /></td>
								<td>최대 10명</td>
							</tr>
							<tr class="con-right">
								<td><img src="./imgs/article-icon4.png" /></td>
								<td>70,000</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div id="tab-2" class="tab-content">
				<img src="./imgs/article2-fhd.jpg" />
				<div class="tab-des">
					<h5>rum factory tour</h5>
					<p>럼에 대해 깊이 알고싶어하는 분들을 위해 항상 열려있습니다. 가이드와 함께 럼이 만들어지는 공장에 방문하여
						제조 과정과 역사에 대해 공부해보세요.</p>
					<table>
						<tbody>
							<tr class="con-left">
								<td><img src="./imgs/article-icon1.png" /></td>
								<td>90분</td>
							</tr>
							<tr class="con-right">
								<td><img src="./imgs/article-icon2.png" /></td>
								<td>연령제한 없음</td>
							</tr>
							<tr class="con-left">
								<td><img src="./imgs/article-icon3.png" /></td>
								<td>최대 50명</td>
							</tr>
							<tr class="con-right">
								<td><img src="./imgs/article-icon4.png" /></td>
								<td>20,000</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div id="tab-3" class="tab-content">
				<img src="./imgs/article3-fhd.jpg" />
				<div class="tab-des">
					<h5>rum tasting tour</h5>
					<p>테이스팅 투어를 통해 럼을 맛보고 향을 느껴보세요. 다양한 종류의 럼을 시음해보고 나만의 취향을 찾으세요.
						프리미엄 럼도 시음할 수 있고, 끝난 후에는 구매도 가능합니다.</p>
					<table>
						<tbody>
							<tr class="con-left">
								<td><img src="./imgs/article-icon1.png" /></td>
								<td>75분</td>
							</tr>
							<tr class="con-right">
								<td><img src="./imgs/article-icon2.png" /></td>
								<td>만 18세 이상</td>
							</tr>
							<tr class="con-left">
								<td><img src="./imgs/article-icon3.png" /></td>
								<td>최대 20명</td>
							</tr>
							<tr class="con-right">
								<td><img src="./imgs/article-icon4.png" /></td>
								<td>35,000</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- 탭 메뉴 내용 끝 -->
		</div>
	</section>

	<section class="third" id="application">
		<h4>
			Program<span class="color-pink"> Application</span>
		</h4>
		<p>가족, 연인, 친구와 함께 색다른 체험을 경험하세요.</p>
		<div class="contentbox">
			<!--제일바깥그림자박스-->
			<div class="ap-bg">
				<!--와인장배경-->
				<div class="contactbox">
					<!--contactus,폼 감싸는 박스-->
					<div class="contact-us">
						<h6>Contact Us</h6>
						<div class="us-cont">
							<p>광주 북구 경양로 170</p>
							<p>cocktailer@naver.com</p>
							<p>tel. 062-123-4567</p>
							<p>평일 10:30 ~ 20 : 30</p>
						</div>
					</div>

					<form class="app-form" method="post" action="postProc.jsp">

						<div class="radioBox btn-group mb-2">
							<input type="radio" name="event" id="cClass" value="칵테일 클래스"
								class="btn-check" autocomplete="off" checked>
							<label for="cClass" class="btn btn-outline-secondary">칵테일 클래스</label>
							<input type="radio" name="event" id="fTour" value="럼 공장 투어"
								class="btn-check" autocomplete="off">
							<label for="fTour" class="btn btn-outline-secondary">럼 공장 투어</label>
							<input type="radio" name="event" id="rTasting" value="럼 시음 투어"
								class="btn-check" autocomplete="off">
							<label for="rTasting" class="btn btn-outline-secondary">럼 시음 투어</label>
						</div>

						<div class="inputSet1">
							<div class="inputSet">
								<input type="text" name="name" placeholder="신청자 닉네임(한글 또는 영문)"
									pattern="^[가-힣a-zA-Z]+$" required class="form-control mb-2" />
							</div>
							<div class="inputSet">
								<input type="tel" name="tel" placeholder="연락처 입력" maxlength="13"
									required class="form-control mb-2" />
							</div>
						</div>
						<div class="inputSet2">
							<div class="inputSet">
								<input type="number" min="1" name="member"
									placeholder="참여인원(신청자 포함)" required class="form-control mb-2" />
							</div>
							<div class="inputSet">
								<input type="date" name="vDate" data-placeholder="방문일 선택"
									required class="form-control mb-2" />
							</div>
						</div>
						<div class="inputSet3">
							<div class="inputSet">
								<input type="password" name="pass" placeholder="신청서 수정용 비밀번호"
									maxlength="8" required class="form-control mb-2" />
							</div>
						</div>

						<div class="sendSet">
							<input type="button" value="예약목록"
							onClick="javascript:location.href='list.jsp'" class="btn btn-secondary">
							<input type="reset" value="원래대로" class="btn btn-secondary" />
							<input type="submit" value="신청하기" class="btn btn-dark" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

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