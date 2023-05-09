<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resource/include/header.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="card text-bg-dark">
		<img src="./resource/img/header.png" class="card-img" alt="./resource/img/header.png" style="width: 100%; height: 200px">
	
	<div class="btn">
		<button type="button" onclick="regBtn()">게시글작성</button>
	<c:choose>
		<c:when test="${sesMemId eq null }">
			<button type="button" onclick="loginBtn()">로그인</button>
		</c:when>
		<c:when test="${not empty sessionScope.sesMemId}">
			<button type="button" onclick="goMemDetail(${seqMember})">나의정보</button>
 			<a href="./logout" style="text-decoration:none; color:black;">로그아웃</a> 
		</c:when>
	</c:choose>
	</div>
	</div>
</body>
</html>