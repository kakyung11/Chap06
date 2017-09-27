<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
	<div align="center">
		<h1>
			<a href="/">Web Application</a>
		</h1>
	</div>
</header>
<script>

	var aws = new WebSocket("ws://192.168.10.73/ws/alert");
	<!--var aws = new WebSocket("ws://172.30.1.1/ws/alert");-->
	aws.onmessage=function(e){
		console.log(e.data +"/"+typeof e.data);
		window.alert(e.data);
	} 
</script>