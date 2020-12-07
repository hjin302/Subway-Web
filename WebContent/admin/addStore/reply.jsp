<%@page import="com.shop.domain.AddStore"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	AddStore addStore = (AddStore)request.getAttribute("addStore");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Subway_Admin</title>
<link rel="stylesheet" href="/css/admin.css"/>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

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
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	//답장 전송!
	$("#send").click(function(){
		if(confirm("메일을 보내시겠습니까?")){
			$("#sendForm").attr({
				"action":"/mail/mailSending",
				"method":"post"
			});
			$("#sendForm").submit();
		}
	});
});


</script>
</head>
<body>
<%@include file="/admin/inc/main_navi.jsp"%>

<div id="sendMail">
	<form id="sendForm">
		<input type="text" name="totitle"/>
		<input type="text" name="tomail" value="<%= addStore.getMember().getEmail_id() + addStore.getMember().getEmail_domain()%>  "/>
		<textarea name="tomail"></textarea>
	</form>
	<button id="send">전송</button>
</div>


</body>
</html>






