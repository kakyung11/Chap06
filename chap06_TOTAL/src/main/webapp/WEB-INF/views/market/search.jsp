<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="marketDao" class="org.greenda.web.models.MarketDao"/>
<html>
<head>
<title>Market search list</title>
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
		<c:forEach var="m" items="${searchList}">
		<tr>
			<td>${m.NUM }</td>
			<td>${m.GOODS }  ( /<fmt:formatNumber value="${m.GAB }" pattern="#,##0.00"/>일 남음)</td>
			<td><fmt:formatNumber value="${m.STARTPRICE }" pattern="#,###"/></td>
			<td><fmt:formatNumber value="${m.INSTANTPRICE }" pattern="#,###"/></td>
			<td><fmt:formatDate value="${m.CUTOFFDATE }" pattern="yyyy-MM-dd"/></td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	<p>
		<a href="/market/list"><button type="button">목록으로</button></a>
	</p>
</body>
</html>