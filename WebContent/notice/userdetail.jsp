<%@page import="com.shop.domain.Notice"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   Notice notice = (Notice)request.getAttribute("notice");
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


* {box-sizing: border-box;}

textarea {
 font-family: NanumSquareWeb;
  width: 60%;
  height : 400px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 36px;
  margin-bottom: 16px;
  resize: vertical;
  font-size: 12pt;
}

button{
  width : 100px;
  height : 50px;
  background-color: #009223; 
  color: white;
  padding: 12px 20px;
  margin-top : 40px;
  margin-bottom : 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer; 
  font-size: 12pt;
  font-weight : bold;
  font-family: NanumSquareWeb, sans-serif;
}


button:hover {
  background-color: #45a049;
  color: white;
}


#buyer{
	font-family: NanumSquareWeb, sans-serif;
	display:inline-block;
	margin-top:40px;
	margin-bottom:40px;
	width: 60%;
	height : 800px;
	background-color: white;
	border: 1px solid lightgray;
}
#content{
	text-align: center;
	background-color: #f7f7f7;
}

h1{
	margin-top: 60px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
   //목록
   $($("button")[0]).click(function(){
      location.href="/notice/list";
   });
   
});
</script>
</head>
<body>

<%@ include file="/includes/header.jsp" %>
<div id="body">

  <div id="content">
  	<div id="buyer">
  <form>
     <input type="hidden" name="notice_idx" value="<%=notice.getNotice_idx()%>"/>
    <h1><%=notice.getTitle()%></h1>
    <textarea readonly="readonly"><%=notice.getContent()%></textarea>
  </form>
   <button>목록</button>
</div>
</div>
</div>
</body>
</html>