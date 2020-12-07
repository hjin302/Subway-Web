<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Subway</title>
<meta charset="utf-8">
<link href="/css/style.css" rel="stylesheet" type="text/css">

<!--[if IE 6]><link href="/css/ie6.css" rel="stylesheet" type="text/css"><![endif]-->
<!--[if IE 7]><link href="/css/ie7.css" rel="stylesheet" type="text/css"><![endif]-->
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

body{
	margin: 0px;
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
input[type=button] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  margin-bottom : 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
input[type=button]:hover {
  background-color: #45a049;
}
.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
.pic{
	width:50%;
	height:250px;
	background:yellow;
	float:left;
	margin-top:50px;
}
.spec{
	width:50%;
	height:250px;
	background:green;
	float:left;
	margin-top:50px;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
  margin-top:50px;
}
th, td {
  text-align: left;
  padding: 16px;
}
tr:nth-child(even) {
  background-color: #f2f2f2;
}

input[type=text], input[type=password], select{
  width: 60%;
  height : 65px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
  font-family: NanumSquareWeb, sans-serif;
  font-size: 12pt;
}

input[type=password]{
	 font-family: sans-serif;
}

input[type=button] {
  width : 60%;
  height : 65px;
  background-color: #009223; 
  color: white;
  padding: 12px 20px;
  margin-top : 40px;
  margin-bottom : 60px;
  border: none;
  border-radius: 4px;
  cursor: pointer; 
  font-weight: bold;
  font-size: 12pt;
  font-family: NanumSquareWeb, sans-serif;
}
input[type=button]:hover {
  background-color: #45a049;
}






#buyer{
	font-family: NanumSquareWeb, sans-serif;
	display:inline-block;
	margin-top:40px;
	margin-bottom:40px;
	width: 60%;
	background-color: white;
	border: 1px solid lightgray;
}
#content{
	text-align: center;
	background-color: #f7f7f7;
}
h1{
	font-size: 28pt;
	margin-top: 60px;
	margin-bottom: 60px;
}

input[name="email_id"], select[name="email_domain"]{
	width: 50%;
	float: left;
}


</style>
<script>
function regist(){
	form1.method="post";
	form1.action="/member/regist";
	form1.submit();
}
function login(){
	location.href="/member/login.jsp";
}
</script>
</head>
<body>
	<%@ include file="/includes/header.jsp" %>
<div id="body">

<div id="content">
	<div id="buyer">
  		<h1>회원가입</h1>
  		<div>
	  		<div id="agree">
	  		
	  			<form name="form1">
				    <input type="text" name="id" placeholder="아이디 입력">
				    <input type="text" name="password" placeholder="비밀번호 입력">
				    <input type="text" name="name" placeholder="이름 입력">
				    <input type="text" name="phone" placeholder="연락처">
				    <div style="width: 60%; margin: auto">
					    <input type="text" name="email_id" placeholder="이메일">		    
					    <select id="country" name="email_domain">
						      <option value="0">메일선택</option>
						      <option value="@naver.com">naver</option>
						      <option value="@gmail.com">google</option>
						      <option value="@daum.net">daum</option>
					    </select>				    
				    </div>
		    	</form>
			    <div>
				    <input type="button" value="회원가입 완료!" onClick="regist()"/>
			    </div>
	
	  		</div>
  		</div>
	</div>
</div>
  		
    
    
  </div>
  <%@ include file="/includes/footer.jsp" %>

</body>
</html>