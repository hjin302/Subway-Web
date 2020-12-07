<%@page import="com.shop.domain.Product"%>
<%@page import="com.shop.domain.EventProduct"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Map<String, String> titleMap=(Map)request.getAttribute("titleMap");
	Map<String, List> listMap=(Map)request.getAttribute("listMap");
	
	
	//out.print(titleMap.size());
	//out.print("<br>");
	//out.print(listMap.size());
	Iterator titleKey = titleMap.keySet().iterator();
	Iterator listKey = listMap.keySet().iterator();
%>
<!DOCTYPE html>
<html>
<head>
<title>Subway</title>
<meta charset="UTF-8">
<link href="/css/style.css" rel="stylesheet" type="text/css">
<!--[if IE 6]><link href="css/ie6.css" rel="stylesheet" type="text/css"><![endif]-->
<!--[if IE 7]><link href="css/ie7.css" rel="stylesheet" type="text/css"><![endif]-->
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
  margin-top:50px;
  background-color: white;
}

td{
  padding: 16px;
  border-top: 1px solid #bcbcbc; 
  border-bottom: 1px solid #bcbcbc;
}



a:hover 
{
     color:#adadad; 
     text-decoration:none; 
     cursor:pointer;  
}

</style>
</head>
<body>
<%@ include file="/includes/header.jsp" %>
<div id="body">
  <div id="content">
  <div id="cart_product">
		<h1>이벤트</h1>
		
		<table width="100%">
		
		<tr style="background-color: #ffc300; font-weight: bold;">
			<td>제목</td>
			<td>할인 상품</td>
		</tr>  
      <%while(titleKey.hasNext()){%>
      <%
      	String key=(String)titleKey.next(); 
      	String title=titleMap.get(key);
      	
      	String key2=(String)listKey.next();
      	List<EventProduct> list=listMap.get(key2);
      %>
      	<tr>
          <td style="font-size: 16pt; font-weight: bold; color: #009223;"><%=title %></td>
          <td style="line-height: 30px; font-size: 12pt; font-weight: bold;">
          <%for(int i=0;i<list.size();i++){ %>
          <%EventProduct ep=list.get(i); %>
          	<a style=" color: black; 	text-decoration: none;" href="/shop/detail?product_idx=<%=ep.getProduct().getProduct_idx()%>">
          		<%=ep.getProduct().getName() %></a><br>
 			<%} %>
          </td>
      	</tr>
       <%} %>
</table>
</body>
</html>
