<%@page import="com.shop.domain.Product"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Product product=(Product)request.getAttribute("product");
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
 font-family: NanumSquareWeb;
	background-color: #f7f7f7;
	text-align: center;
}


.product_container{
	font-family: NanumSquareWeb, sans-serif;
	display:inline-block;
	margin-top:40px;
	margin-bottom:60px;
	background-color: white;
	border: 1px solid lightgray;
	width : 500px;
	height : 600px;
	text-align : center;
}


.product_img img{
	width: 350px;
	height: 280px;
}


li {
	font-size: 16pt;
	line-height: 40px;
	margin: auto;
}

button{
  width : 30%;
  height : 50px;
  color: #009223; 
  background-color : white;
  padding: 12px 20px;
  margin-top : 45px;
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

.dp1{
	line-height: 24px;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	//장바구니 담기 
	$($("button")[0]).click(function(){
		goCart();
	});
	
	//바로 구매하기
	$($("button")[1]).click(function(){
		buy();
	});
	
});

//장바구니에 상품 1개 담기!
function goCart(){
	//장바구니 담기 요청 
	$("form").attr({
		"action":"/shop/cart/regist",
		"method":"post"
	});
	$("form").submit();	
}

function buy(){
	//장바구니 담기 요청 
	$("form").attr({
		"action":"/shop/buy",
		"method":"post"
	});
	$("form").submit();	
}
</script>
</head>
<body>
<%@ include file="/includes/header.jsp" %>
<div id="body">
	<div id="content">
			<div class="product_container">
					<!-- 상세보기 -->
					<div class="product_img">
					  		<img src="/data/<%=product.getFilename()%>" width="20%"/>
					</div> 
					  
				  	<form>
					  		<input type="hidden" name="product_idx" 						value="<%=product.getProduct_idx()%>"/>
					  		<input type="hidden" name="category.category_idx" 		value="<%=product.getCategory().getCategory_idx()%>"/>
					  		<input type="hidden" name="category.Name" 				value="<%=product.getCategory().getName()%>"/>
					  		<input type="hidden" name="Name" 								value="<%=product.getName()%>"/>
					  		<input type="hidden" name="price" 								value="<%=product.getPrice()%>"/>
				  			<input type="hidden" name="filename" 							value="<%=product.getFilename()%>"/>
						  	<ul>
								  	<li style="color: white; font-weight: bold; font-size: 12pt; background-color:#009223; width: 30%; height: 28px; line-height: 28px;"><%=product.getCategory().getName() %></li>
								  	<li  style="font-weight: bold; font-size: 24pt; margin-top: 55px;"><%=product.getName() %></li>
								  	<li style="font-weight: bold; color: #ffc300"><%=product.getPrice() %>원</li>
						  	</ul>
				  	</form> 
				  	<button onClick="goCart()">장바구니</button>
				  	<button onClick="buy()">바로구매</button>
		  	</div> 
	</div>
  </div>


<div id="footer">
  <%@ include file="/includes/footer.jsp" %>
</div>

</body>
</html>
