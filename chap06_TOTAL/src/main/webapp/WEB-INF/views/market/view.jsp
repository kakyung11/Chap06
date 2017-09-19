<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>market view</title>
</head>
<body>
<style>
input, textarea, button {
	padding: 4px;
	font-family: 맑은고딕;
	font-size: 9pt;
}
</style>
<div align="center" style="line-height: 35px">
	<h2>
		<a href="/market/list">경매 물품</a>
	</h2>
	<hr />
	<div
		style="width: 80%; border-radius: 10px; background-color: #e6dfdf; padding-left: 20px;"
		align="left">
		<input type="hidden" id="num" value="${m.NUM }" />
		<h3>${m.GOODS }</h3>
		<p style="padding-left: 10px;">
			<small>시작가 : ${m.STARTPRICE } | 즉구가 : ${m.INSTANTPRICE } | 종료일 :
				${m.CUTOFFDATE } </small>
		</p>
	</div>
	<div>
	입찰기록 : 
	</div> 
	<c:if test="${!empty auth}">
		입찰가 : <input type="text"/>
	</c:if>
	
</div>
</body>
</html>

