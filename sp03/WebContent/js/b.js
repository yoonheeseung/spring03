/**
 * b.js
 */

function write_check() {
	if ($.trim($("#name").val()) == "") {
		alert("이름을 입력하세요!");
		$("#name").val("").focus();
		return false;
	}
	if ($.trim($("#title").val()) == "") {
		alert("제목을 입력하세요!");
		$("#title").val("").focus();
		return false;
	}
	if ($.trim($("#pass").val()) == "") {
		alert("비번을 입력하세요!");
		$("#pass").val("").focus();
		return false;
	}
	if ($.trim($("#cont").val()) == "") {
		alert("내용을 입력하세요!");
		$("#cont").val("").focus();
		return false;
	}
}
