<%@page import="com.shop.domain.Notice"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   Notice notice = (Notice)request.getAttribute("notice");   
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
		//수정
	   $($("button")[0]).click(function(){
	      edit();
	   });
	   //삭제
	   
	   $($("button")[1]).click(function(){
	      del();
	   });
	   
	   //목록
	   $($("button")[2]).click(function(){
	      location.href="/admin/notice/list";
	   });
	   
	   function edit(){
		   $("form").attr({
		      "action":"/admin/notice/edit",
		      "enctype":"multipart/form-data",
		      "method":"post"
		   });
		   $("form").submit();
		}
	   
	   function del(){
		   if(confirm("삭제하시겠습니까?")){
		      $("form").attr({
		         "action":"/admin/notice/delete",
		         "method":"post"
		      });
		      $("form").submit();
		   }
		}
	});
</script>
</head>
<body>
<%@include file="/admin/inc/main_navi.jsp"%>

<div class="container">
  <form>
     <input type="hidden" name="notice_idx" value="<%=notice.getNotice_idx()%>"/>
    <input type="text" name="title" value="<%=notice.getTitle()%>">
    <input type="text" name="content" value="<%=notice.getContent()%>">
  </form>
  <button>수정</button>
  <button>삭제</button>
  <button>목록</button>
</div>

</body>
</html>





