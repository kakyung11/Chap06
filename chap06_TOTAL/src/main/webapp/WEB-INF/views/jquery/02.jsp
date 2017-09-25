<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
input,button{
	height:25px;
}
</style>
<h3 id="t">JQuery</h3>
JQuery로 element가 가지고 있는 정보를 얻거나 설정하는 메소드를 제공함
<ul>
	<li>innerHTML -> html()</li>
	<li>value -> val()</li>
	<li>그외 attribute들 -> attr()</li>
	<li>특수 attribute들 -> prop() /
		(true,false 설정하는 attr들 : disabled, checked, readonly)</li> 
	<li>style -> css()</li>
</ul>
<input type="text" id="txt" class="i" maxlength="8"/>
<input type="text" class="i"/>
<hr>
<input type="email" id="e" class="i" size="40"/>
<input type="checkbox" id="cb" checked/>체크박스
<hr>
<button id="bt1" style="border-radius: 5px;">테스트1</button>
<button id="bt2" disabled>테스트2</button>
<button id="bt3">테스트3</button>
<button id="bt4">테스트4</button>
<button id="bt5">테스트5</button>
<script>
	$("#bt5").click(function(){
		window.alert($("#bt1").css("border-radius"));
		$("button").css("color","white");
		$("button").css("background","black");
	});
	
	$("#bt4").click(function(){
		var pc = $("#cb").prop("checked");
		window.alert(pc+"/"+typeof pc);//뽑는방법
		//---------------------------------
		$("#cb").prop("checked",false);//설정하는법
		$("#bt1").prop("disabled",true);
		window.alert($("#bt2").prop("disabled"));
		$("#bt2").prop("disabled", !$("#bt2").prop("disabled"));
	});

	$("#bt3").click(function(){
		var t = $("#txt").attr("maxlength");
		window.alert(t+"/"+typeof t);
		window.alert($("#e").attr("class"));
		//-------------------------------------		
		$(".i").attr("type","checkbox") // 설정, 속성지정은 한꺼번에 가능
	});

	$("#bt2").click(function(){
		window.alert($(".i").val());
		$(".i").val("");
	}); // 클래스들의 값을 뽑을때는 0번째 값이 뽑혀나온다

	$("#bt1").click(function(){
		window.alert($("#t").html()); // innerHTML을 뽑아오는것
		//$("#t").html("제이쿼리"); //innerHTML로 넣는 방법
		$("#t").html($("#txt").val());
		$("#txt").val("");
	});
</script>