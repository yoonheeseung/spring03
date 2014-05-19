<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>스프링 삭제연습</title>
<script src="./js/jquery.js"></script>
<script>
	function check() {
		if ($.trim($("#del_pwd").val()) == "") {
			alert("삭제 비버을 입력하세요!");
			$("#del_pwd").val("").focus();
			return false;
		}
	}
</script>
</head>
<body>
	<form method="post" action="board_del_ok.do" ousubmit="return check();">
	<input type="hidden" name="no" value="${b.no}" >
		<table align="center" border="1">
			<tr>
				<th colspan="2">삭제연습</th>
			</tr>
			<tr>
				<th>삭제비번</th>
				<td>
				<input type="password" name="del_pwd" id="del_pwd" size="14" />
				</td>
			</tr>
			<tr>
				<th colspan="2">
				<input type="submit" value="삭제" /> 
				<input type="reset" value="취소" onclick="$('#del_pwd').focus();" />
				</th>
			</tr>
		</table>
	</form>
</body>
</html>

<%--
 2차 과제물
 1.no 히든값 과 del_pwd의 비번값은 스프링 컨트롤에서 @requestParam으로 받으세요!
 2.디비 비번값을 가져와 입력비번과 비교해서 같으면 delBoard(no); 메서드로 삭제되게 하세요!
 3.삭제성공시 리턴 정수형 1을 받아서 if문 다음에 삭제 성공했습니다. 
   경고문자열을 출력하고 board_list.do로 이동하게 하세요.
   실패시 삭제 실패했습니다. 
   경고문 띄우세요
--%>
 
 
 