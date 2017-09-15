<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="myDao" class="org.greenda.web.models.MyDao"/>
<div align="center">
	<h2>${auth } 님의 정보</h2> 
	
	<form action="/my/info" method="post">
		<h3>세부 정보</h3>
		<table>
			<tr>
				<th>NAME</th>
				<td><input type="text" name="name" value="${detail.NAME}" required/></td>
			</tr>
			<tr>
				<th>GENDER</th>
				<c:choose>
					<c:when test="${'여' eq detail.GENDER}">
						<td>
							<input type="radio" name="gender" value="남"  required/>남
							<input type="radio" name="gender" value="여" checked required/>여
						</td>
					</c:when>
					<c:otherwise>
						<td>
							<input type="radio" name="gender" value="남" checked required/>남
							<input type="radio" name="gender" value="여" required/>여	
						</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<th>BIRTH</th>
				<td>
				<select name="birth">
				<c:forEach var="i" begin="1900" end="2017" step="1">
					<option value="${i}" ${i eq detail.BIRTH ? 'selected' : '' }>${i }년생</option> 
				</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
			<th>ADDRESS</th>
			<td><input type="text" style="width:350" name="address" value="${detail.ADDRESS eq null ? '미설정' : detail.ADDRESS}" required/></td>
			</tr>
			</table>
		<br>
		<input type="hidden" name="id" value="${auth }">
		<button type="submit" style="width: 169";>정보 수정</button>
		<br><br>
	</form>
		<a href="/my/drop"><button type="button" style="width: 169">회원 탈퇴</button></a>	

</div>