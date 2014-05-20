<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    @Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
	    //form태그에서 method=post방식일때 서버에서 받는 한글을 한깨지게 한다.
		int page=1;
		if(request.getParameter("page") != null){
		page=Integer.parseInt(request.getParameter("page"));
		}
		int board_no=Integer.parseInt(request.getParameter("board_no").trim());
		int board_ref=Integer.parseInt(request.getParameter("board_ref").trim());
		int board_step=Integer.parseInt(request.getParameter("board_step").trim());
		int board_level=Integer.parseInt(request.getParameter("board_level").trim());
		//히든으로 넘어온 번호값을 정수형 숫자로 바꿔서 저장
		String board_name=request.getParameter("board_name").trim();
		String board_title=request.getParameter("board_title").trim();
		String board_pwd=request.getParameter("board_pwd").trim();
		String board_cont=request.getParameter("board_cont").trim();
		System.out.println("BoardReply-board_name:"+board_name);
		System.out.println("BoardReply-board_title:"+board_title);
		System.out.println("BoardReply-board_pwd:"+board_pwd);
		System.out.println("BoardReply-board_cont:"+board_cont);
		
		BoardBean br=new BoardBean();
		
		br.setBoard_no(board_no);
		br.setBoard_ref(board_ref);
		br.setBoard_step(board_step);
		br.setBoard_name(board_name);
		br.setBoard_title(board_title);
		br.setBoard_level(board_level);
		br.setBoard_pwd(board_pwd);
		br.setBoard_cont(board_cont);
		
		Board76DAO bd=new Board76DAO();
		
		bd.replyBoard(br);//답변글 저장
		System.out.println("-------------");
		ActionForward forward=new ActionForward();
		forward.setRedirect(true);
		forward.setPath("board_list.do?page="+page);
		
		return forward;
	}
	
	<form method="post" action="guest_reply_ok.do"
		onsubmit="return write_check();">
		<%--답변달기 폼 히든 값 --%>
		<input type="hidden" name="guest_no" value="${gcont.no}" /> <input
			type="hidden" name="guest_ref" value="${gcont.guest_ref}" />
		<%--글그룹번호 --%>
		<input type="hidden" name="guest_step" value="${gcont.guest_step}" />
		<%--답변글 위치번호 --%>
		<input type="hidden" name="guest_level" value="${gcont.guest_level}" />
		<%--답변글 레벨값 --%>

		<%--페이징 관련 히든 --%>
		<input type="hidden" name="page" value="${page}" />
		<%-- 페이지 번호 값 --%>
		<table id="gRep_t" align="center" border="1">
			<tr>
				<th id="gRep_title" colspan="2">MVC 방명록 답변</th>
			</tr>
			<tr>
				<th>이름</th>
				<td><input name="guest_name" id="guest_name" size="14" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input name="guest_title" id="guest_title" size="36"
					value="Re: ${gcont.guest_title}" /></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="guest_pwd" id="guest_pwd"
					size="14" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="guest_cont" id="guest_cont" rows="10"
						cols="35"></textarea></td>
			</tr>
			<tr>
				<th colspan="2">
				<input type="submit" value="답변" /> 
				<input type="reset" value="취소" onclick="$('#guest_name').focus();" />
				<input type="button" value="뒤로" onclick="history.go(-1)"></th>
			</tr>
		</table>
		
		
		