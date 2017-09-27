<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h3 id="t">Jquery Animation effect</h3>
<div>
	<button id="bt1">HIDE/SHOW</button>
	<button id="bt2">FADE IN/OUT</button>
	<button id="bt3">SLIDE UP/DOWN</button>
	<button id="bt4">ANIMATE</button>
</div>
<div style="height: 150px; background: silver" id="tg">
	<h4>아무거나,,</h4>
</div>
<div style="height: 150px; background: fuchsia; display: none" >
	<h4>아무거나,,</h4>
</div>
<script>
	$("#bt4").click(function(){
		// animate는 수치 계열만 가능 -> 색깔변경 불가
		$("#tg").animate({"height":300}).animate({"font-size":"30pt"}).animate({"height":"0"}).slideUp();
	});

	$("#bt3").click(function(){
		//$("#tg").slideUp();
		//$("#tg").next().slideDown();
		$("#tg").slideToggle();
	});
	$("#bt2").click(function(){
		$("#tg").fadeOut();
		$("#tg").next().fadeIn();
		$("#t").fadeToggle();
	});
	
	$("#bt1").click(function(){
		// hide, show , toggle
		$("#tg").hide(1000);
		$("#tg").next().show(1000);
		$("#t").toggle();
	});

</script>