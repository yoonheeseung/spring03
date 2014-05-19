<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스프링 내용보기</title>
</head>
<body>
	<table align="center" border="1">
		<tr>
			<th colspan="2">내용보기</th>
		</tr>
		<tr>
			<th>제목</th>
			<td>${b.title}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${b.cont }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${b.hit}</td>
		</tr>
		<tr>
			<th colspan="2">
			<input type="button" value="수정" onclick="location='board_cont.do?no=${b.no}&state=edit'" /> 
			<input type="button" value="삭제" onclick="location='board_cont.do?no=${b.no}&state=del'" /> 
			<input type="button" value="목록" onclick="location='board_list.do'" />
			</th>
		</tr>
	</table>
</body>
</html>