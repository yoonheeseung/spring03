<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="./css/guest.css" />
<meta charset="UTF-8">
<title>답변</title>
</head>
<body>
	<form method="post" action="guest_reply_ok.do" onsubmit="return check();">
		<input type="hidden" name="no" value="${gc.no}" />
		<input type="hidden" name="ref" value="${gc.ref}" /> <%--원본글과 답변글을 묶어주는 글 그룹번호 --%>
		<input type="hidden" name="step" value="${gc.step}" /> <%--답변글 위치번호 값 --%>
		<input type="hidden" name="level2" value="${gc.level2}" /> <%--답변글 level값 --%>
		<input type="hidden" name="page" value="${page}" /> <%--페이징 일때 쪽번호를 히든으로 넘김 --%>

		<table id="gRep_t" align="center" border="1">
			<tr>
				<th id="gRep_title" colspan="2">답변</th>
			</tr>
			<tr>
				<th>이름</th>
				<td><input name="name" id="guest_name" size="14" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input name="title" id="guest_title" size="36"
					value="Re: ${gc.title}" /></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pass" id="guest_pwd"
					size="14" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="cont" id="guest_cont" cols="10"
						rows="35"></textarea></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="답변" /> <input
					type="reset" value="취소" onclick="$('#guest_name').focus();" /> <input
					type="button" value="뒤로" onclick="history.go(-1)"></th>
			</tr>
		</table>
</body>
</html>