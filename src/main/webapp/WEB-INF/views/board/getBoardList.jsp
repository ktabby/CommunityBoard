<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="./resource/js/jquery-3.3.1.min.js"></script>
<script src="./resource/js/board.js"></script>

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="./resource/css/style.css">
<title>글 목록</title>
</head>
<body>
<!-- 헤더 -->
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!-- 본문 -->
<form id="searchFrm" method="post" class="searchBox">
	<select id="searchCondition" name="searchCondition">
		<option value="" <c:if test="${search.searchCondition == null || search.searchCondition eq '' }">selected</c:if>>검색조건</option>
		<option value="id" <c:if test="${search.searchCondition eq 'id' }">selected</c:if>>ID</option>
		<option value="title" <c:if test="${ search.searchCondition eq 'title' }">selected</c:if>>제목</option>
	</select>
	<input type="text" id="boardSearchWord" name="boardSearchWord" value="${search.boardSearchWord}"/>
	<button type="button" id="searchBtn">검색</button>
</form>	
<div class="btn">
<button type="button" onclick="regBtn()">게시글작성</button>

</div>
<table class="list">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일자</th>
			<th>수정일자</th>
		<tr>
	</thead>
	<tbody>
	
		<c:forEach items="${list}" var="board">
			 <tr ondblclick="goDetail(${board.seqBoard})">
				<td onclick="" style="width:50px; text-align:center;">${board.seqBoard}</td>
				<td style="width:100px;">${board.title}</td>
				<td style="width:100px;">${board.id}</td>
				<td style="width:110px; text-align:center;">${board.regDate}</td>
				<td style="width:110px; text-align:center;">${board.modDate}</td>
			</tr> 
		</c:forEach>
	</tbody>
</table>

<!-- 페이징 -->
<div class="paging">
		<ul>
			<c:if test="${paging.prev}">
		    	<span>
		    		<a href='<c:url value="/getBoardList?page=${paging.startPage - 1}"/>'></a>
		    	</span>
		    </c:if>
		    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
				<c:choose>
					<c:when test="${paging.cri.page eq num}">
						<span><a>${num}</a></span>
					</c:when>
					<c:otherwise>
						<span><a href='<c:url value="/getBoardList?page=${num}"/>'>${num}</a></span>
					</c:otherwise>
				</c:choose>
		    </c:forEach>
		    <c:if test="${paging.next && paging.endPage > 0}">
		    	<span>
		    		<a href='<c:url value="/getBoardList?page=${paging.endPage + 1}"/>'></a>
		    	</span>
		    </c:if>
		</ul>
</div>
<!-- 푸터 -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>