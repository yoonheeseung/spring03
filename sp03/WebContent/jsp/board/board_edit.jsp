<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스프링 수정 연습</title>
<script type="text/javascript" src="./js/jquery.js"></script>
<script type="text/javascript" src="./js/b.js"></script>
</head>
<body>
	<form method="post" action="board_edit_ok.do" onsubmit="return write_check();">
		<input type="hidden" name="no" value="${b.no}" />
		<table align="center" border="1">
			<tr>
				<th colspan="2">스프링 수정 연습</th>
			</tr>
			<tr>
				<th>이름</th>
				<td><input name="name" id="name" size="14" value="${b.name}" />
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input name="title" id="title" size="36" value="${b.title}" />
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="pass" name="pass" size="14" />
				</td>
			</tr>
			<tr>
				<th>글내용</th>
				<td>
				<textarea name="cont" id="cont" rows="8" cols="32">${b.cont}</textarea>
				</td>
			</tr>
			<tr>
				<th colspan="2">
				<input type="submit" value="수정" /> 
				<input type="reset" value="취소" /></th>
			</tr>
		</table>
</body>
</html>

<%-- 
   5교시 과제물
   1.board_eidt_ok.do 컨트롤 작성하세요.
     번호를 기준으로 디비에 저장된 비번을 검색해서 비번이 같은 경우 수정되게 하시요.
   2.번호를 기준으로 이름,제목,내용만 수정하세요. 비번을 수정하시는 것이 아닙니다.
   3.수정메서드는 updateBoard(no);로 작성하시고, 수정 성공 후
      board_cont.do?no=번호값&state=cont를 get방식으로 넘겨서
      내용보기에서 수정완료된 값을 확인하세요...
   4.@ModelAttribute 어노테이션을 사용해서 컨트롤 을 작성하세요.
 --%>