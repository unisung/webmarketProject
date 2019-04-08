<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
		 String sessionId =(String)session.getAttribute("sessionId");
        //페이지 네비게이션 에서 검색후 이동시 오류 해결 추가
         String items=(String)request.getAttribute("items");
         String text=(String)request.getAttribute("text");
/*          String sPageNum=(String)request.getAttribute("pageNum");
         sPageNum=sPageNum==null?"1":sPageNum;
         int pageNum=Integer.parseInt(sPageNum); */
%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<script>
function checkForm(){
	if(${sessionId==null}){
		alert("로그인 해주세요");
		return false;
	}
	/* 게시글 작성 후 다시 있던 페이지로 이동 하기 위해 pageNum, items,text를 모두 넘김 */
	location.href="./BoardWriteForm.do?id=<%=sessionId%>&pageNum=${pageNum}&items=<%=items%>&text=<%=text%>"
}
</script>
<title>상품목록</title>
</head>
<body>
<jsp:include page="../menu.jsp"/>
  <div class="jumbotron">
  	<div class="container">
  			<h1 class="display-3">게시판</h1>
  	</div>
  </div>
    <div class="container">
       <form action=<c:url value="./BoardList.do"/> method="post">

       <div>
       		<div class="text-right">
       		 <span class="badge badge-success">전체:${total_record}건</span>
       		</div>		
       </div>
       <div style="padding-top:50px">
         <table class="table table-hover">
               <tr>
                 <th>번호</th>
                 <th>제목</th>
                 <th>작성일</th>
                 <th>조회</th>
                 <th>글쓴이</th>
               </tr>
               <c:forEach var="board" items="${boardlist}">
               <tr>
                   <td>${board.num}</td>
                   <td>
                   <a href="./BoardViewAction.do?num=${board.num}&pageNum=${pageNum}&items=${items}&text=${text}">
                       ${board.subject}
                   </a>
                   </td>
                   <td>${board.regist_day }</td>
                   <td>${board.hit}</td>
                   <td>${board.name }</td>
               </tr>
               </c:forEach>
         </table>
       </div>   
      <!-- 페이지 네비게이션 -->         
         <div align="center">
            <c:set var="pageNum" value="${pageNum}"/>
            <c:forEach var="i" begin="1" end="${total_page}">
            <!-- 검색 후 페이지 이동시 검색 조건이 해제되는 오류 처리, 검색조건, 검색어 추가 -->
             <a href="<c:url value     
        ="./BoardList.do?pageNum=${i}&items=${items}&text=${text}"/>">
                <c:choose>
                <c:when test="${pageNum==i}">
                <font color='4C5317'><b>[${i}]</b></font>
                </c:when>
                <c:otherwise>
                <font color='4C5317'>[${i}]</font>
                </c:otherwise>
               </c:choose>
               </a>
            </c:forEach>
         </div>

         <div align="center">
           <table>
    		        <tr>
    		          <td width="100%" align="left"> &nbsp;&nbsp;
    		                <select name="items" class="txt">
    		                  <option value="subject">제목</option>
    		                  <option value="content">내용</option>
    		                  <option value="name">글쓴이</option>
    		            </select> 
    		            <input type="text" name="text">
    		            <input type="submit" id="btnAdd" 
    		                                 class="btn btn-primary" value="검색">
    		           </td>
    		           <td width="100%" align="right">
    		               <a href="#" onclick="return checkForm();" 
    		                     class="btn btn-primary">&laquo;글쓰기</a> 
    		           </td> 
                    </tr>
           </table>
         </div>
       </form>
    </div>
  <jsp:include page="../footer.jsp"/>
</body>
</html>