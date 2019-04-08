<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>    
<%
			String sessionId = (String)session.getAttribute("sessionId");
%>
<sql:setDataSource var="dataSource"
                               url="jdbc:mysql://localhost:3306/webmarketdb"
                               driver="com.mysql.jdbc.Driver"
                               user="root"
                               password="1234" />
                               
<!-- 회원탈퇴 처리는 member의 userflag을 1로 처리 -->                               
<sql:update dataSource="${dataSource}" var="resultSet">
   update member set useflag=1 where id=?
   <sql:param  value="<%=sessionId%>"/>
</sql:update>

<c:if test="${resultSet>=1}">
   <c:import url="logoutMember.jsp" var="url"/>
   <c:redirect url="resultMember.jsp"/>
</c:if>                               