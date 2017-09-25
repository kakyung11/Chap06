<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3 id="q">JQuery</h3>
each() : 각 Element마다 다른 작업이 필요할 때 사용<br>
<c:forTokens var="t" delims="," items="봄,여름,가을,겨울">
	<button class="bt">${t }</button>
</c:forTokens>
<script>
	$("#q").click(function(){
		$(".bt").each(function(){
			//this.innerHTML += this.innerHTML;
			$(this).prop("disabled",true);
			console.log($(this).html()+ "/" + typeof this.innerHTML +"/"+$(this).html().lentgh);
			
			if($(this).html().length==2){
				window.alert($(this).html());
			}
		});		
	});
</script>
