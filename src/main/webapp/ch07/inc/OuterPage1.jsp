<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
        String newValue1="고구려 세운 동명황";
%>
page 영역 변수 :<%=pageContext.getAttribute("pAttr")%><br/>
request 영역 변수 : <%=request.getAttribute("rAttr")%><br/>
</body>
</html>
