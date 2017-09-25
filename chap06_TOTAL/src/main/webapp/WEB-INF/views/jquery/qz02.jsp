<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<style>
</style>
<h3>JQuery 연습#2</h3>
아래 선택된 항복에 따라 총 상품금액을 계산해서 출력하는 script설정
<hr>
<div>
	<h3>삼성노트북 코어 i5</h3>
	판매가 : 650650
	<hr>
	옵션 :<span id="options"></span>
	<ul style="list-style: none;" >
		<li><input class="option" type="checkbox" data="24000" value="RAM 추가"/>RAM 추가 (+24,000)</li>
		<li><input class="option" type="checkbox" data="34000" value="HDD 추가"/>HDD 추가(+34,000)</li>
		<li><input class="option" type="checkbox" data="22000" value="외장그래픽카드 추가"/>외장그래픽카드 추가(+22,000)</li>
		<li><input class="option" type="checkbox" data="42000" value="OS 포함"/>OS 포함(+42,000)</li>
	</ul>	
	<hr>
	수량 : 
	<button id="minus">-</button>
	<input id="number" type="number" style="width:40px;" value="1" min="1"/>
	<button id="plus">+</button>&nbsp;
	<button id="add">추가</button>
	
</div>
<hr>
<div id="adds"></div>
<hr>
<div>전체 상품 총액 :<span id="total"></span></div>

<script>	

	// 옵션 누르기	
	var price =650650;
	var tot=0;
	var ar = [];
	$(".option").change(function(){
		var sum = 0;
		if($(this).prop("checked")){
			sum += parseInt($(this).attr("data"));
			//console.log(tot);
			console.log($(this).val());
			console.log(sum);
			ar.push($(this).val());
			// $(this).append("AA");
		}else{
			sum -= parseInt($(this).attr("data"));
			console.log(sum);
			ar.pop($(this).val());
		}
		price += sum;
		console.log(price);
		$("#options").html(ar);
	});
	
	
	// 수량 minus
	$("#minus").click(function(){
		if(parseInt($("#number").val()) > 1){
			var n = parseInt($("#number").val())-1;
			$("#number").val(n); 
			console.log($("#number").val());
		}
	});
	// 수량 plus
	$("#plus").click(function(){	
		console.log($("#number").val());
		var n = parseInt($("#number").val())+1;
		$("#number").val(n);
	});
	
	// 총액 계산
	var p = 0;
	$("#add").click(function(){
		var t = price*parseInt($("#number").val());
		tot += t;
		$("#adds").html("<button id=\"price"+(++p)+"\">"+t+"</button> "+$("#adds").html());
		$("#total").html(tot);
		//$("#total").html("<fmt\:formatNumber value=\""+parseInt(tot)+"\" pattern=\"#,###\"/>");
	});
	
</script>
