<%--
  InputForm.jsp
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-19
  Time: 오후 2:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>EL Test Form</h2>
<form action="ELResult.jsp" method="post">
  이름 : <input type="text" name="name"><br/>
  나이 : <input type="text" name="age"><br/>
  직업 :
  <select name="job">
    <option value="회사원" selected>회사원</option>
    <option value="군인">군인</option>
    <option value="공무원">공무원</option>
  </select><br/>
  관심분야 :
  <input type="checkbox" name="favo" value="정치" checked> 정치
  <input type="checkbox" name="favo" value="경제"> 경제
  <input type="checkbox" name="favo" value="스포츠">스프츠
  <input type="checkbox" name="favo" value="IT"> It <br/>
  <input type="text" name="한글"><br/>
  <input type="submit" value="전송">
</form>
</body>
</html>
