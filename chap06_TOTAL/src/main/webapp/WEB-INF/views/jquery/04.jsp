<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>JQuery Traversing</h3>
JQuery Dom 탐색<br>
- jQuery Dom select는 tagName, id, class가 없더라도 찾아가는것이 가능하다.<br>
parent(1개), children(배열로 나옴), sibling(배열로 나옴) but-> prev(1개), next(1개)을 이용해 가능하다.
특정 요소를 기준으로 작업
<hr/>
<div style="background:silver">
<h4>물자선택</h4>
<small>물자는 1이상으로 설정해주세요</small>
<ul id="t">
<c:forTokens items="물,식량,선원,화약" delims="," var="s">
	<li>
		<b>${s }</b>
		<button class="minus">-</button>
		<input type="number" value="1" style="width:45px;"/>
		<button class="plus">+</button>
	</li>
</c:forTokens>
</ul>
	<button id="b">확인</button>
	<button id="b2">테스트</button>
</div>
<div>
	설정이 끝나면 확인을 눌러주세요
</div>
<script>
	$("#t").parent().css("padding","5px"); // t의 직속상위는 해당 div (부모에 접근)
	//window.alert($("#t").children().length); // t의 자식 노드들은 배열로 나옴 -> 하위의 갯수가 나옴
	$("#b").click(function(){
		//window.alert($("#b").children().length) // text는 자식으로 카운트하지 않는다
		console.log($("#b").parent().css("background"));
		//$("#t").siblings().html("형제들"); // 자신을 제외한 같은 선상(동급)에 있는것들이 모두 나옴 -> 배열 (전체 형제에 접근)
		console.log($("#t").prev().html()); // t의 바로 앞 형제 -> small (prevAll -> 동위의 앞의 것들)
		console.log($("#t").next().html()); // t의 바로 뒤 형제 -> button (nextAll -> 동위의 뒤의 것들)
		console.log($("#t").prevAll().html()); // 값을 뽑으면 그룹의 0번째가 나옴->
		console.log($("#t").prevAll().eq(0).html());
		console.log($("#t").prevAll().eq(1).html());
		$("#t").prevAll().hide();
	});
	$("#b2").click(function(){
		// children은 모든 자식노드  / find는 특정 자식노드를 찾음(배열로 나옴)
		//$("#b2").prev().prev().children().eq(1).hide();
		$("#b2").prev().prev().children().eq(1).find("b").html("food"); // find는 특정 자식노드를 찾음 find("b")-> b태그
	});
	
	$(".minus").click(function(){
		if(parseInt($(this).next().val())>0){
			$(this).next().val(parseInt($(this).next().val())-1);
		}
	});
	$(".plus").click(function(){
		$(this).prev().val(parseInt($(this).prev().val())+1);
	});	
</script>


  












