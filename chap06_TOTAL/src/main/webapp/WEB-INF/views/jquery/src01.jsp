<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h3>JQuery Simple Ajax</h3>
<div>
	<button id="a">AJAX</button>
	<button id="b">AJAX</button>
</div>
<script>
	$("#a").click(function(){
		$.ajax({
			"type":"post", // default = get
			"async":false, // default = true;
			"url":"/jquery/dst02",
			"data":{
				"id":"jin",
				"pw":"111"
			}
		}).done(function(r){
			console.log(r+"/"+typeof r);
			var obj = JSON.parse(r);
			window.alert(obj.name+"/"+obj.gender);
		});
	});
	
	$("#b").click(function(){
		$.ajax({
			"url":"/jquery/dst03",
		}).done(function(r){ // Map이 리턴되어 r 자체가 객체로 돌아옴 -> 파싱할 필요 없음
							// String이라면 여전히 파싱 필요
			console.log(r+"/"+typeof r); 
			// var obj = JSON.parse(r); 
			window.alert(r.name+"/"+r.gender);
		});
	});
</script>