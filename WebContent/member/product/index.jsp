<%@page import="com.shop.domain.AddStore"%>
<%@page import="com.shop.controller.common.Pager"%>
<%@page import="com.shop.domain.Category"%>
<%@page import="com.shop.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
      List<Product> productList = (List)request.getAttribute("productList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Subway</title>
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

#body{
	margin : 0px;
	background-color: #f7f7f7;
}

#imgBanner{
	height: 350px;
	margin-bottom: 80px;
	background-color: #e95b1d;
}

#imgBanner img{
	width : 100%;
	line-height: 150px;
}

#container{
	text-align: center;
	margin: auto;
}

#product_all{
	width : 1110px;
	margin: auto;
}

#product_container{
	width : 350px;
	height : 300px;
	text-align: center;
	float: left;
	margin: 10px;
	background-color: white; 
	position: relative;
	box-sizing: border-box; 
	
	 
}

#product_container:hover{

	border : 2px solid #009223
}

#product_img{
	text-align: center;
}

#product_img img{
	width: 300px;
	height: 220px;
}

h4{
	margin-top : 0px;
	margin-bottom: 10px;
}


</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>


</script>

</script>
</head>
<body>
<div id="body">


<%@ include file="/includes/header.jsp" %>
<div id="imgBanner">
	<img src="/images/imgBanner_sandwich.PNG">
</div>
<div id="container">
	<div id="product_all"> 
		<%for(int i=0;i<productList.size();i++){%>
		<%Product product = productList.get(i);%>
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
<div id="footer" style="margin-top: 2400px">
	    <div class="content">
	        <!-- util menu -->
	        
	        <!--// util menu -->

	        
	        <span class="addr">경기도 의정부시 녹양로 87번길 33</span>
	        <span class="rep">대표 : 김하진</span>
	        <span class="tel">전화 : 010-9525-3290</span>
			<span class="rep">사업자등록번호 : 010302</span>
	        <p class="copyright">SUBWAY® is a Registered Trademark of Subway IP LLC. © 2019 Subway IP LLC. All Rights Reserved.</p>
	    </div>
	</div>
</div>
</body>
</html>