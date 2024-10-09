
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
  //포함할 페이지 경로
  String outerPath1="./inc/OuterPage1.jsp";
  String outerPage2="./inc/OuterPage2.jsp";

  //page 영역과 request 영역 속성 저장
  pageContext.setAttribute("pAttr","동명왕");
  request.setAttribute("rAttr","온조왕");
%>
<html>
  <head>
    <title>Title</title>
  </head>
  <body>
  <h2>지시어오 액션태그 동작 방식 이해</h2>
  <h3>지시어로 페이지 포함하기</h3>
  <%@include file="./inc/OuterPage1.jsp"%>
<%--  <%@include file="<%=outerPath1%>" %>--%>
  <p>외부에서 선언한 변수1:<%=newValue1%></p>

  <h3>액션태그로 페이지 포함하기</h3>
  <%--<jsp:include page="inc/OuterPage2.jsp" />--%>
  <jsp:include page="<%=outerPage2 %>" />
  <%--<p>외부에서 선언한 변수 2: <%=newValue2%></p>--%>
  </body>
</html>






