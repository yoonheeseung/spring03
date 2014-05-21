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
			<td>${gc.title}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${cont }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${gc.hit}</td>
		</tr>
		<tr>
			<th colspan="2">
			<input type="button" value="답변" onclick="location='guest_cont.do?no=${gc.no}&state=reply&page=${page}'" />
			<input type="button" value="수정" onclick="location='guest_cont.do?no=${gc.no}&state=edit&page=${page}'" /> 
			<input type="button" value="삭제" onclick="location='guest_cont.do?no=${gc.no}&state=del&page=${page}'" /> 
			<input type="button" value="목록" onclick="location='guest_list.do?page=${page}'" />
			</th>
		</tr>
	</table>
</body>
</html>