<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div align="right" style="background-color: mint">

	<c:choose>
		<c:when test="${!empty auth }">
			<a href="/member/logout">LOGOUT</a> | <a href="/member/readAllMemberInfo">AllMembers</a> |
			<a href="/my/info">INFO</a> | <a href="/my/profile">PROFILE</a> |
			<a href="/board/list">BOARD</a> | <a href="/market/list">MARKET</a> |
			<a href="/chat/chat">CHAT</a>
		</c:when>
		<c:otherwise>
			<a href="/member/login">LOGIN</a> | <a href="/member/join">JOIN</a> |
			<a href="/board/list">BOARD</a> | <a href="/market/list">MARKET</a> |
			<a href="/chat/chat">CHAT</a>
		</c:otherwise>	
	</c:choose>

</div>