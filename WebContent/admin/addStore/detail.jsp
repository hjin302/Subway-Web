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
var t = 0;
$(function(){
	//삭제
	$($("button")[0]).click(function(){
		del();
	});
	
	//목록
	$($("button")[1]).click(function(){
		location.href="/admin/addStore/list";
	});
	
	//답장
	$($("button")[2]).click(function(){
		reply("<%=addStore.getMember().getEmail_id()%>" + "<%=addStore.getMember().getEmail_domain()%>");
	});
	
});


//삭제 요청 product_id를 전송해야 한다!!
function del(){
	if(confirm("삭제하시겠습니까?")){
		$("form").attr({
			"action":"/admin/addStore/delete",
			"method":"post"
		});
		$("form").submit();
	}
}

function reply(emailAddr){
	
	if(t == 0){
		$(".reply").append("<div id='sendMail'><form id='sendForm'><input type='text' name='totitle'/><input type='text' name='tomail' value=' "+emailAddr+" '/><textarea name='tocontent'></textarea></form><button id='send'>전송</button></div>");
		t =1;
	}else if(t == 1){
		$("#sendMail").remove();
		t=0;
	}
	
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
	
}

</script>
</head>
<body>
<%@include file="/admin/inc/main_navi.jsp"%>

<div class="container">
  <form>
  	<input type="hidden" name="add_store_idx" value="<%=addStore.getAdd_store_idx()%>"/>
 
    <input type="text" name="title" value="<%=addStore.getTitle()%>">
    <input type="text" name="member.name" value="<%=addStore.getMember().getName()%>">
    <textarea name="content"><%=addStore.getContent()%></textarea>
  </form>
   <button>삭제</button>
   <button>목록</button>
   &nbsp;
   <button>답장</button>
</div>

<div class="reply"></div>

</body>
</html>






