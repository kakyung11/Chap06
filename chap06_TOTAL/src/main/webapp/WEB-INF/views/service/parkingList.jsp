<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<h2>공영주차장 리스트</h2>
			
	<table padding="10px" width="80%">
		<tr>
			<th>주차장명</th>
			<th>주소</th>
			<th>주차장 종류</th>
			<th>전화번호</th>
			<th>주차면</th>
			<th>유무료구분</th>
			<th>기본주차요금</th>
			<th>추가 단위 요금</th>
		</tr>
		<c:forEach var="i" items="${data.row}">
		<tr>
			<td>${i.PARKING_NAME}</td>
			<td>${i.ADDR }</td>
			<td>${i.PARKING_TYPE_NM }</td>
			<td>${i.TEL }</td>
			<td>${i.CAPACITY }</td>
			<td>${i.PAY_NM }</td>
			<td>${i.TIME_RATE}</td>
			<td>${i.ADD_TIME_RATE }</td>				
		</tr>
		</c:forEach>
	</table>	
	
</div>