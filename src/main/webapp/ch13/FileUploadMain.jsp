<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <script>
    function validateForm(form){
      if(form.title==""){
        alert("제목을 입력하세요");
        form.title.focus();
        return false;
      }
      if(form.ofile==""){
        alert("첨부파일을 선택하세요");
        form.ofile.focus();
        return false;
      }
    }
  </script>
</head>
<body>
<h2>파일 업로드</h2>
<span style="color: red;">${errorMessage}</span>

<form method="post" action="/fileupload/Upload.do" onsubmit="return validateForm(this)"
      enctype="multipart/form-data">
  제목 : <input type="text" name="title"><br/>
  카테고리 :
  <input type="checkbox" name="cate" value="사진"/>사진
  <input type="checkbox" name="cate" value="과제"/>과제
  <input type="checkbox" name="cate" value="워드"/>워드
  <input type="checkbox" name="cate" value="음원"/>음원<br/>
  <input type="file" name="ofile"/><br/>
  <input type="submit" value="전송하기"><br/>
</form>

</body>
</html>
