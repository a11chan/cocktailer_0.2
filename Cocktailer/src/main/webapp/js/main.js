$(document).ready(function() {
	
	// 미성년자 확인
	if (localStorage.getItem("age") === null) {
		$("#age_check").toggleClass("none");
		$("#age_form").submit(function(e) {
			var age = parseInt($("#age_text").val());
			if (age < 0 || age == 0 || isNaN(age)) {
				e.preventDefault();
				$("#age_check__alert").text("Please write real positive number");
			} else if (age > 2003) {
				e.preventDefault();
				$("#age_check__alert").text("You are too young!");
			} else {
				localStorage.setItem("age", age);
				$("#age_check").toggleClass("none");
				e.preventDefault();
			}
		});
	}
	
	// 메인메뉴
	$("#trigger").click(function(e) {
		e.preventDefault();
		$(this).toggleClass("active");
		$("#mainmenu").toggleClass("active");
	});

	// 메인 배경 이미지
	$(".flexslider").flexslider({
		animation: "slide",
		customDirectionNav: $(".custom-navigation a"),
		slideshowSpeed: 3500,
	});

	var barWidth = $(".numbox__bar").css("width");
	// bar 애니메이션
	$(function nowBar() {
		$("div.numbox__bar__now").animate({ width: barWidth }, 3500);
		$("div.numbox__bar__now").animate({ width: 0 }, 0, nowBar);
	});

	// 플렉스슬라이더 모바일 스와이프 시 텍스트 변경

	// 플렉스슬라이더 버튼 클릭시 텍스트 변경
	$("a.flex-prev, a.flex-next").click(function() {
		if ($("ul.slides li").eq(1).hasClass("flex-active-slide")) {
			$("div.numbox div").eq(0).text("1 / 3");
			$("div.numbox__bar__now").stop().animate({ width: barWidth }, 3500).stop();
		} else if ($("ul.slides li").eq(2).hasClass("flex-active-slide")) {
			$("div.numbox div").eq(0).text("2 / 3");
			$("div.numbox__bar__now").stop().animate({ width: barWidth }, 3500).stop();
		} else if ($("ul.slides li").eq(3).hasClass("flex-active-slide")) {
			$("div.numbox div").eq(0).text("3 / 3");
			$("div.numbox__bar__now").stop().animate({ width: barWidth }, 3500).stop();
		}
	});

	// 플렉스슬라이더 버튼 클릭 전 자동으로 text,bar 변경
	setInterval(function() {
		if ($("ul.slides li").eq(1).hasClass("flex-active-slide")) {
			$("div.numbox div").eq(0).text("1 / 3");
		} else if ($("ul.slides li").eq(2).hasClass("flex-active-slide")) {
			$("div.numbox div").eq(0).text("2 / 3");
		} else if ($("ul.slides li").eq(3).hasClass("flex-active-slide")) {
			$("div.numbox div").eq(0).text("3 / 3");
		}
	}, 3500);
});
