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
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/static/css/custom.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>JSP 게시판 사이트</title>
<style type="text/css">
a, a:hover {
	color: #000000;
	text-decoration: none;
}
</style>
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
		<c:if test="${user ne Empty }">
			<a href="${contextPath }/boardwrite"
				class="btn btn-primary pull-right">글쓰기</a>
		</c:if>
		<br /> <br />
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
		<nav aria-label="Page navigation" style="text-align: center;">
			<ul class="pagination pagination-sm" style="display: inline-block;">
				<c:choose>
					<c:when test="${pageInfo.curPage > 1}">
						<li><a
							href="${contextPath}/boardlist?page=${pageInfo.curPage-1}"
							onclick="return callBtn(${pageInfo.curPage-1});"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><span aria-hidden="true">&laquo;</span>
						</li>
					</c:otherwise>
				</c:choose>

				<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}"
					var="i">
					<li class="${pageInfo.curPage == i ? 'active' : ''}"><a
						href="${contextPath}/boardlist?page=${i}"
						onclick="return callBtn(${i});">${i}</a></li>
				</c:forEach>

				<c:choose>
					<c:when test="${pageInfo.curPage < pageInfo.allPage}">
						<li><a
							href="${contextPath}/boardlist?page=${pageInfo.curPage+1}"
							onclick="return callBtn(${pageInfo.curPage+1});"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><span aria-hidden="true">&raquo;</span>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
<div class="container">
    <form class="form-inline" action="boardsearch" method="post" id="searchform" style="text-align: center;">
        <input type="hidden" name="page" id="page" value="1">
        <div class="form-group">
            <select class="form-control" name="type">
                <option value="all">선택</option>
                <option value="subject" ${type eq 'subject'? 'selected':''}>제목</option>
                <option value="writer" ${type eq 'writer'? 'selected':''}>작성자</option>
                <option value="content" ${type eq 'content'? 'selected':''}>내용</option>
            </select>
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="keyword" id="keyword" value="${keyword }">
        </div>
        <button type="submit" class="btn btn-primary">검색</button>
    </form>
</div>

	</div>

</body>
</html>