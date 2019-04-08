<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
 <%
 		String sessionId = (String)session.getAttribute("sessionId");
 %>   
<nav class="navbar navbar-expand  navbar-dark bg-dark">
   <div class="container">
   		<div>
   		    <a class="navbar-brand" href="<%=getServletContext().getContextPath()%>">Home</a>
   		</div>
   		<div>
   		    <ul class="navbar-nav mr-auto">
<li class="nav-item"><a class="nav-link" href="<%=getServletContext().getContextPath() %>/products.jsp">상품목록</a></li>
 <li class="nav-item"><a class="nav-link" href="<%=getServletContext().getContextPath() %>/addProduct.jsp">관리자 로그인</a></li>
  <li class="nav-item"><a class="nav-link" href="<%=getServletContext().getContextPath() %>/BoardList.do?pageNum=1">게시판</a></li> 
   		    </ul>
   		</div>
   </div>
</nav>