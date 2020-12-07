<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Subway</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
	height: 800px;
	background-color: #f7f7f7;
	text-align: center;
}

#loginPage{
	width : 630px;
	height : 640px;
	font-family: NanumSquareWeb, sans-serif;
	display:inline-block;
	margin-top:40px;
	margin-bottom:60px;
	background-color: white;
	border: 1px solid lightgray;
}

p{
	color: gray;
	line-height: 25px;
}

input[type=text], input[type=password]{
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
  margin-bottom : 20px;
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

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function() {
		//로그인 버튼 누르면...
		$("#bt_login").on("click", function() {
			$.ajax({
				"url" : "/member/login",
				"type" : "post",
				"data" : {
					"id" : $("input[name='id']").val(),
					"password" : $("input[name='password']").val()
				},
				success : function(result) {
					console.log(result.code);
					//성공한 경우
					if (result.code == undefined) {
						alert(result.id + "님 안녕하세요");
						location.href = "/";
					} else { //실패한 경우
						alert(result.msg);
					}

				}
			});
		});
	});
</script>
</head>
<body>
	<%@ include file="/includes/header.jsp"%>
	<div id="content">
		<div id="loginPage" >
			<form>
				<h1 style="text-align: center; font-size: 30pt; margin-top: 80px;">LOGIN</h1>
				<p>써브웨이 회원으로 로그인하시면 제공하는 </br> 다양한 서비스를 이용할 수 있습니다.</p>
				<input type="text" name="id" placeholder="아이디 입력" required>
				<input type="password" name="password" placeholder="비밀번호 입력" required> 
				<div><input type="button" id="bt_login" value="로그인" ></div>
		
			</form>
			<div id="signUp">
				<a href="/member/regist.jsp" class="btn" style="color: gray; text-decoration: underline;">회원가입</a>				
			</div>
		</div>
	</div>


			
	<%@ include file="/includes/footer.jsp"%>
</body>
</html>