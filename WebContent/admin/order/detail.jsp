<%@page import="com.shop.domain.OrderDetail"%>
<%@page import="com.shop.domain.OrderSummary"%>
<%@page import="com.shop.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   List<OrderDetail> detailList=(List)request.getAttribute("detailList");

   OrderSummary orderSummary=(OrderSummary)request.getAttribute("orderSummary");
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

#btnArea{
   margin-top:20px;
   text-align:center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function getDetail(order_summary_idx){
   //상세보기 요청 
   location.href="/admin/order/detail?order_summary_idx="+order_summary_idx;
}
function orderlist() {
   location.href="/admin/order/list"
}
function del(){
      if(confirm("삭제하시겠습니까?")){
         $("form").attr({
            "action":"/admin/order/delete",
            "method":"post"
         });
         $("form").submit();
      }
   }
</script>
</head>
<body>
<div id="productList">
<form>
   <h3>구매 상품 정보</h3>
   <table>
     <tr>
       <th>상품코드</th>
       <th>이미지</th>
       <th>카테고리</th>
       <th>상품명</th>
       <th>가격</th>
     </tr>
     <%for(int i=0;i<detailList.size();i++){%>
     <%
           OrderDetail orderDetail = detailList.get(i);
           Product product=orderDetail.getProduct();
     %>
      <input type="hidden" name="order_summary_idx" value="<%=orderSummary.getOrder_summary_idx()%>">
     <tr>
       <td><%=product.getProduct_idx()%></td>
      <td><img src="/data/<%=product.getFilename()%>" width="45px"/></td>
      <td><%=product.getCategory().getName()%></td>
      <td><%=product.getName()%></td>
      <td><%=product.getPrice()%></td>
     </tr>
     <%} %>
     <tr>
        <td colspan="7" align="center">
           <button onClick="location.href='/admin/product/registForm.jsp';">상품등록</button>
        </td>
     </tr>
   </table>
</div>
<div id="payInfo">
   <h3>결제 내역</h3>
      <table>
        <tr>
          <th>주문자</th>
          <th>연락처</th>
          <th>이메일</th>
          <th>결제금액</th>
          <th>주문일시</th>
          <th>결제방법</th>
        </tr>
        <tr>
          <td><%=orderSummary.getMember().getName()%></td>
         <td><%=orderSummary.getMember().getPhone()%></td>
         <td><%=orderSummary.getMember().getEmail_id()%></td>
         <td><%=orderSummary.getTotal_pay()%></td>
         <td><%=orderSummary.getOrder_date()%></td>
         <td><%=orderSummary.getPay_method()%></td>
        </tr>
        <tr>
           <td colspan="7" align="center">
              <button onClick="location.href='/admin/product/registForm.jsp';">상품등록</button>
           </td>
        </tr>
      </table>
   </div>
</form>
<div id="btnArea">
   <button onClick="orderlist()">주문목록</button>
   <button onClick="del()">주문삭제</button>
</div>
</body>
</html>
















