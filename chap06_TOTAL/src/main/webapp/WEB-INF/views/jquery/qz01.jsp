<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>JQuery QZ01</h3>
jquery 연습#1
<hr/>
<input type="checkbox" id="all"/>
<hr/>
<c:forEach var="i" begin="10" end="19">
	<input type="checkbox" class="item" value="${i }"/>${i }....<br>
</c:forEach>
<hr>
<button id="move">휴지통으로</button>
<br>
<sapn id="del"></sapn>

<script>
	// length property 이용한 방식
		/*
		window.alert($("#all").length);
		window.alert($(".item").length);
		window.alert($("button").length);
		*/
	// JQuery로 객체 선택시 length라는 변수를 갖게 됨.
	$("#move").click(function(){
		var ar = [];
		for(var i=0; i<$(".item").length; i++){
			// get 이나 eq를 사용해서 탐색
			console.log($(".item").eq(i));	// JQuery 객체 (eq를 사용하는것이 좋음)
			console.log($(".item").get(i));	// HTML DOM 객체
			console.log("==================")
			if($(".item").eq(i).prop("checked")){
				ar.push($(".item").eq(i).val());
			}
			window.confirm(JSON.stringify(ar)+"들을 지우시겠습니까?");
			$("#del").html(JSON.stringify(ar));
			/*
			if($(".item").get(i).checked){
				window.alert($(".item").get(i).value);
			}
			*/
		}
		
	});
			
	// each 사용한 방식
	$("#all").change(function(){
		$(".item").prop("checked",$(this).prop("checked"));
	});	
	/*
	$("#move").click(function(){
		var ar =[];
		$(".item").each(function(){
			if($(this).prop("checked")){
				ar.push($(this).val());
			}
		});
		window.confirm(JSON.stringify(ar)+"들을 지우시겠습니까?");
		$("#del").html(JSON.stringify(ar));

	});
	*/
</script>