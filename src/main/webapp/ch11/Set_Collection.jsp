<%@ page import="membership.MemberDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
Set_Collection.jsp
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-20
  Time: 오전 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    ArrayList<Object> pList=new ArrayList<>();
    MemberDTO dto=new MemberDTO();
    dto.setName("홍길동");
    dto.setId("abcd");
    dto.setPass("1234");
    dto.setRegidate(new Date());
    pList.add(10);
    pList.add("jsp");
    pList.add(dto);

    Map<String, Object> maps=new HashMap<>();
    maps.put("stringData","java");
    maps.put("dateData",new Date());
    maps.put("intData",10);
    maps.put("objData",dto);
%>
<c:set var="pList" value="<%=pList%>" scope="request"/>
<c:set var="maps" value="<%=maps%>" scope="request"/>
<h3>ArrayList 변수</h3>
<ul>
    <li>${requestScope.pList[0]}</li>
    <li>${pList[1]}</li>
    <li>${pList[2]}</li>
</ul>
<h3>HashMap 변수</h3>
<ul>
    <li>${maps.get("stringData")}</li>
    <li>${maps.get("dateData")}</li>
    <li>${maps.get("intData")}</li>
    <li>${maps.get("objData")}</li>
</ul>
<c:remove var="maps" scope="request"/>
<h2>Remove 후</h2>
<h3>ArrayList 변수</h3>
<ul>
    <li>${requestScope.pList[0]}</li>
    <li>${pList[1]}</li>
    <li>${pList[2]}</li>
</ul>
<h3>HashMap 변수</h3>
<ul>
    <li>${maps.get("stringData")}</li>
    <li>${maps.get("dateData")}</li>
    <li>${maps.get("intData")}</li>
    <li>${maps.get("objData")}</li>
</ul>
</body>
</html>
