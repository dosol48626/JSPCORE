<%@ page import="membership.MemberDTO" %><%--
  file name : UseBeanMain.jsp
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-13
  Time: 오후 2:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>useBean 액션태그</h2>
<h3>자바빈즈 생성</h3>
<%
    MemberDTO member1=new MemberDTO();
    member1.setId("a1234");
    member1.setPass("1234");
    member1.setName("홍홍홍");
    request.setAttribute("member",member1);
%>
<jsp:useBean id="member" class="membership.MemberDTO" scope="request" />
<h3>setProperty 액션 태그로 자바빈즈에 속성값 설정</h3>

<jsp:setProperty name="member" property="id" value="kkk"/>
<jsp:setProperty name="member" property="pass" value="1234"/>
<jsp:setProperty name="member" property="name" value="윤요섭"/>

<h3>getProperty 액션 태그로 자바빈즈 속성 읽어 오기</h3>
<ul>
    <li>id:<jsp:getProperty name="member" property="id"/></li>
    <li>pass:<jsp:getProperty name="member" property="pass"/></li>
    <li>name:<jsp:getProperty name="member" property="name"/></li>
</ul>
<ul>
    <li>id:<%=member.getId()%></li>
    <li>pass:<%=member.getPass()%></li>
    <li>name:<%=member.getName()%></li>
</ul>
<ul>
    <li>id:<%=member1.getId()%></li>
    <li>pass:<%=member1.getPass()%></li>
    <li>name:<%=member1.getName()%></li>
</ul>
</body>
</html>








