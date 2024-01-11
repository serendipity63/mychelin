<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 메인</title>
<link href="${contextPath}/resources/static/css/main.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

</head>
<body>

	<!-- 	<a href="main" style="text-decoration: none; color: inherit;">
		<div class="p-4 bg-info text-white text-center">
			<h1 class="bold-heading">마이슐랭</h1>
		</div>
	</a> -->
	<nav class="navbar navbar-expand-sm bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="main">마이슐랭</a>

			<div class="collapse navbar-collapse justify-content-between">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						href="boardlist">게시판</a></li>
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item"><c:choose>
							<c:when test="${user eq Empty}">
								<a class="nav-link active" href="login">로그인</a>
							</c:when>
							<c:otherwise>

								<a class="nav-link active" href="logout">
								<%-- ${user.nickname }님 --%>
									로그아웃</a>
							</c:otherwise>
						</c:choose></li>
					<li class="nav-item"><a class="nav-link active" href="join">회원가입</a></li>

				</ul>
			</div>



		</div>
	</nav>

</body>
</html>