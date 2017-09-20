<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
	<h2>쪽지함</h2>
	<p>
		<b>${auth }</b>님에게 총 <b>${memoList.size()}</b> 개의 쪽지가 있습니다.
	</p>
	<form action="/memo/delete" method="post">
		<table style="width: 70%">
			<thead>
			<tr>
				<th><input type="checkbox" id="all" onchange="javascript:allcheck()"></th>
				<th width="20%">보낸사람</th>
				<th width="75%">내용</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="m" items="${memoList}">
			<tr>
				<td><input type="checkbox" class="check" name="no" value="${m.NO}"
						onchange="javascript:checks()"/></td>
				<td>${m.SENDER ne null ? m.SENDER : '알수없음' }</td>
				<td><pre style="font-family: 나눔고딕; font-size: 12pt">${m.CONTENT}</pre></td>
			</tr>
			</c:forEach>
			</tbody>
			<tfoot>
			<tr>
				<input type="hidden" name="receiver" value="${auth }"/>
				<td colspan="3"><button type="submit">삭제</button></td>
			</tr>
			</tfoot>
		</table>
	</form>
	<p>
		<%--!	<a href="/memo/delete.jsp?no=<%=t.get("no")%>"><button type="button">삭제</button></a></td> --%>
		<a href="/memo/send"><button>메세지 보내기</button></a> 
	</p>
</div>

<script>
	function allcheck(){
		var all = document.getElementById("all");
		var check = document.getElementsByClassName("check");
		// 전체 체크시
		if(all.checked){
			for(var i=0;i<check.length; i++){
				check[i].checked=true;
			}
		}
		else{
			for(var i=0;i<check.length; i++){
				check[i].checked = false;
			}
		}
	}
	function checks(){
		var check = document.getElementsByClassName("check");
		var all = document.getElementById("all");
		if(all.checked){
			for(var i=0;i<check.length; i++){
				if(check[i].checked==false){
					all.checked=false;
					break;	
				}
			}
		}else{
			var i;
			for(i=0;i<check.length; i++){
				if(check[i].checked==true){
					continue;
				}else{
					all.checked=false;
					break;
				}
			}
			if(i==check.length){
				all.checked=true;
			}
		}
	}
</script>
