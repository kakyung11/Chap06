<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="center">
	<h2>전체 회원 정보</h2>
	<table>
		<tr>
			<th>profile</th>
			<th>id</th>
			<th>name</th>
			<th>email</th>
		</tr>
		<c:forEach var="i" items="${memberInfo }" varStatus="vs">
			<tr>
				<c:choose>
				<c:when test="${!empty i.URL}">
					<td><img id="pre" src="${i.URL}" alt="사용자이미지" style="width: 100px; height: 100px; border-radius: 10%;"/></td>					
				</c:when>
				<c:otherwise>
					<td><img id="pre" src="/profiles/default.png" alt="기본이미지" style="width: 100px; height: 100px; border-radius: 10%;"/></td>
				</c:otherwise>
				</c:choose>
				<td>${i.ID }</td>
				<td>${i.NAME eq null ? '미지정' : i.NAME }</td>
				<td>${i.EMAIL }</td>
			</tr>
		</c:forEach>
	</table>
	
	<div align="center" >
		<c:forEach var="n" begin="1" end="${pageCount }" varStatus="vs">
			<c:choose>
				<c:when test="${n eq param.page }">
					<b style="color:orange">${n }</b>
				</c:when>
				<c:otherwise>			
					<a href="/member/readAllMemberInfo?page=${n }">
						<b style="color:blue">${n }</b>
					</a>
				</c:otherwise>
			</c:choose>
			<c:if test="${!vs.last }"> | </c:if>
			<c:if test="${vs.last }">&gt;</c:if>
		</c:forEach>
	</div>
</div> 
	
	