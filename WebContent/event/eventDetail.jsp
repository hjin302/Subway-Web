<%@page import="com.shop.domain.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   Product product = (Product) request.getAttribute("product");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Subway</title>
<link href="/css/style.css" rel="stylesheet" type="text/css">

<style>
body {
   font-family: Arial, Helvetica, sans-serif;
}

* {
   box-sizing: border-box;
}

input[type=text], select, textarea {
   width: 100%;
   padding: 12px;
   border: 1px solid #ccc;
   border-radius: 4px;
   box-sizing: border-box;
   margin-top: 6px;
   margin-bottom: 16px;
   resize: vertical;
}

button {
   background-color: #4CAF50;
   color: white;
   padding: 12px 20px;
   border: none;
   border-radius: 4px;
   cursor: pointer;
}

button:hover {
   background-color: #45a049;
}

.container {
   border-radius: 5px;
   background-color: #f2f2f2;
   padding: 20px;
}
</style>
<script    src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="/includes/header.jsp" %>
   <div class="container">
      <form>
         <input type="hidden" name="product_idx" value="<%=product.getProduct_idx()%>"> 
         <input type="hidden" name="filename" value="<%=product.getFilename()%>"> 
         <input type="text" name="name" value="<%=product.getName()%>"> 
         <input type="text" name="price" value="<%=product.getPrice()%>"> 
         <img src="/data/<%=product.getFilename() %>" width="200px">
      </form>
   </div>
</body>
</html>