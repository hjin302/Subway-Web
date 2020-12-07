<%@ page contentType="text/html; charset=UTF-8"%>
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
<script>
function regist(){
   form1.method="post";
   form1.action="/notice/regist";
   form1.submit();
}
</script>
</head>
<body>

<h3>공지사항 등록</h3>

<div class="container">
  <form name="form1">
    <label for="title">제목</label>
    <input type="text" id="title" name="title" placeholder="제목">
   
    <label for="content">내용</label>
    <textarea id="content" name="content" placeholder="내용" style="height:200px"></textarea>
  </form>
    <button onClick="regist()">등록</button>
</div>
</body>
</html>