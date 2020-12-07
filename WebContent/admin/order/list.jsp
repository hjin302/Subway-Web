<%@page import="com.shop.controller.common.Pager"%>
<%@page import="com.shop.domain.OrderSummary"%>
<%@page import="com.shop.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<OrderSummary> orderList=(List)request.getAttribute("orderList");
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
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function getDetail(order_summary_idx){
	//상세보기 요청 
	location.href="/admin/order/detail?order_summary_idx="+order_summary_idx;
}
</script>
</head>
<body>
<%@include file="/admin/inc/main_navi.jsp"%>
<table>
  <tr>
    <th>No</th>
    <th>주문자</th>
    <th>주문금액</th>
    <th>주문일시</th>
    <th>결제방법</th>
  </tr>
  
 <%int curPos=pager.getCurPos(); %>	
 <%int num=pager.getNum(); %>	
  <%for(int i=1;i<pager.getPageSize();i++){%>
 <%if(num<1)break;%>	
  <%OrderSummary orderSummary=orderList.get(curPos++); %>
  <tr onClick="getDetail(<%=orderSummary.getOrder_summary_idx()%>)">
    <td><%=num-- %></td>
	<td><%=orderSummary.getMember().getName() %></td>
	<td><%=orderSummary.getTotal_pay() %></td>
	<td><%=orderSummary.getOrder_date() %></td>
	<td><%=orderSummary.getPay_method() %></td>
  </tr>
  <%} %>
  <tr>
  	<td colspan="7" align="center">
  		<button onClick="location.href='/admin/product/registForm.jsp';">상품등록</button>
  	</td>
  </tr>
  <tr>
  	<td colspan="7" style="text-align:center">
  		<%for(int i=pager.getFirstPage();i<=pager.getLastPage();i++){%>
  		<%if(i>pager.getTotalPage())break; %>
		<a href="/admin/product/list?currentPage=<%=i%>">[<%=i%>]</a>  		
		<%}%>
  	</td>
  </tr>
  
</table>

</body>
</html>




