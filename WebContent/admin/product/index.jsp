<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.shop.domain.Category"%>
<%@page import="com.shop.controller.common.Pager"%>
<%@page import="com.shop.domain.Product"%>
<%@page import="java.util.List"%>
<%

   List<Product> productList=(List)request.getAttribute("productList");
   Pager pager=(Pager)request.getAttribute("pager");
   
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
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	   getList();//카테고리 목록 가져오기!   
});

function getDetail(product_idx){
   //상세보기 요청
   location.href="/admin/product/detail?product_idx="+product_idx;
}

function getList(){
	   $.ajax({
	      "url":"/admin/event/list",
	      "type":"get",
	      success:function(result){
	         var json=JSON.parse(result);
	         
	         $("select").empty(); //비우기!

	         $("select").append("<option value='0'>이벤트 선택</option>");
	         for(var i=0;i<json.eventList.length;i++){
	            var obj=json.eventList[i];
	            $("select").append("<option value='"+obj.event_idx+"'>"+obj.title+"</option>");
      }
   }
});   
}

function sendToEvent(){
	//체크박스에 체크한게 있는지 유효성 검사부터 하자!!
	//체크박스에 체크한 경우 카운트를 1씩 증가시켜서, 만일
	//증가된게 없다면..체크안한 것이다!!
	var ch=document.getElementsByName("product_idx");
	var count=0;
	
	for(var i=0;i<ch.length;i++){
		if(ch[i].checked){
			count++;
		}
	}
	if(document.querySelector("select").value=="0"){
		alert("등록하실 이벤트의 종류를 선택하세요");
		return;
	}else if(count<1){
		alert("선택된 상품이 없습니다");
		return;
	}
	
	if(confirm("선택한 상품을 이벤트 상품으로 등록하시겠습니까?")){
		//이벤트의 종류는 select 박스값이 결정하고 event_id
		//등록될 상품은 checkbox 가 결정한다
		var form=document.querySelector("form");
		form.action="/admin/eventproduct/regist";
		form.method="post";
		form.submit();
	}
}
</script>
</head>
<body>

<%@include file="/admin/inc/main_navi.jsp"%>
<div class="container">
<form>
<table>
  <tr>
    <th width="200">
		<select name="event.event_idx">
			<option value="0">이벤트 상품 선택</option>
		</select>
    </th>
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
 <%Product product = productList.get(curPos++);
 %>
    <tr>
    <td>
       <input type="checkbox" name="product_idx" value="<%=product.getProduct_idx()%>"/>
    </td>
    <td onClick="getDetail(<%=product.getProduct_idx()%>)"><%=num-- %></td>
    <td onClick="getDetail(<%=product.getProduct_idx()%>)"><img src="/data/<%=product.getFilename()%>" width="35px"/></td>
    <td onClick="getDetail(<%=product.getProduct_idx()%>)"><%=product.getCategory().getName() %></td>
    <td onClick="getDetail(<%=product.getProduct_idx()%>)"><%=product.getName() %></td>
    <td onClick="getDetail(<%=product.getProduct_idx()%>)"><%=product.getPrice() %></td>
  </tr>
  <%} %>
<tr>
     <td colspan="7" align="center">
        <input type="button" onClick="location.href='/admin/product/registForm.jsp';" value="상품등록">
        <button onClick="sendToEvent()">이벤트 상품 등록</button>
     </td>
  </tr>
  <tr>
     <td colspan="7" style="text-align:center">
        <%for(int i=pager.getFirstPage();i<=pager.getLastPage();i++){%>
        <%if(i>pager.getTotalPage())break; %>
      <a href="/admin/product/list?currentPage=<%=i%>">[<%=i%>]</a>        
      <%}%>
     </td>
  </tr>
  
</table>
</form>
</body>
</html>



