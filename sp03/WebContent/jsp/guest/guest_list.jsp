<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록 목록</title>
<link rel="stylesheet" type="text/css" href="./css/board.css" />
</head>
<body>
  <div id="list_wrap">   
    <h2 class="list_title">방명록 목록</h2>
    <div id="list_count">글개수:${listcount}</div>
    <table id="list_t">
      <tr class="table_title">
        <th width="6%" height="26" >번호</th> 
        <th width="50%" >제목</th> 
        <th width="14%" >작성자</th> 
        <th width="17%" >작성일</th> 
        <th width="14%" >조회수</th>
      </tr>
      
      <c:if test="${!empty blist}">
        <c:forEach var="list" items="${blist}">
          <tr>
            <td align="center">
              <c:if test="${list.step == 0}">
              <%--step이 0이면 원본글일때 실행 ,
              관리자 답변글일때는 실행이 안됨.--%>
                ${list.ref}
                <%--원본글일때만 글그룹번호를 출력.
                글그룹번호 ref는 원본글과 답변글을 묶어주
                는 기능을 한다. --%>
              </c:if>
              &nbsp;
            </td>
            
            <td class="left_box" align="left">
              <c:if test="${list.step !=0 }">
              <%--답변글 위치번호값이 0이 아닐때는
              답변글일때 실행. --%>
                <c:forEach begin="1" end="${list.step}" step="1">
                <%--1부터 시작해서 1씩증가하는 반복문 --%>
                  &nbsp;
                </c:forEach>
                <img src="./images/AnswerLine.gif"/>
              </c:if>
 <a href="guest_cont.do?no=${list.no}&page=${page}&state=cont" 
              onfocus="this.blur();">${list.title}</a>        
 <%-- *.do?no=번호값&page=쪽번호&state=cont get방식으로 3개의
 피라미터값을 웹주소창에 노출해서 넘김. 
 get방식으로 넘기때 주의할점.
  1.한글자료를 넘기면 안된다.
  2.중복되지 않는 자료를 넘김.
  onfocus="this.blur();" 는 하이퍼링크 된곳 클릭시 사각점선이 
  생긴다. 이 사각점선을 사라지게 하는 부분.
 --%>
            </td>
            
            <td align="center">${list.name}</td>
	  		<td align="center">${list.regdate}</td>	
	  		<td align="center">${list.hit}</td>
          </tr>
        </c:forEach>
      </c:if>
      
      <c:if test="${empty blist}">
        <tr>
          <th colspan="5">목록이 없습니다!!</th>
        </tr>
      </c:if>
    </table>
    
    <!-- 페이징 추가 -->
	<div id="list_paging">	      
	      <!-- 일반 페이징 -->
	      	<c:if test = "${page <= 1 }">
			[이전]&nbsp;
			</c:if>
			<c:if test = "${page > 1 }">
			<a href="guest_list.do?page=${page-1}">[이전]</a>&nbsp;
			</c:if>	
			
			
			<c:forEach  var="a" begin = "${startpage}" end = "${endpage}" step = "1">
			 	<c:if test = "${a == page}">
			 	<%--해당 쪽번호가 선택된 경우 실행 --%>
					<${a}>
				</c:if>
				
                <c:if test = "${a != page}">
                <%--해당 쪽번호가 선택 안된 경우 실행 --%>
				 <a href="guest_list.do?page=${a}">[${a}]</a>&nbsp;
				</c:if>
			</c:forEach>	
			
			
			<c:if test = "${page >= maxpage}">
			 [다음]
			</c:if>
			<c:if test = "${page < maxpage }">
			 <a href="guest_list.do?page=${page+1}">[다음]</a>
			</c:if>
	    
	</div>
	
	<div id="list_menu">
	   	<input type="button" value="글쓰기" class="input_b"
		onclick="location='guest_write.do?page=${page}'" />		
   </div>    
 <%--
   1.글쓰기로 이동했을때 guest_write.jsp에서 취소옆에 input type=
   "button" 목록으로 이동되게 만드세요!
   2.GuestAction.java에서 getParameter()메서드로 get방식으로
   넘어온 쪽번호를 int page변수에 저장한 다음. page에 키값에 
   저장해서 다시 원래 쪽번호 목록페이지로 이동하게 만드세요!
  --%>
  </div>
</body>
</html>