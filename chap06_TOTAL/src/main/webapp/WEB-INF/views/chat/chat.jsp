<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div align="center">
	<h3>Open Chat</h3>
	<div id="log" style="width: 80%; height:100%; background-color: #D5D5D5; overflow-y:scroll; word-break:break-all;" align="left">
	
	</div>
	<input type="text" id="f" style="width:80%; margin-top: 5px; padding: 4px"/>
</div>
<script>
	document.getElementById("f").onchange=function(){
		if(this.value.length!=0){
			ws.send(this.value);
			this.value="";
		}
	}

	var ws = new WebSocket("ws://192.168.10.73/ws/chat");
	ws.onopen=function(e){
		document.getElementById("log").innerHTML += "<p><b>오픈채팅 서버 접속 성공</b></p>";
	}
	ws.onerror=function(e){
		if(window.confirm("채팅서버 접속 실패\n 다시 접속하시겠습니까?")){
			ws = new WebSocket("ws://192.168.10.73/ws/chat");
		}
	}
	ws.onmessage=function(e){
		console.log(e.data +"/"+typeof e.data);
		var obj = JSON.parse(e.data);
		if(obj.mode=="chat"){
			document.getElementById("log").innerHTML += "<p><b>["+obj.sender+"] : "+obj.msg+"</b></p>";
		}
		if(obj.mode=="join"){
			document.getElementById("log").innerHTML += "<p><b>[새로운 사용자가 입장하였습니다.] 총 "+obj.cnt+"명 </b></p>";
		}
		if(obj.mode=="out"){
			document.getElementById("log").innerHTML += "<p><b>[사용자가 채팅방을 나갔습니다.] 총 "+obj.cnt+"명 </b></p>";
		}
		document.getElementById("log").scrollTop = document.getElementById("log").scrollHeight+25;
	}
	
</script>