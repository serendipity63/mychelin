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
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/static/css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="${contextPath}/resources/static/js/bootstrap.js"></script>
<title>JSP 게시판 사이트</title>

<script type="text/javascript">
	$(function() {
		$('#heart')
				.click(
						function() {
							$
									.ajax({
										url : '${contextPath}/like',
										type : 'post',
										data : {
											'num' : '<c:out value= "${board.num}"/>'
										},
										success : function(res) {
											console.log(res);
											if (res === "true") {
												$("#heart")
														.attr("src",
																"${contextPath}/resources/img/like.png")
												$("#likecount")
														.text(
																+$("#likecount")
																		.text() + 1);
											} else {
												$("#heart")
														.attr("src",
																"${contextPath}/resources/img/unlike.png")
												$("#likecount")
														.text(
																+$("#likecount")
																		.text() - 1);
											}
										},
										error : function(err) {
											console.log(err);
										}
									})
						})
	})
</script>
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
			<a class="navbar-brand" href="${contextPath}/main">JSP 게시판 웹사이트</a>
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
	<div class="container" id="./writeForm">
		<div class="row">
			<input type="hidden" name="writer" value="${user.id }" />
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"
							style="background-color: #eeeeee; text-align: center">게시판
							글보기</th>
					</tr>
				</thead>
				<tbody>

					<tr>

						<td style="width: 20%;">글 제목</td>
						<td colspan="2">${board.subject }</td>
					</tr>
					<tr>

						<td>작성자</td>
						<td colspan="2">${board.writer }</td>
					</tr>
					<tr>

						<td>작성일자</td>
						<td colspan="2">${board.writedate }</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;">${board.content }
						</td>
					</tr>
					<tr>
						<td>이미지</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><c:choose>
								<c:when test="${board.fileurl ne null}">
									<img src="${contextPath }/image/${board.fileurl}" width="100px"
										height="100px" />
								</c:when>
								<c:otherwise>
									<img src="${contextPath }/resources/img/basic.png" />
								</c:otherwise>
							</c:choose></td>

					</tr>
				</tbody>
			</table>
			<c:if test="${user.id eq board.writer }">
				<a href="${contextPath }/boardmodify/${board.num}/${page}"
					class="btn btn-primary">수정</a>
			</c:if>
			<a href="${contextPath }/boardlist?page=${page}"
				class="btn btn-primary">목록</a> 좋아요(<span id="likecount">${board.likecount }</span>)&nbsp;&nbsp;
			<c:if test="${user ne Empty }">
				<c:choose>
					<c:when test="${select==true }">
 						<img id="heart" src="${contextPath }/resources/img/like.png"
							width="20px" height="20px" /> 
							
							
					</c:when>
					<c:otherwise>
						<img id="heart" src="${contextPath }/resources/img/unlike.png"
							width="20px" height="20px" />
					</c:otherwise>
				</c:choose>
			</c:if>

		</div>

	</div>

</body>
</html>