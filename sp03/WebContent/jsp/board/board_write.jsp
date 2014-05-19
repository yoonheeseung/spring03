<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스프링 게시판 연습</title>
<script src="./js/jquery.js"></script>
<script src="./js/b.js"></script>
</head>
<body>
	<form method="post" action="board_write_ok.do"
		onsubmit="return write_check();">
		<table align="center" border="1">
			<tr>
				<th colspan="2">스프링 게시판 연습</th>
			</tr>
			<tr>
				<th>이름</th>
				<td><input name="name" id="name" size="14" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input name="title" id="title" size="36" /></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pass" id="pass" size="14" />
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="cont" id="cont" rows="9" cols="36"></textarea>
				</td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="저장" /> <input
					type="reset" value="취소" onclick="$('#name').focus();" /></th>
			</tr>
		</table>
	</form>
</body>
</html>