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
			<input type="hidden" name="id" value="${auth }"/>
			<button type="submit" class="bt">적용</button>
			<button type="button" class="bt" onclick="javascript:location.reload()">취소</button>
		</form>	 
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
			//console.log(e.target.result);
			document.getElementById("pre").src = e.target.result; // 이미지파일 끼워넣기 -> 업로드 저장된것은 아님
		}
		// this.files[0]; => 파일에 대한 정보를 뽑는것 
		reader.readAsDataURL(this.files[0]); //파일을 읽어냄
		
	}
</script>