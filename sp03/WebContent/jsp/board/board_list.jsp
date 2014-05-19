<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스프링 목록연습</title>
</head>
<body>
	<table align="center" border="1">
	<tr>
		<th colspan="5">스프링 목록연습</th>
	</tr>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>이름</th>
		<th>조회수</th>
		<th>날짜</th>
	</tr>
	<c:if test="${!empty list}">
		<c:forEach var="b" items="${list}">
			<tr>
				<th>${b.no}</th>
				<th><a href="board_cont.do?no=${b.no}&state=cont">${b.title}</a></th>
				<th>${b.name }</th>
				<th>${b.hit }</th>
				<th>${b.regdate}</th>
			</tr>
		</c:forEach>
	</c:if> 
	<c:if test="${empty list}">
		<tr>
			<th colspan="5">목록이 없습니다!</th>
		</tr>
	</c:if>
	<tr>
		<th colspan=5">
		<input type="button" value="입력" onclick="location='board_write.do'" />
		</th>
	</tr>
	</table>
</body>
</html>