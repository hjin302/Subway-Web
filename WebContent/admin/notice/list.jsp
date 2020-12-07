
<%@page import="com.shop.domain.Notice"%>
<%@page import="com.shop.controller.common.Pager"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   List<Notice> noticeList=(List)request.getAttribute("noticeList");
   Pager pager=(Pager)request.getAttribute("pager");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Subway_Admin</title>
<link rel="stylesheet" href="/css/admin.css"/>
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

button {
  border: 2px solid black;
  background-color: white;
  color: black;
  padding: 14px 28px;
  font-size: 16px;
  cursor: pointer;
}

/* Green */
button {
  border-color: #4CAF50;
  color: green;
}

button:hover {
  background-color: #4CAF50;
  color: white;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){   
   $($("button")[0]).click(function(){
      location.href="/admin/notice/registForm";
   });   
});

function getDetail(notice_idx){
   //상세보기 요청 
   location.href="/admin/notice/detail?notice_idx="+notice_idx;
}
</script>
</head>
<body>
   <%@include file="/admin/inc/main_navi.jsp"%>
<form>
<table>
  <tr>
    <th>No</th>
    <th>제목</th>
    <th>작성일</th>
  </tr>  
 <%int curPos=pager.getCurPos(); %>   
 <%int num=pager.getNum(); %>   
  <%for(int i=1;i<pager.getPageSize();i++){%>
 <%if(num<1)break;%>   
  <% Notice notice = noticeList.get(curPos++); %>
  <tr onClick="getDetail(<%=notice.getNotice_idx()%>)">
    <td><%=num-- %></td>
   <td><%=notice.getTitle() %></td>
   <td><%=notice.getRegdate()%></td>
  </tr>
  <%} %>
  <tr>
     <td colspan="3" style="text-align:center">
        <%for(int i=pager.getFirstPage();i<=pager.getLastPage();i++){%>
        <%if(i>pager.getTotalPage())break; %>
      <a href="/admin/notice/list?currentPage=<%=i%>">[<%=i%>]</a>        
      <%}%>
     </td>
  </tr>
</table>
</form>
    <button>등록</button>
</body>
</html>



