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
	href="${contextPath}/resources/static/css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="${contextPath}/resources/static/js/bootstrap.js"></script>
<title>JSP 게시판 사이트</title>
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
			<a class="navbar-brand" href="main">JSP 게시판 웹사이트</a>
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
			<form action="${contextPath }/boardmodify" method="post"
				enctype="multipart/form-data">
				<input
					type="hidden" name="num" value="${board.num }" /> <input
					type="hidden" name="fileurl" value="${board.fileurl }" /> <input
					type="hidden" name="page" value="${page }" />
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center">게시판
								수정하기</th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="subject" maxlength="50"
								required="required" value="${board.subject}" /></td>
						</tr>
						<tr>
								<td><textarea class="form-control" placeholder="글 내용"
								id="content"
										name="content"
										style="height: 350px;" required="required">  ${board.content}
										</textarea></td>
						</tr>
						<tr>
							<td>
							
							 <c:choose> 
	               	<c:when test="${board.fileurl eq Empty }">
    		           <img src="${contextPath }/resources/img/basic.png" width="100px" height="100px" id="image-box" /><br/>
				</c:when>
				<c:otherwise>
            		   <img src="${contextPath }/image/${board.fileurl }" width="100px" height="100px" id="image-box" /><br/>
				</c:otherwise>               	
               </c:choose>
               <br/>
               <input name="file" type="file" id="file" accept="image/*"/>
               
								
								</td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="수정">
				<a href="${contextPath }/boardlist"
					class="btn btn-primary">목록</a>
			</form>

		</div>

	</div>

</body>
</html>