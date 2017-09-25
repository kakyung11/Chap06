<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<h2><spna id="jq">JQuery 01</spna><small id="ch"></small></h2>
	jquery의 기본 사용 형태는  <b>$(selector ).action()</b><br>
	javaScript와 다르게, 선택된 요소(들)에 전부 action이 설정된다.
	
	<p>
		<c:forTokens items="월,화,수,목,금" delims="," var="str">
			<button class="wk">${str }</button>
		</c:forTokens>
		<button id="r">리셋</button>
	</p>
</div>
<script>
	// id 설정된것 = #, class = . , tag = tag이름
	
	// tag에 설정
	$("button").click(function(){
		console.log("button에 click액션 설정");
	});
	
	// class에 설정
	$(".wk").click(function(){
		//window.alert(this.innerHTML);
		document.getElementById("ch").innerHTML = this.innerHTML;
	});
	
	// id에 설정
	$("#r").click(function(){
		document.getElementById("ch").innerHTML = "";
	});
	
	$("#jq").click(function(){
		$("button").fadeToggle();
		$(document.getElementById("r")).fadeToggle();
	}); //-> 가능

	/*
	$("#jq").onclick = function(){
		$("#r").fadeToggle();
	} //-> 이거 안먹힘 문법이 다름
	*/
	
	console.log(document.getElementById("jq")); // javascript로 얻은 상태
	console.log("=====================");
	console.log($("#jq"));	// jquery로 얻은 상태
	console.log("=====================");
	console.log($(document.getElementById("jq"))); // jquery로 얻은 상태와 같음
	
	/*
	var ar = document.getElementsByClassName("wk");
	for(var i=0; i<ar.length; i++){
		ar[i].onclick = function(){
			document.getElementById("ch").innerHTML = this.innerHTML;
		}
	}

	document.getElementsByClassName("r").onclick = function(){
		document.getElementById("ch").innerHTML="";
	}
*/
</script>