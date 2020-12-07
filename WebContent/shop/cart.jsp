<%@page import="com.shop.domain.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.shop.domain.Product"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Cart> cartList=(List)session.getAttribute("cartList");
%>
<!DOCTYPE html>
<html>
<head>
<title>Subway</title>
<meta charset="utf-8">
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

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){

});
function del(product_idx){
	if(confirm("상품코드 "+product_idx+" 를 삭제하시겠어요?")){
		location.href="/shop/cart/del?product_idx="+product_idx;		
	}
}
function removeAll(){
	if(confirm("장바구니를 비우시겠어요?")){
		location.href="/shop/cart/remove";		
	}
}
function edit(product_id, id){
	var n=id.split("_")[1];
	var ea = document.getElementById("t_"+n).value;
	if(confirm(product_id+"상품의 갯수를 "+ea+"개로 수정할래요?")){
		location.href="/shop/cart/edit?product_idx="+product_id+"&ea="+ea;
	}
}

function buy(){
	//결제 1단계 페이지 요청 
	location.href="/shop/step1";
}
</script>
</head>
<body>
<%@ include file="/includes/header.jsp" %>
<div id="body">
  <div id="content">
  	<div id="cart_product">
  	
			<h1>장바구니</h1>
			<table width="100%">
			  <tr>
			    <th>이미지</th>
			    <th>상세정보</th>
			    <th>수량</th>
			    <th>변경</th>
			    <th>삭제</th>
			  </tr>
			  <%int totalBuy=0;//총 구매금액 %>
			  <%if(cartList!=null){%>
				  <%for(int i=0;i<cartList.size();i++){%>
					  <%Cart cart=cartList.get(i); %>
					  <%
					  	//가격*갯수 
					  	totalBuy+=(cart.getPrice()*cart.getEa());
					  %>
					  <tr>
					    <td><img src="/data/<%=cart.getFilename()%>" width="45px"/></td>
					    <td>
					    	<ul>
					    		<li>카테고리명:<%=cart.getCategory().getName() %></li>
					    		<li>상품명:<%=cart.getName() %></li>
					    		<li>가격:<%=cart.getPrice() %></li>
					    	</ul>
					    </td>
					    <td><input type="text" id="t_<%=i%>" value="<%=cart.getEa()%>"/></td>
					    <td><button id="bt_<%=i%>" onClick="edit(<%=cart.getProduct_idx()%>, this.id)">수정</button></td>
					    <td><button onClick="del(<%=cart.getProduct_idx()%>)">삭제</button></td>
					  </tr>
				  <%} %>
			  <%}else{%>
			    <td style="text-align:center" colspan="5">
			    	장바구니가 비어있습니다.
			    </td>
			  <%} %>
			  <tr style="background-color: #fafafa;">
			  	<td colspan="4" style="text-align:right; font-size: 14pt; font-weight: bold;">총 <%=totalBuy %>원</td>
			  	<td colspan="1">
			  		<button style="background-color:#009223; color: white; margin-bottom: 45px; width: 120px; height: 40px; font-size: 10pt" onClick="removeAll()">장바구니 비우기</button>
			  		<button style="background-color:#009223; color: white; margin-bottom: 45px; width: 120px; height: 40px; font-size: 10pt" onClick="buy()">구매하기</button>
			  	</td>
			  </tr>
			</table>		
  	
  	</div>
  </div>
</div>
<div id="footer">
  <%@ include file="/includes/footer.jsp" %>
</div>
</body>
</html>
