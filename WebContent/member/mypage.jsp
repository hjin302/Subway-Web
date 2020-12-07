<%@page import="com.shop.domain.Member"%>
<%@page import="java.util.List"%>
<%@page import="com.shop.domain.OrderSummary"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Member obj = (Member) request.getAttribute("member");
	List<OrderSummary> orderList= (List) request.getAttribute("orderList");
%>
<!DOCTYPE html>
<html>
<head>
<title>Subway</title>
<meta charset="UTF-8">
<link href="/css/style.css" rel="stylesheet" type="text/css">
<style>

@font-face {
  font-family: NanumSquareWeb;
  src: local(NanumSquareR),
       local(NanumSquare),
       url(NanumSquareR.eot?#iefix) format('embedded-opentype'),
       url(NanumSquareR.woff) format('woff'),
       url(NanumSquareR.ttf) format('truetype');
	  font-style: normal;
	  font-weight: normal;
	  unicode-range: U+0-10FFFF;
}

#content{
	background-color: #f7f7f7;
	text-align: center;
}

#my_product{
	font-family: NanumSquareWeb, sans-serif;
	display:inline-block;
	margin-top:40px;
	margin-bottom:40px;
	width: 60%;
}

table {
  border-collapse: collapse;
  width: 100%;
  margin-top:50px;
  background-color: white;
}

td, th {
  padding: 16px;
  border-top: 1px solid #bcbcbc; 
  border-bottom: 1px solid #bcbcbc;

}

th {
	background-color: #ffc300;
}


h1{
	font-size: 28pt;
}

button{
  width : 100px;
  height : 45px;
  color: #009223; 
  background-color : white;
  margin-top : 25px;
  margin-bottom : 20px;
  border:  2px solid #009223; 
  border-radius: 4px;
  cursor: pointer; 
  font-weight: bold;
  font-size: 12pt;	
  font-family: NanumSquareWeb, sans-serif;
}


button:hover {
  background-color: #45a049;
  color: white;
}

h2{
	margin-top: 60px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	   //수정
	   $($("button")[0]).click(function(){
	      edit();
	   });
});

function edit(){
	   $("form").attr({
	      "action":"/member/edit",
	      "enctype":"multipart/form-data",
	      "method":"post"
	   });
	   $("form").submit();
	}
</script>
</head>
<body>
<%@include file="/includes/header.jsp" %>
<div id="body">
  <div id="content">
    <div id="my_product">
      <h1 style="font-weight: bold;">MY-SUB</h1>
      
          <div id="myInfo" style="text-align: center;">
          <h2>[ 나의 정보 ]</h2>
          	<input type="hidden" name="member_idx" value="<%=obj.getMember_idx()%>">
			<table width="100%">
          			<tr>
          				<td>아이디</td>
          				<td><%=obj.getId()%></td>
          			</tr>
          			<tr>
          				<td>비밀번호</td>
          				<td><input type="text" value="<%=obj.getPassword()%>"></td>
          			</tr>
          			<tr>
          				<td>이름</td>
          				<td><%=obj.getName()%></td>
          			</tr>
          			<tr>
          				<td>연락처</td>
          				<td><%=obj.getPhone()%></td>
          			</tr>
          			<tr>
          				<td>Email</td>
          				<td><%=obj.getEmail_id()%><%=obj.getEmail_domain()%></td>
          			</tr>
      		</table>
          	<button>수정</button>
 
          	</div>
  
      
          <h2>[ 결제 내역 ]</h2>
         
          	
          		<table width="100%" style="margin-bottom: 60px;">
          			<tr>
          				<th>주문번호</th>
          				<th>총 결제액</th>
          				<th>주문일</th>
          				<th>결제방법</th>
          			</tr>
          			<%for(int i=0; i<orderList.size();i++){ %>
          			<%OrderSummary orderSummary=orderList.get(i);%>
          			<tr>
          				<td><%=orderSummary.getOrder_summary_idx() %></td>
          				<td><%=orderSummary.getTotal_pay() %></td>
          				<td><%=orderSummary.getOrder_date() %></td>
          				<td><%=orderSummary.getPay_method() %></td>
          			</tr>
          			<%} %>
          		</table>

          
        
      </div>
    </div>
</div>

<div id="footer">
  <%@include file="/includes/footer.jsp"%>
</div>
</body>
</html>