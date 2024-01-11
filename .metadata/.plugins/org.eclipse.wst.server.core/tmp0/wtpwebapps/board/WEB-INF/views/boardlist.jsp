<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/static/css/custom.css">
<link rel="stylesheet" type="text/css"
	href="resources/static/css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/static/js/bootstrap.js"></script>
<title>JSP 게시판 사이트</title>
<style type="text/css">
a, a:hover {
color:#000000;
text-decoration:none;
}</style>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main">마 이 슐 랭</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="${contextPath}/main">메인</a></li>
<li class="active"><a href="${contextPath}/boardlist">게시판</a></li>
			</ul>
			<c:choose>

				<c:when test="${user eq Empty}">


					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">접속하기 <span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a href="login">로그인</a></li>
								<li><a href="join">회원가입</a></li>
							</ul></li>
					</ul>

				</c:when>
				<c:otherwise>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">회원관리 <span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a href="logout">로그아웃</a></li>
							</ul></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
	</nav>
	<div class="container">
		<table class="table table-striped"
			style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">번호</th>
					<th style="background-color: #eeeeee; text-align: center;">제목</th>
					<th style="background-color: #eeeeee; text-align: center;">작성자</th>
					<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					<th style="background-color: #eeeeee; text-align: center;">조회수</th>
					<th style="background-color: #eeeeee; text-align: center;">삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${boardList}" var="board">
					<tr id="tr_bottom">
						<td>${board.num}</td>
						<td><a
							href="${contextPath}/boarddetail/${board.num}/${pageInfo.curPage}">${board.subject}</a></td>
						<td>${board.writer}</td>
						<td>${board.writedate}</td>
						<td>${board.viewcount}</td>
						<td><c:if test="${user.id == board.writer}">
								<a
									href="${contextPath}/boarddelete/${board.num}/${pageInfo.curPage}">삭제</a>
							</c:if></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:choose>
			<c:when test="${pageInfo.curPage>1 }">
				<a href="${contextPath }/boardlist?page=${pageInfo.curPage-1 }"
					onclick="return callBtn(${pageInfo.curPage-1 });">&lt;</a>
			</c:when>
			<c:otherwise>
	 		&lt;
	 	</c:otherwise>
		</c:choose>

		<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }"
			var="i">
			<c:choose>
				<c:when test="${pageInfo.curPage==i }">
					<a href="${contextPath }/boardlist?page=${i}" class="select"
						onclick="return callBtn(${i});">${i}</a>
				</c:when>
				<c:otherwise>
					<a href="${contextPath }/boardlist?page=${i}" class="btn"
						onclick="return callBtn(${i});">${i}</a>
				</c:otherwise>
			</c:choose>

		</c:forEach>

		<c:choose>
			<c:when test="${pageInfo.curPage<pageInfo.allPage}">
				<a href="${contextPath }/boardlist?page=${pageInfo.curPage+1 }"
					onclick="return callBtn(${pageInfo.curPage+1});">&gt;</a>
			</c:when>
			<c:otherwise>
				&gt;
			</c:otherwise>
		</c:choose>
		
		<c:if test="${user ne Empty }">
			<!--로그인 안하면 글쓰기 안보이게  ne= not equal -->
			<a href="${contextPath }/boardwrite"
				class="btn btn-primary pull-right">글쓰기</a>
		</c:if>

	</div>

</body>
</html>