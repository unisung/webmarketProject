<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>    
<%
       request.setCharacterEncoding("utf-8");
       String id=request.getParameter("id");
       String password=request.getParameter("password");
%>
<sql:setDataSource   var="dataSource" 
                                 driver="com.mysql.jdbc.Driver" 
                                 url="jdbc:mysql://localhost:3306/webmarketdb" 
                                 user="root" 
                                 password="1234" />
                                 
<!-- 회원탈퇴시 userflag을 1로 변경하였음. 
        로그인 조회시는 useflag=0인 회원만 로그인 처리 -->                           
<sql:query  dataSource="${dataSource}" var="resultSet">
select * from member where id=? and password=?  and useflag=0
<sql:param value="<%=id %>"/>
<sql:param value="<%=password%>"/>
</sql:query>        

<c:forEach var="row" items="${resultSet.rows}"><!-- rowsByIndex -->
   <%
   			session.setAttribute("sessionId",id);
   %>
    <c:redirect  url="resultMember.jsp?msg=2" />
</c:forEach>                         
                    
 <c:redirect url="loginMember.jsp?error=1"/>                   
                                