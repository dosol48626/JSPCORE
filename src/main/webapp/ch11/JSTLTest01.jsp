<%@ page import="java.util.Date" %>
<%@ page import="membership.MemberDTO" %><%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-20
  Time: 오전 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:set var="directVar" value="100"/>
<c:set var="elVar" value="${directVar / 5}"/>
<c:set var="expVar" value="<%=new Date()%>" />
<c:set var="betweenVar">변수값을 여기에 설정</c:set>
<c:set var="dto" value="<%=new MemberDTO()%>" scope="request"/>
<c:set target="${dto}" property="id" value="abcd"/>
<c:set target="${dto}" property="pass" value="1234"/>
<c:set target="${dto}" property="name" value="홍길동"/>
<c:set target="${dto}" property="regidate" value="<%=new Date()%>"/>

<h3>MemberDTO 객체 활용</h3>
<ul>
  <li>name : ${dto.name}</li>
  <li>id : ${dto.id}</li>
  <li>pass : ${dto.pass}</li>
  <li>regidate : ${dto.regidate}</li>
</ul>
<h4>EL을 이용하여 변수 출력</h4>
<ul>
  <li>directVar : ${directVar}</li>
  <li>elVar : ${elVar}</li>
  <li>expVar : ${expVar}</li>
  <li>betweenVar : ${betweenVar}</li>
</ul>
<jsp:forward page="result.jsp"/>
</body>
</html>
