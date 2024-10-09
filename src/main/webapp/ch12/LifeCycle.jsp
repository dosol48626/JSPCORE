<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-23
  Time: 오전 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script>
  function requestAction(frm, met){
    if(met==1){
      alert("aaaaaaaaaa")
      frm.method='get';
    }else{
      alert("bbbbbbbbbbbbbb")
      frm.method="post";
    }
    frm.submit();
  }
</script>
<h2>서블릿 수명주기(Life Cycle)메서드</h2>
<form action="/servlet/LifeCycle.do" method="post">
  <input type="submit" value="전송">
<%--  <input type="button" value="Get 방식 요청하기" onclick="requestAction(this.form, 1);"/>--%>
  <input type="button" value="Post 방식 요청하기" onclick="requestAction(this.form, 2);"/>
</form>
</body>
</html>
