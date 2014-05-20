<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/gdel.js"></script>
<link rel="stylesheet" type="text/css" href="./css/guest.css" />
<meta charset="UTF-8">
<title>수정</title>
</head>
<body>
<div id="bEdit_wrap">
		<h2 class="bEdit_title">MVC 방명록 수정</h2>
		<form method="post" action="guest_edit_ok.do" onsubmit="return check();">
		<input type="hidden" name="guest_no" value="${gc.no}" />
		<input type="hidden" name="page" value="${page}" />
		<%--히든은 웹상에 만들어 지지 않는다. 글번호를 넘길 수 있다. --%>
			<table id="bEdit_t">
			<tr>
			<th>이름</th>
			<td>
			<input name="guest_name" id="geust_name" size="14" value="${gc.name}" /></td>
			</tr>
			<tr>
			<th>제목</th>
			<td>
			<input name="guest_title" id="guest_title" size="14" value="${gc.title}" /></td>
			</tr>
			<tr>
			<th>비밀번호</th>
			<td>
			<input type="password" name="guest_pwd" id="geust_pwd" size="14"/></td>
			</tr>
			<tr>
			<th>글내용</th>
			<td>
			<textarea name="guest_cont" id="guest_econt" cols="9" rows="36" >${gc.cont}</textarea></td>
			</tr>
			</table>
	
			<div id="bEdit_menu">
				<input type="submit" value="수정" /> 
				<input type="reset" value="취소" onclick="$('#guest_pwd').focus();" />
				<input type="button" value="뒤로" onclick="history.go(-1)">
			</div>
		</form>
</div>
</body>
</html>