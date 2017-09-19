<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="marketDao" class="org.greenda.web.models.MarketDao"/>
<html>
<head>
<title>Market goods list</title>
</head>
<body>
<style>
	th{
		border-bottom: 1px solid;
		text-align: left; 
	}
	th, td{
		padding: 10px;
	}
</style>
<div align="center">
	<h2><마켓></h2>
	</p>
	<form action="/market/search" method="post">
		<p>
			시작 금액 <input type="text" id="price" name="price" placeholder="금액">
			&nbsp; 경매물품만 <input type="checkbox" id="check" name="check">
			<button type="submit">검색</button>
		<p>
	</form>    
	</p>
	
	<table padding="10px" width="70%">
		<thead>
		<tr>
			<th width="10%">글번호</th>
			<th width="40%">상품명</th>
			<th width="20%">시작가</th>
			<th width="15%">즉구가</th>
			<th width="15%">마감일</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="m" items="${marketList}">
		<tr>
			<td>${m.NUM }</td>
			<td><a href="/market/view/${m.NUM }"> ${m.GOODS }</a>( /<fmt:formatNumber value="${m.GAB }" pattern="#,##0.00"/>일 남음)</td>	
			<td><fmt:formatNumber value="${m.STARTPRICE }" pattern="#,###"/></td>
			<td><fmt:formatNumber value="${m.INSTANTPRICE }" pattern="#,###"/></td>
			<td><fmt:formatDate value="${m.CUTOFFDATE }" pattern="yyyy-MM-dd"/></td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	<p>
		<a href="/market/add"><button type="button">상품등록</button></a>
	</p>	
</body>
</html>