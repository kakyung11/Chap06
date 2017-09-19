<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<h2>웹 소켓 테스트</h2>
	<p>
		# 이메일, 쪽지, 채팅 등 지속적으로 서버를 체크해야 하는것들은 웹소켓을 이용하는것이 알맞다
		# 간단히 메세지 보내고 바로 응답을 받는다면  ajax가 더 알맞다.
	</p>
<div id="rst">
	
</div>
<input type="text" id="txt">

<script>
	document.getElementById("txt").onchange = function(){
		var val = this.value;
		this.value="";
		ws.send(val);
	}


	var ws = new WebSocket("ws://192.168.10.73/ws/basic") // 웹소켓 생성
	// 설정 가능한 것
	ws.onopen = function(e){
		window.alert("서버측과 WS 연결 성공");
		console.log(e);
	}
	
	ws.onclose = function(e){
		window.alert("서버측과 WS 연결 해제");
		// tomcat연결과는 다른것		
	}
	ws.onerror = function(e) {
		window.alert("서버측과 WS 연결 장애");
	}
	ws.onmessage = function(e){
		window.alert("서버측으로 부터 메세지를 전달 받음");
		console.log(e);
		window.alert(e.data+"/"+typeof e.data);
	}
	
</script>