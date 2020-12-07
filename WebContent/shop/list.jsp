<%@page import="com.shop.controller.common.Pager"%>
<%@page import="java.util.List"%>
<%@page import="com.shop.domain.Product"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Product> productList=(List)request.getAttribute("productList");
	Pager pager=(Pager)request.getAttribute("pager");
%>
<!DOCTYPE html>
<html>
<head>
<title>Subway</title>
<meta charset="utf-8">
<link href="/css/style.css" rel="stylesheet" type="text/css">
<style>
.pic{
	width:50%;
	height:250px;
	background:yellow;
	float:left;
	margin-top:50px;
}
.spec{
	width:50%;
	height:250px;
	background:green;
	float:left;
	margin-top:50px;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
  margin-top:50px;
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

</script>
</head>
<body>
<div id="header"> 
</div>
<div id="body">
  <div id="content">
		<!-- 장바구니 표 -->
		<h2>상품목록</h2>
<table>
  <tr>
    <th>No</th>
    <th>이미지</th>
    <th>카테고리</th>
    <th>상품명</th>
    <th>가격</th>
  </tr>
  
 <%int curPos=pager.getCurPos(); %>	
 <%int num=pager.getNum(); %>	
  <%for(int i=1;i<pager.getPageSize();i++){%>
 <%if(num<1)break;%>	
  <%Product product=productList.get(curPos++); %>
  <tr onClick="getDetail(<%=product.getProduct_idx()%>)">
    <td><%=num-- %></td>
    <td><img src="/data/<%=product.getFilename()%>" width="35px"/></td>
    <td><%=product.getCategory().getName()%></td>
    <td><%=product.getName() %></td>
    <td><%=product.getPrice() %></td>
  </tr>
  <%} %>
  <tr>
  	<td colspan="6" align="center">
  		<button onClick="location.href='/admin/product/registForm.jsp';">상품등록</button>
  	</td>
  </tr>
  <tr>
  	<td colspan="6" style="text-align:center">
  		<%for(int i=pager.getFirstPage();i<=pager.getLastPage();i++){%>
  		<%if(i>pager.getTotalPage())break; %>
		<a href="/product/list?currentPage=<%=i%>">[<%=i%>]</a>  		
		<%}%>
  	</td>
  </tr>
  
</table>	
	  
  </div>
  <div class="featured">
    <ul>
      <li><a href="#"><img src="/images/organic-and-chemical-free.jpg" width="300" height="90" alt=""></a></li>
      <li><a href="#"><img src="/images/good-food.jpg" width="300" height="90" alt=""></a></li>
      <li class="last"><a href="#"><img src="/images/pet-grooming.jpg" width="300" height="90" alt=""></a></li>
    </ul>
  </div>
</div>
<div id="footer">
  <%@ include file="/includes/footer.jsp" %>
</div>
</body>
</html>
