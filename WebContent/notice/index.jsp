<%@page import="com.shop.controller.common.Pager"%>
<%@page import="com.shop.domain.Notice"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   List<Notice> noticeList=(List)request.getAttribute("noticeList");
   Pager pager=(Pager)request.getAttribute("pager");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Subway</title>
<link rel="stylesheet" href="/css/style.css"/>
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
   border-top: 5px solid #009223; 
  border-bottom: 1px solid #bcbcbc;


}

td, th {
  padding: 25px;
  border-top: 1px solid #bcbcbc; 
  border-bottom: 1px solid #bcbcbc;
}

th {
	background-color: #ffc300;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function getDetail(notice_idx){
   //상세보기 요청 
   location.href="/notice/userdetail?notice_idx="+notice_idx;
}
</script>
</head>
<body>
<%@ include file="/includes/header.jsp" %>
<div id="body">
  <div id="content">
    <div id="cart_product">
		<!--공지사항 -->
		<h1>공지사항</h1>
				<form>
				<table>
				  
				 <%int curPos=pager.getCurPos(); %>   
				 <%int num=pager.getNum(); %>   
				  <%for(int i=1;i<pager.getPageSize();i++){%>
				 <%if(num<1)break;%>   
				  <% Notice notice = noticeList.get(curPos++); %>
				  <tr onClick="getDetail(<%=notice.getNotice_idx()%>)">
				    <td style="color: #ffc300; font-weight: bold; font-size: 12pt; text-align: left;"><%=num-- %></td>
				   <td style="font-weight: bold; text-align: left;"><%=notice.getTitle() %></td>
				   <td style="text-align: right;"><%=notice.getRegdate()%></td>
				  </tr>
				  <%} %>
				  <tr style="background-color: #fafafa;">
				     <td colspan="3" style="text-align:center">
				        <%for(int i=pager.getFirstPage();i<=pager.getLastPage();i++){%>
				        <%if(i>pager.getTotalPage())break; %>
				      <a style="font-weight: bold; font-size:14pt; color:#009223; " href="notice/list?currentPage=<%=i%>"><%=i%></a>        
				      <%}%>
				     </td>
				  </tr>
				</table>
				</form>
				
				</div>
		</div>
	</div>

<%@ include file="/includes/footer.jsp" %>
</body>
</html>



