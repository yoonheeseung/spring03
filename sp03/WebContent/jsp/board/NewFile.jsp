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
                ${list.ref}
              </c:if>
              &nbsp;
            </td>
            
            <td class="left_box" align="left">
              <c:if test="${list.step !=0 }">
                <c:forEach begin="1" end="${list.step}" step="1">
                  &nbsp;
                </c:forEach>
                <img src="./images/AnswerLine.gif"/>
              </c:if>
              <a href="#" onfocus="this.blur();">${list.title}</a>              
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
					<${a}>
				</c:if>
				
                <c:if test = "${a != page}">
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
 
  </div>
</body>
</html>