<%@page import="com.shop.domain.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Admin admin=(Admin)session.getAttribute("admin");
%>
<div class="topnav">
  <a class="active" href="/admin">Home</a>
  <a href="/admin/category/index.jsp">카테고리 관리</a>
  <a href="/admin/product/list">상품관리</a>
  <a href="/admin/event/list.jsp">이벤트 등록</a>
  <a href="/admin/notice/list">공지사항 관리</a>
   <a href="/admin/addStore/list">가맹점</a>
  <a href="/admin/order/list">주문정보</a>
  <a><%=admin.getName() %>님 로그인 중</a>
</div>