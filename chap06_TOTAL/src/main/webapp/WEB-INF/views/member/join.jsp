<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div align="center">
	<h2> 회원 가입 </h2>
	<form action="/member/join" method="post">
		<p>
			<label>ID</label><br>
			<input type="text" id="id" name="id" required/><br>
			<span id="checkId"></span>
		</p>
		<p>
			<label>PASS</label><br>
			<input type="password" id="pass" name="pass" required/><br>
			<input type="password" id="pass2" name="pass2" required/><br>
			<span id="checkPass"></span>
		</p>
		<p>
			<label>NAME</label><br>
			<input type="text" id="name" name="name" required/>
		</p> 
		<p>
			<label>EMAIL</label><br>
			<input type="email" id="email" name="email" required/><br>
			<span id="checkEmail"></span>			
		</p>
		<button id="sbt" type="submit" disabled style="width:169;">가입하기</button>
	</form>	
</div>

<script>
	document.getElementById("id").onblur = function(){
		if(this.value.length != 0){
			var xhr = new XMLHttpRequest();
			var ids = document.getElementById("id").value;
			console.log(ids);
			xhr.open("post","/member/signup_check/id",true);
			xhr.send(ids);
			
			xhr.onreadystatechange = function(){
				if(this.readyState == 4){
					if(this.responseText.trim() == "false"){
						document.getElementById("checkId").innerHTML = "<b style=\"color:green\">사용 가능 ID</b>"
					}else{
						document.getElementById("checkId").innerHTML = "<b style=\"color:red\">사용중인 ID</b>"
					}
				}				
			}			
		}		
	}
	

	document.getElementById("email").onblur = function(){
		if(this.value.length != 0){
			var email = document.getElementById("email").value;
			var xhr = new XMLHttpRequest();
			console.log(email);
			xhr.open("post","/member/signup_check/email",true); // .open(요청방식,타겟지역,비동기설정유무)
			xhr.send(email); // 실제 요청보냄
			xhr.onreadystatechange = function(){
				if(this.readyState==4){
					//console.log(this.responseText.trim());
					if(this.responseText.trim()== "false"){
						document.getElementById("checkEmail").innerHTML= "<b style=\"color:blue\">사용 가능한 email</b>";
						document.getElementById("sbt").disabled=false;
					}else{
						document.getElementById("checkEmail").innerHTML= "<b style=\"color:red\">이미 사용중인 email</b>";
					}
				}
			}
		}
	} 

	document.getElementById("pass2").onblur = function(){
		var pass = document.getElementById("pass").value;
		var pass2 = document.getElementById("pass2").value;
		console.log(pass);
		console.log(pass2);
		if(this.value == pass){
			document.getElementById("checkPass").innerHTML = "<b style=\"color:blue\">일치</b>"
		}else{
			document.getElementById("checkPass").innerHTML = "<b style=\"color:red\">불일치</b>"
		}
	}
</script>




