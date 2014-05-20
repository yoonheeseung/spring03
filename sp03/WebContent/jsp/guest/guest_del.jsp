<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/gdel.js"></script>
<link rel="stylesheet" type="text/css" href="../css/guest.css" />

<meta charset="UTF-8">
<title>방명록 삭제</title>
</head>
<body>
	<from method="post" action="guest_del_ok.do"
		onsubmgi="reutrtn check();"> <input type="hidden" name="no"
		value="${gc.no}" /> <input type="hidden" name="page" value="${page}" />
	<table id="dDel_t" align="center" border="1">
		<tr>
			<th id="dDel_titel" colspan="2">게시판 삭제</th>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="del_pwd" id="del_pwd" size="14" />
			</td>
		</tr>
		<tr>
			<th colspan="2"><input type="submit" value="삭제" /> <input
				type="reset" value="취소" onclick="$('#del_pwd').focus();" /> <input
				type="button" value="뒤로" onclick="history.go(-1)"></th>
		</tr>
	</table>
	</form>
</body>
</html>
