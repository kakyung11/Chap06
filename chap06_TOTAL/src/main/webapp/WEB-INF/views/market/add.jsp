<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div align="center">
	<h2>경매물품 등록</h2>
	<form action="/market/add" method="post">
		<p>
			물품명 : <input type="text" name="goods">
		</p>
		<p>
			시작가 : <input type="text" name="startPrice"><br>
			<span id="p"></span>
		</p>
		<p> 
			즉구가 설정이 필요하면  <button type="button" id="popen">클릭</button>
		</p>
		<p>
			마감일 설정이 필요하면 클릭 <button type="button" id="ppopen">클릭</button>
			<br>
			<span id="pp"></span>
		</p>
		<hr style="width:50%"/>
		<button type="submit">물품등록</button>
		
	</form>
	<script>
		document.getElementById("popen").onclick = function(){
			document.getElementById("p").innerHTML = "즉구가 : <input type=\"text\" name=\"instantPrice\">";
		}
		document.getElementById("ppopen").onclick = function(){
			document.getElementById("pp").innerHTML = "마감일 : <input type=\"date\" name=\"cutOffDate\">";
		}
	</script>
</div>