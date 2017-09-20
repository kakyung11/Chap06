<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div align="center">
	<h3>Open Chat <span id="cnt"></span>
	</h3>
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
		//console.log(e.data +"/"+typeof e.data);
		var obj = JSON.parse(e.data);
		document.getElementById("cnt").innerHTML = "("+obj.cnt+")";
		switch(obj.mode){
		case "join":
			document.getElementById("log").innerHTML += "<p><b style=\"color:green\">["+obj.user+"]가 입장하였습니다.</b></p>";
			break;
		case "chat":
			document.getElementById("log").innerHTML += "<p><b>["+obj.sender+"] : "+obj.msg+"</b></p>";
			break;
		case "out":
			document.getElementById("log").innerHTML += "<p><b style=\"color:red\">["+obj.user+"가 퇴장하였습니다.]</b></p>";
			break;
		}
		document.getElementById("log").scrollTop = document.getElementById("log").scrollHeight+25;
	}
	
</script>