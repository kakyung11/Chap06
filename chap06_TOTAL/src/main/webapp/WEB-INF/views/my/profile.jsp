<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.bt{
	padding:3pt;
	width:50px;
}
</style>
<div align="center">
	<h3>프로필 사진 관리</h3>
	<div>
		<div style="height: 200px; width: 200px;">
			<c:choose>
				<c:when test="${!empty RecentProfile.FILEURL}">
					<img id="pre" src="${RecentProfile.FILEURL}" alt="사용자이미지" style="width: 100%; height: 100%; border-radius: 10%;"/>					
				</c:when>
				<c:otherwise>
					<img id="pre" src="/profiles/default.png" alt="기본이미지" style="width: 100%; height: 100%; border-radius: 10%;"/>
				</c:otherwise>
			</c:choose>
		</div>
		<div style="margin-top: 20px;">
		<form action="/my/profile" method="post" enctype="multipart/form-data" style="display: block;">
			<input type="file" id="profile" name="profile" style="display: none"/>
			<input type="hidden" id="id" name="id" value="${auth }"/>
			<button type="submit" class="bt">적용</button>
			<button type="button" class="bt" onclick="javascript:location.reload()">취소</button>
		</form>
			<button type="button" id="readAll" style="width:115px">프로필 전체보기</button>	
			
		</div>
		<div id="profileImgs">
		</div>
	</div>    
</div>

<script>
	//바꿀 사진 찾기(경로 찾는곳)
	document.getElementById("pre").onclick = function(){
		document.getElementById("profile").click();
	}
	
	//이미지 미리보기
	document.getElementById("profile").onchange = function(){
		// profile에 변경이 발생하면 이미지를 모습을 바꿔준다
		var reader = new FileReader();
		reader.onload=function(e){ // 파일을 읽어들임
			document.getElementById("pre").src = e.target.result; // 이미지파일 끼워넣기 -> 업로드 저장된것은 아님
		}
		// this.files[0]; => 파일에 대한 정보를 뽑는것 
		reader.readAsDataURL(this.files[0]); //파일을 읽어냄	
	}
	
	// 프로필 이미지 전체보기
	document.getElementById("readAll").onclick = function(){
		var xhr = new XMLHttpRequest();
		var id = document.getElementById("id").value;
		xhr.open("post","/my/readAllProfile",true);
		xhr.send(id);
		xhr.onreadystatechange = function(){
			if(this.readyState==4){
				var obj = JSON.parse(this.responseText);
				var html = "<h3>프로필 전체보기</h3><table>"
				html += "<tr><th><input type=\"checkbox\" id=\"all\" onchange=\"javascript:allcheck()\"></th></tr>";
				for(i in obj){
					html += "<tr>";
					html += "<td><input type=\"checkbox\" class=\"check\" name=\"no\" value=\""+obj[i].NO
						+"\" onchange=\"javascript:checks()\"/></td>";
					html += "<td><img src=\""+obj[i].FILEURL
						+"\" alt=\"이미지로그\" style=\"width: 200px; height: 200px; border-radius: 10%;\"/></td>";
					html += "</tr>";
				}
				html += "</table>";
				document.getElementById("profileImgs").innerHTML = html;
			}
		}
	}
	
	//check All
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
	
	//checks
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