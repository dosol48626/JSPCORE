<%--
  Created by IntelliJ IDEA.
  User: dosol
  Date: 2024-10-03
  Time: 오전 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="common.Person" %>
<%
  // 오타 수정: setAttibute -> setAttribute
  pageContext.setAttribute("pageInteger", 1000);
  pageContext.setAttribute("pageString", "페이지 영역의 문자열");
  pageContext.setAttribute("pagePerson", new Person("seo", 99));
%>
<html>
<head>
  <title>Title</title>
</head>
<body>
<h4>Include Page</h4>
<%
  // pageContext에서 객체 가져오기
  int pInteger2 = (Integer)(pageContext.getAttribute("pageInteger"));
  Person person = (Person)(pageContext.getAttribute("pagePerson"));
%>
<ul>
  <li>Integer : <%=pInteger2%></li>
  <li>String : <%=pageContext.getAttribute("pageString")%></li>
  <!-- 변수 이름 일관성 유지: person.getName()과 person.getAge() 사용 -->
  <li>Person : <%=person.getName()%>, <%=person.getAge()%></li>
</ul>
</body>
</html>
