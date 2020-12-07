<%@page import="com.shop.domain.Member"%>
<%@page import="com.shop.domain.OrderSummary"%>
<%@page import="com.shop.domain.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.shop.domain.Product"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Cart> cartList=(List)session.getAttribute("cartList");

	if(session.getAttribute("cartOne")!=null){
		cartList = (List)session.getAttribute("cartOne");
	}
	
	Member obj=(Member)session.getAttribute("member");
	OrderSummary orderSummary=(OrderSummary)request.getAttribute("orderSummary");
	//out.print(orderSummary.getSame());
%>
<!DOCTYPE html>
<html>
<head>
<title>Subway</title>
<meta charset="utf-8">
<link href="/css/style.css" rel="stylesheet" type="text/css">
<%@ include file="/includes/header.jsp" %>
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

#cart_product{
	font-family: NanumSquareWeb, sans-serif;
	display:inline-block;
	margin-top:40px;
	margin-bottom:40px;
	width: 60%;
}

h1{
	font-size: 28pt;
}



table {
  border-collapse: collapse;
  width: 100%;
  border: 1px solid #ddd;
  margin-top:50px;
  background-color: white;
}

td, th {
  padding: 16px;
}

th {
	background-color: #ffc300;
}


button{
  width : 55x;
  height : 30px;
  color: #009223; 
  background-color : white;
  margin-top : 45px;
  margin-bottom : 20px;
  border:  2px solid #009223; 
  border-radius: 4px;
  cursor: pointer; 
  font-weight: bold;
  font-size: 9pt;
  font-family: NanumSquareWeb, sans-serif;
}


button:hover {
  background-color: #45a049;
  color: white;
}
	
	
	
form{
	margin-top: 40px;
	margin-bottom: 40px;
}

input[type='text'], select, option{
	 width: 60%;
	 height : 45px;
	 padding: 12px;
	 border: 1px solid #ccc;
	 border-radius: 4px;
	 box-sizing: border-box;
	 margin-top: 6px;
	 resize: vertical;
	 font-family: NanumSquareWeb, sans-serif;
	 font-size: 12pt;
}
	
	
input[type='button']{
  width : 100px;
  height : 45px;
  color: #009223; 
  background-color : white;
  margin-top : 35px;
  margin-bottom : 20px;
  border:  2px solid #009223; 
  border-radius: 4px;
  cursor: pointer; 
  font-weight: bold;
  font-size: 12pt;	
  font-family: NanumSquareWeb, sans-serif;
}


input[type='button']:hover {
  background-color: #45a049;
  color: white;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
//결제 3단계 요청하기 (결제 완료 짓기!!)
function pay(){
	if(!confirm("입력하신 정보로 결제할까요?")){
		return;
	}
	$("form").attr({
		"action":"/shop/step3", 
		"method":"post"
	});
	$("form").submit();
}
</script>
</head>
<body>
<div id="body">
  <div id="content">
    <div id="cart_product">
		<!-- 장바구니 표 -->
		<h1>결제정보 확인</h1>
		
		<table width="100%">
		  <tr>
		    <th>이미지</th>
		    <th>카테고리</th>
		    <th>상품명</th>
		    <th>가격</th>
		    <th>수량</th>
		  </tr>
		  <%int totalBuy=0; %>
		<%for(int i=0;i<cartList.size();i++){%>
		<%Cart cart = cartList.get(i); %>
		<%totalBuy+=(cart.getPrice()*cart.getEa()); %>		  
		  <tr>
		    <td><img src="/data/<%=cart.getFilename() %>" width="45px"/></td>
		    <td><%=cart.getCategory().getName() %></td>
		    <td><%=cart.getName() %></td>
		    <td><%=cart.getPrice() %></td>
		    <td><%=cart.getEa() %> 개</td>
		  </tr>
		  <%}%>
		  <tr>
		  	<td colspan="6" style="text-align:right">구매 총액 : <%=totalBuy %>원</td>
		  </tr>
		</table>		
		
		
	  <form>
	  	<div id="buyer">
		  <input type="text" readonly name="cname" value="<%=obj.getName()%>">
		  <input type="text" readonly name="cphone" value="<%=obj.getPhone()%>">
		  <input type="text" readonly name="email" value="<%=obj.getEmail_id()%>">
		  <input type="text" readonly name="total_pay" value="<%=orderSummary.getTotal_pay()%>">
		  <input type="text" readonly name="pay_method" value="<%=orderSummary.getPay_method()%>">
		 </div>
	    
	  </form>
	  
	  <input type="button" value="결제하기" onClick="pay()"/>
	  <input type="button" value="이전단계" onClick="history.back();"/>
	  </div>
  </div>
</div>
  <%@ include file="/includes/footer.jsp" %>
</body>
</html>




