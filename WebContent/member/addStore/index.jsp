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

input[type=text], textarea {
  width: 90%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
  font-family: NanumSquareWeb, sans-serif;
}
button {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  margin-top : 40px;
  margin-bottom : 20px;
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

#agree{
	margin: auto;
	
	color: lightgray;
	
	
}

#agree_1, #agree_2{
	width: 500px;
	height: 300px;
	text-align: left; 
	display:inline-block;
	margin: 20px;
	
}

#agree_1 div{
	margin : 15px;
	padding : 0px;
	font-size: 13pt;	
	color: gray;
	font-weight: bold;
	margin-left: 0px;
}

#agree_2 div{
	margin : 15px;
	padding : 0px;
	font-size: 13pt;	
	color: gray;
	font-weight: bold;
	margin-left: 0px;
}

pre{
 	width: 480px;
	height: 170px;
	overflow-x : hidden;
	overflow-y : scroll;

	border: 2px solid lightgray;
	float: left;
	margin: 0px;
	padding: 10px;
	font-size: 10pt;
	font-family: NanumSquareWeb, sans-serif;
} 

form{
	width: auto;
	margin-top: 30px;
}




input[id="cb1"] + label { 
	display: inline-block; 
	width: 26px; 
	height: 26px; 
	border : 2px solid lightgray;
	border-radius: 16px; 
	cursor: pointer; 
	margin-top: 10px;
	margin-right: 10px;
} 

input[id="cb1"]:checked + label { 
	background-color: #009223; 
} 

input[id="cb1"] { 
	display: none; 
}


input[id="cb2"] + label { 
	display: inline-block; 
	width: 26px; 
	height: 26px; 
	border : 2px solid lightgray;
	border-radius: 16px; 
	cursor: pointer; 
	margin-top: 10px;
	margin-right: 10px;
} 

input[id="cb2"]:checked + label { 
	background-color: #009223; 
} 

input[id="cb2"] { 
	display: none; 
}

</style>
<script>
function regist(){
	form1.method="post";
	form1.action="/addStore/regist";
	form1.submit();
}

</script>
</head>
<body>
	<%@ include file="/includes/header.jsp" %>
<div id="body">

  <div id="content">
  	<div id="buyer">
  		<h1>가맹신청ㆍ문의</h1>
  		<div>
  		<div id="agree">
	  		<div id="agree_1">
	  			<div>개인정보수집 및 이용동의</div>
<pre>
'서브웨이인터내셔날 비브이' 의 광고를 담당하는 써브웨이 프랜차이즈 광고 기금 트러스트는 
(이하 '회사') 는 문의 및 가맹신청 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.

ο 수집항목
필수항목 : 이름, 이메일, 연락처
선택항목 : 기타문의사항

ο 개인정보 수집방법 : 홈페이지(문의 및 가맹신청)

■ 개인정보의 수집 및 이용목적
회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.

ο 신청자 관리
서비스 이용에 따른 가입 의사 확인, 연령확인, 불만처리 등 민원처리, 고지사항 전달
(민원처리를 위해 해당 매장 및 매장 담당 지사에 성함 및 연락처가 전달될 수 있음을 
알려드립니다.)

ο 마케팅 및 광고에 활용
이벤트 등 광고성 정보 전달, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계

■ 개인정보의 보유 및 이용기간
원칙적으로, 개인정보 수집 및 이용목적이 달성된 후(회원 탈퇴 등)에는 귀하의 개인정보를 
지체 없이 파기합니다. 단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 
같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.

계약 또는 청약철회 등에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률)
소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래등에서의 소비자보호에 관한 
법률)
</pre>
	  			<input type="checkbox" id="cb1" required="required">
	  			<label for="cb1" style="float:left;"></label><div  style="float:left; font-weight: initial; font-size: 13pt; color: black; margin-right: 5px;">개인정보수집 및 이용에 동의합니다.</div><div style="float:left; color: #009223; font-weight: bold; margin-left: 0px;">(필수)</div>
	  		</div>  	
	  		<div id="agree_2">
	  			<div>개인정보 위탁동의</div>
<pre>
개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가
취해지고 있는지 알려드립니다.

회사는 개인정보 취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 
공지할 것입니다.

ο 본 방침은 : 2018 년 1 월 31 일 부터 시행됩니다.

써브웨이인터내셔날 비브이는 (이하 '회사'는) 고객님의 개인정보 를 중요시하며, 
"정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다.
</pre>
	  			<input type="checkbox" id="cb2"  required="required">
	  			<label for="cb2" style="float:left;"></label><div style="float:left; font-weight: initial; font-size: 13pt; color: black;  margin-right: 5px;">개인정보 위탁에 동의합니다.</div><div style="float:left; color: #009223; font-weight: bold;  margin-left: 0px;">(필수)</div>
	  		</div>  		
  		</div>
  		<h2 style="margin-top: 70px; font-size: 24pt;">문의 작성하기</h2>
  		<form name="form1">
		    <input type="text" name="title" placeholder="제목을 입력해주세요">
		    <textarea name="content" placeholder="가맹점 신청과 관련된 문의사항을 작성해주세요."  style="resize: none;  height:300px; "></textarea>
	    </form>
	    <button onClick="regist()">취소</button>
	    <button onClick="regist()">보내기</button>
    </div>
    
  </div>
</div>

  <%@ include file="/includes/footer.jsp" %>

</body>
</html>