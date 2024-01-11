<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring 게시판</title>
<link href="${contextPath}/resources/css/boardlist.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>

	function callBtn(num){
		var type=$("#type").val();
		var keyword=$("#keyword").val();
		if(type!='all' && keyword!=null && keyword.trim()!='' ){
			$('#page').val(num);
			$('#searchform').submit();
			return false;
		}
	}
	
</script>
</head>
<body>
	<%
	pageContext.include("main.jsp");
	%>



	<form action="boardsearch" method="post" id="searchform">
		<input type="hidden" name="page" id="page" value="1">
			<select name="type">
				<option value="all">선택</option>
				<option value="subject" ${type eq 'subject'? 'selected':''}>제목</option>
				<option value="writer" ${type eq 'writer'? 'selected':''}>작성자</option>
				<option value="content" ${type eq 'content'? 'selected':''}>내용</option>
			</select> <input type="text" name="keyword" id="keyword" value="${keyword }" />
			<input type="submit" value="검색" />
	</form>
	<table>
		<thead>
			<tr id="tr_top">
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
				<th>삭제</th>
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

	<div id="emptyArea">
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
		&nbsp;&nbsp;
	</div>
		<c:if test="${user ne Empty }">
		<!--로그인 안하면 글쓰기 안보이게  ne= not equal -->
		<a href="${contextPath }/boardwrite">글쓰기</a>
	</c:if>

</body>
</html>