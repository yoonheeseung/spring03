<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>스프링 방명록 연습</title>
<script src="./js/jquery.js"></script>
<script src="./js/g.js"></script>
</head>
<body>
	<form method="post" action="guest_write_ok.do"
		onsubmit="return check();">
		<table align="center" border="1">
			<tr>
				<th colspan="2">방명록 연습</th>
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
				<td><input type="password" name="pass" id="pass" size="14" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="cont" id="cont" rows="9" cols="36"></textarea></td>
			</tr>
			<tr>
				<th colspan="2">
				<input type="submit" value="저장" />
				<input type="reset" value="취소" onclick="$('#name').focus();" />
				<input type="button" value="목록" onclick="location='guest_list.do?page=${page}'"/></th>
			</tr>
		</table>

<%--
   1.글쓰기로 이동했을때 guest_write.jsp에서 취소옆에 input type=
   "button" 목록으로 이동되게 만드세요!
   2.GuestAction.java에서 getParameter()메서드로 get방식으로
   넘어온 쪽번호를 int page변수에 저장한 다음. page에 키값에 
   저장해서 다시 원래 쪽번호 목록페이지로 이동하게 만드세요!
  --%>
	</form>
</body>
</html>