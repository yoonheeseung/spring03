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
	<form method="post" action="guest_reply_ok.do"
		onsubmit="return check();">
		<input type="hidden" name="no" value="${gc.no}" /> <input
			type="hidden" name="ref" value="${gc.ref}" /> <input type="hidden"
			name="step" value="${gc.step}" /> <input type="hidden" name="level2"
			value="${gc.level2}" /> <input type="hidden" name="page"
			value="${page}" />

		<table id="gRep_t" align="center" border="1">
			<tr>
				<th id="gRep_title" colspan="2">답변</th>
			</tr>
			<tr>
				<th>이름</th>
				<td><input name="guest_name" id="guest_name" size="14" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input name="guest_title" id="guest_title" size="36"
					value="Re: ${gc.title}" /></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="guest_pwd" id="guest_pwd"
					size="14" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="guest_cont" id="guest_cont" cols="10"
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