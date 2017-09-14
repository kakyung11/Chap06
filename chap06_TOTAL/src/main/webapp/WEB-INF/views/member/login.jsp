<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<br>
<div align="center">
	<form action="/member/session" method="post">
		<fieldset>
			<p>
				<b>ID/Email</b><br> <input type="text" id="id" name="id" />
			</p>
			<p>
				<b>PW</b><br> <input type="password" id="pw" name="pw" />
			</p>
			<p>
				<b>로그인 유지</b> <input type="checkbox" id="keepIn" name="keep"
					value="keep" onchange="javascript:keeps()">
			</p>
			<button type="submit" style="width: 169;">LogIn</button>
		</fieldset>
	</form>
</div>
<script>
	function keeps() {
		var k = document.getElementById("keepIn")
		var check=false;
		if (k.checked == true) {
			if (window.confirm("로그인 유지 하시겠습니까?")) {
				document.getElementById("keepIn").checked = true;
				check=true;
			}
		}
	}
</script>