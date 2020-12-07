<%@page import="com.shop.controller.common.Pager"%>
<%@page import="com.shop.domain.Member"%>
<%@page import="com.shop.domain.AddStore"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<AddStore> storeList=(List)request.getAttribute("storeList");
	Pager pager=(Pager)request.getAttribute("pager");
%>

<!DOCTYPE html>
<html>
<head>
<title>Subway_Admin</title>
<meta charset="utf-8">
<link rel="stylesheet" href="/css/admin.css"/>

<!--[if IE 6]><link href="/css/ie6.css" rel="stylesheet" type="text/css"><![endif]-->
<!--[if IE 7]><link href="/css/ie7.css" rel="stylesheet" type="text/css"><![endif]-->
<style>
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
}

th, td {
  text-align: left;
  padding: 16px;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function getDetail(add_store_idx){
	//상세보기 요청 
	location.href="/admin/addStore/detail?add_store_idx="+add_store_idx;
}
</script>
</head>
<body>
	<%@include file="/admin/inc/main_navi.jsp"%>
<div class="container">
<form>
<table>
  <tr>
    <th>No</th>
    <th>제목</th>
    <th>작성자</th>
    <th>내용</th>
  </tr>
  
  
 <%int curPos=pager.getCurPos(); %>	
 <%int num=pager.getNum(); %>	
  <%for(int i=1;i<pager.getPageSize();i++){%>
 <%if(num<1)break;%>	
  <% AddStore addStore = storeList.get(curPos++); %>
  <tr onClick="getDetail(<%=addStore.getAdd_store_idx()%>)">
    <td><%=num-- %></td>
	<td><%=addStore.getTitle() %></td>
	<td><%=addStore.getMember().getName()%></td>
	<td><%=addStore.getRegdate()%></td>
  </tr>
  <%} %>
  <tr>
  	<td colspan="4" style="text-align:center">
  		<%for(int i=pager.getFirstPage();i<=pager.getLastPage();i++){%>
  		<%if(i>pager.getTotalPage())break; %>
		<a href="/admin/addStore/list?currentPage=<%=i%>">[<%=i%>]</a>  		
		<%}%>
  	</td>
  </tr>
  
</table>
<form>


</body>
</html>