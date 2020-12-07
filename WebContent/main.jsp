<%@page import="com.shop.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
      List<Product> productList = (List)request.getAttribute("productList");

	  //System.out.println("productList 출력" + productList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Subway</title>
<link href="/css/style.css" rel="stylesheet" type="text/css">
<style>
#main_content{
height : 500px;
}

#menu_title{
	
}

#contentAlign{
	height : 300px;
	margin : 0px;
	display: flex;
}

#contentArea{
	width : 69%;
	height : 275px;
	position: relative;
	left: 300px;
	top: 90px;
	float : left;
	overflow-x: hidden;
	overflow-y: scroll;
}
#contentArea::-webkit-scrollbar {
    width: 15px;
 }
 #contentArea::-webkit-scrollbar-thumb {
   background-color: #009223;
 }
 #contentArea::-webkit-scrollbar-track {
   background-color: #f7f7f7;
 }



/* 상품 */
#product_container{
	width : 300px;
	height : 260px;
	text-align: center;
	float: left;
	margin: 10px;
	background-color: white; 
	position: relative;
	box-sizing: border-box; 
	
}

#product_container:hover{
	border : 2px solid #009223;
}

#product_img{
	text-align: center;
}

#product_img img{
	width: 240px;
	height: 180px;
}

h4{
	margin-top : 0px;
	margin-bottom: 10px;
}


</style>
</head>
<body>
	<%@ include file="/includes/header.jsp" %>
	<div id="banner">
	 	<div class="slide">
		    <ul>
		      <li><img src="/images/banner_1.jpg"></li>
		      <li><img src="/images/banner_2.jpg"></li>
		      <li><img src="/images/banner_3.jpg"></li>
		      <li><img src="/images/banner_4.jpg"></li>
		    </ul>
  		</div>
  		<div class="quick_link">
			<div class="quick_link_content">
				<div class="store">
					<a href="/shop/cart.jsp"><strong>장바구니</strong></a>
				</div>
				<div class="franchise">
					<a href="/addStore/list"><strong>가맹신청ㆍ문의</strong></a>
				</div>
			</div>
		</div>
	</div>
	
	<div id="main_content">
			<img src="/images/menu_title.PNG" id="menu_title" width="350px" height="80px">		
			
			
			<div id="contentArea">			
						<%for(int i=0;i<productList.size();i++){%>
	      				<%Product product =(Product)productList.get(i); 
	      				%>
						<div id="product_container">
						   <input type="hidden" name="product_idx" value="<%=product.getProduct_idx()%>"/>
							<div id="product_img"><a href="/shop/detail?product_idx=<%=product.getProduct_idx()%>"><img src	="/data/<%=product.getFilename()%>" width="150px" height="150px"/></a></div>
							<input type="hidden" value="<%=product.getCategory().getName() %>">	
							<h4 style="font-size: 14pt; font-family: NanumSquareWeb;"><%=product.getName() %></h4>
							<div style="color: #ffc300; font-weight: bold; font-family: NanumSquareWeb;"><%=product.getPrice() %>원</div>	
					  
						</div>
					<%} %>
					
			</div>	
		
		
	</div>
	<div id="quickMenu"></div> 
	<%@ include file="/includes/footer.jsp" %>
</body>
</html>