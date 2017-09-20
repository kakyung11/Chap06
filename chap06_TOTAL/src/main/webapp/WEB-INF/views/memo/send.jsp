<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div align="center">
	<h2>쪽지보내기</h2>
	<form action="/memo/send" method="post">
		<table>
			<tr>
				<th>받을사람</th>
				<td><input type="text" list="memberList" name="receiver" placeholder="받는사람" required />
					<datalist id="memberList">
						<c:forEach var="m" items="${memberList }">
							<option value="${m.ID}" />
						</c:forEach>
					</datalist>
				</td>
			</tr>
			<tr>
				<th>보낼내용</th>
				<td><textarea rows="6" cols="40" name="content" placeholder="보낼내용"></textarea></td>
			</tr>
		</table>
		<p>
			<input type="hidden" name="sender" value="${auth }">
			<button type="submit">쪽지발송</button>
			<a href="/memo/list"><button type="button">쪽지함</button></a>
		</p>
	</form>
</div>