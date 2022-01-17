$(document).ready(function() {
	// navbar_menu
	$("#trigger").click(function(e) {
		e.preventDefault();
		$(this).toggleClass("active");
		$("#mainmenu").toggleClass("active");
	});
	
	// 좌측 div.pickingBox 라디오-체크박스 적용
	$("#noseBtn").click(function() {
		$('input[name="taste"]').not("#noseBtn").prop("checked", false);
	});
	$("#palateBtn").click(function() {
		$('input[name="taste"]').not("#palateBtn").prop("checked", false);
	});
	$("#finishBtn").click(function() {
		$('input[name="taste"]').not("#finishBtn").prop("checked", false);
	});
	$("#typeBtn").click(function() {
		$('input[name="taste"]').not("#typeBtn").prop("checked", false);
		// console.log($("#noseBtn").is(":checked"))
	});
	
	// 필터 항목 숨김처리 기능 시작
	// 숨김 스위치, input요소의 value는 상품의 속성임
	var tasteFilter = $(".submenu input");
	
	// 숨길 상품사진
	/*var targetList = $(".itemShow .itemBox");*/
	var targetList0 = $("ul.slides > li");
	
	// 숨길 상품명
	var targetList1 = $(".pickedBox > div > label");

	// sub1.jsp 내 모든 숨길 화살표들
	var chevronAll = $(".chevron");
	
	// div.pickedBox 내 숨길 화살표들
	var chevron1 = $(
		".pickedBox > .toLeft1, .pickedBox > .toRight1"
	);
	var chevron2 = $(
		".pickedBox > .toLeft2, .pickedBox > .toRight2"
	);
	var chevron3 = $(
		".pickedBox > .toLeft3, .pickedBox > .toRight3"
	);
	var chevron4 = $(
		".pickedBox > .toLeft4, .pickedBox > .toRight4"
	);
	
	// 페이지 로딩 후 상품관련 요소 숨김처리
	targetList0.hide();
	targetList1.hide();
	chevronAll.hide();
	
	// 숨김 스위치 작동시 실행할 내용들
	tasteFilter.click(function() {
		chevronAll.hide();
		targetList0.hide();
		targetList1.hide();

		var targetValue = [];
		tasteFilter.filter(":checked").each(function() {
			targetValue.push("." + $(this).val());
		});
		var targetClass = targetValue.join(", ");

		$(targetClass).fadeIn(); // 선택된 클래스 전부 표시(문서전체)
		
		// flex slider
		$('.flexslider').flexslider({
			animation: "slide",
		});
		
		// .pickedBox 좌우 화살표 fadeToggle
		if (targetClass.match(".n_")) {
			chevron1.fadeIn()
		} else {
			chevron1.hide();
		}

		if (targetClass.match(".p_")) {
			chevron2.fadeIn()
		} else {
			chevron2.hide();
		}

		if (targetClass.match(".f_")) {
			chevron3.fadeIn()
		} else {
			chevron3.hide();
		}

		if (targetClass.match(".t_")) {
			chevron4.fadeIn()
		} else {
			chevron4.hide();
		}

		if (targetClass == "") {
			chevronAll.fadeOut();
			$(".itemShow").fadeOut();
		}
		
		console.log(targetClass);
		
	}); // END:div.filterBox 내 클릭 이벤트 발생시 실행 코드
	
	// .pickedBox 좌우 스크롤
	$(".toLeft1").click(function() {
		$("div.box1 > div.pickedNose")
			.animate({ scrollLeft: "-=100" }, 30, "swing");
	});
	$(".toRight1").click(function() {
		$("div.box1 > div.pickedNose")
			.animate({ scrollLeft: "+=100" }, 30, "swing");
	});
	$(".toLeft2").click(function() {
		$("div.box2 > div.pickedPalate")
			.animate({ scrollLeft: "-=100" }, 30, "swing");
	});
	$(".toRight2").click(function() {
		$("div.box2 > div.pickedPalate")
			.animate({ scrollLeft: "+=100" }, 30, "swing");
	});
	$(".toLeft3").click(function() {
		$("div.box3 > div.pickedFinish")
			.animate({ scrollLeft: "-=100" }, 30, "swing");
	});
	$(".toRight3").click(function() {
		$("div.box3 > div.pickedFinish")
			.animate({ scrollLeft: "+=100" }, 30, "swing");
	});
	$(".toLeft4").click(function() {
		$("div.box4 > div.pickedType")
			.animate({ scrollLeft: "-=100" }, 30, "swing");
	});
	$(".toRight4").click(function() {
		$("div.box4 > div.pickedType")
			.animate({ scrollLeft: "+=100" }, 30, "swing");
	});
	
	// 검색 결과 출력화면 fadeToggle
	/*$(".itemShow").hide();*/
	$("#searchBtn").click(function() {
		$(".itemShow").fadeToggle();
	});
	
}); // end of script
