<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.header {
	height: 40px;
}

.row {
	height: 30px;
}

.title {
	width: 70px;
	float: left;
	font-weight: bold;
}

.input {
	float: left;
}

input[type='submit'] {
	font-weight: bold;
	width: 120px;
	background-color: lightgrey;
}
</style>
</head>
<body>
	<%
	pageContext.include("main.jsp");
	%>

	<div class="container" id='query'>
		<form action="login" method="post" id="form" class="was-validated">
			<div class="mb-3 mt-3">
				<label for="uname" class="form-label">아이디:</label> <input
					type="text" class="form-control" id="uname"
					placeholder="아이디를 입력하세요" name="id" required>
				<div class="valid-feedback">유효합니다.</div>
				<div class="invalid-feedback">아이디를 작성해주세요.</div>
			</div>
			<div class="mb-3">
				<label for="pwd" class="form-label">비밀번호:</label> <input
					type="password" class="form-control" id="pwd"
					placeholder="비밀번호를 입력하세요" name="password" required>
				<div class="valid-feedback">유효합니다.</div>
				<div class="invalid-feedback">비밀번호를 작성해주세요.</div>
			</div>
			<button type="submit" class="btn btn-primary">로그인</button>
		</form>

	</div>
</body>
</html>