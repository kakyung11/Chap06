<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div align="right" style="background-color: mint">

	<c:choose>
		<c:when test="${!empty auth }">
			<a href="/member/logout">LOGOUT</a> | <a href="/member/readAllMemberInfo">AllMembers</a> |
			<a href="/my/info">INFO</a> | <a href="/my/profile">PROFILE</a> |
			<a href="/board/list">BOARD</a> | <a href="/market/list">MARKET</a> |
			<a href="/memo/list">MEMO</a> | <a href="/chat/chat">CHAT</a> |
			<a href="/member/search">친구찾기</a>
		</c:when>
		<c:otherwise>
			<a href="/member/login">LOGIN</a> | <a href="/member/join">JOIN</a> |
			<a href="/board/list">BOARD</a> | <a href="/market/list">MARKET</a> |
			<a href="/chat/chat">CHAT</a> | <a href="/member/search">친구찾기</a>
		</c:otherwise>	
	</c:choose>

</div>
<c:if test="${!empty auth }">
	<script>
		var userws = new WebSocket("ws://192.168.10.73/ws/loginUser");
		userws.onmessage=function(e){
			console.log(e.data);
			var obj = JSON.parse(e.data);
			switch(obj.mode){
			case "memo" :
				var msg = "["+obj.sender+"]님 으로 부터 새로운 쪽지가 도착했습니다.";
				if(window.confirm(msg)){
					location.href="/memo/list";
				}
				break;
			}
		} 
	</script>
</c:if>