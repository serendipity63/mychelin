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
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
<script>
	window.onload = function(){
		const fileDom= document.querySelector('#file');
		const imageBox= document.querySelector('#image-box');
		
		fileDom.addEventListener('change',()=> {
			const imageSrc= URL.createObjectURL(fileDom.files[0]);
			imageBox.src= imageSrc;
		})
	}
</script>


<script>
    // JavaScript 함수로 댓글 삭제 및 화면 업데이트 기능 구현
    function deleteReply(renum) {
        // Ajax를 사용하여 서버에 댓글 삭제 요청
        $.ajax({
            url: '${contextPath}/reply/delete/' + renum,
            type: 'GET',
            success: function (data) {
                // 서버에서 성공적으로 응답받은 경우에만 해당 댓글을 화면에서 제거
                if (data === 'success') {
                	  $('#reply_' + renum).remove();
                	  } else {
                    console.error('댓글 삭제 실패');
                }
            },
            error: function (error) {
                console.error('댓글 삭제 실패:', error);
            }
        });
    }
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
			<a class="navbar-brand" href="${contextPath}/main">마 이 슐 랭</a>
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
								<li><a href="${contextPath }/login">로그인</a></li>
								<li><a href="${contextPath }/join">회원가입</a></li>
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
						<td colspan="2" style="text-align: left;">${board.subject }</td>
					</tr>
					<tr>

						<td>작성자</td>
						<td colspan="2" style="text-align: left;">${board.writer }</td>
					</tr>
					<tr>

						<td>작성일자</td>
						<td colspan="2" style="text-align: left;">${board.writedate }</td>
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
	<hr />


	<div class="container">
		<table class="table"
			style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<c:forEach var="reply" items="${replyList}">
					<tbody id="reply_${reply.renum}">
						<tr>
							<td colspan="2" style="text-align: left;"><strong>${reply.writer}</strong>
								- ${reply.writedate} <!-- 수정과 삭제 버튼 추가 --> <c:if
									test="${user ne null and user.id eq reply.writer}">
									<a href="${contextPath}/reply/edit/${reply.renum}">수정</a>
									<a href="javascript:void(0);"
										onclick="deleteReply(${reply.renum});">삭제</a>
								</c:if></td>
						</tr>
						<tr>
							<!-- 댓글 내용 -->
							<td colspan="2" style="min-height: 200px; text-align: left;">
								${reply.content}</td>
						</tr>
						<tr>
							<!-- 이미지 표시 -->
							<td colspan="2" style="min-height: 200px; text-align: left;">
								<c:choose>
									<c:when test="${reply.fileurl ne null}">
										<img src="${contextPath}/image/${reply.fileurl}" width="100px"
											height="100px" />
									</c:when>
								</c:choose>
							</td>
						</tr>
					</tbody>
				</c:forEach>
			</thead>
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
	</div>


	<div class="container">
		<div class="form-group">
			<form method="post" enctype="multipart/form-data"
				action="${contextPath }/reply" name="replyform">
				<input type="hidden" name="writer" value="${user.id }" /> <input
					type="hidden" name="num" value="${board.num}" /> <input
					type="hidden" name="page" value="${page}" />

				<!-- 추가 -->
				<%-- 						<c:if test="${user ne Empty }">
 --%>
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<tr>
						<%-- 
						<td style="border-bottom: none;"><br />${user.id}</td> --%>
						<td><input type="text" style="height: 4.5rem;"
							class="form-control" name="content"
							placeholder="상대방을 존중하는 댓글을 남깁시다." name="commentText"></td>
						<td><input type="submit" class="btn btn-primary pull"
							value="댓글 작성"></td>
					</tr>
					<tr>
						<td colspan="3"><input name="file" type="file" id="file"
							accept="image/*" /></td>
					</tr>
				</table>
				<%-- 	</c:if> --%>
			</form>
		</div>
	</div>

</body>
</html>