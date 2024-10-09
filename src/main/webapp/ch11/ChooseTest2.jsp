<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-20
  Time: 오전 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>Title</title>
  </head>
  <body>
  <h3>국.영.수 점수를 입력하면 평균을 내어 학점 출력</h3>
  <form>
    국어:<input type="text" name="kor"><br/>
    영어:<input type="text" name="eng"><br/>
    수학:<input type="text" name="math"><br/>
    <input type="submit" value="학점구하기">
  </form>
  <c:if test="${not(empty param.kor or empty param.eng or empty param.math)}">
    <c:set var="avg" value="${(param.kor+param.eng+param.math)/3}"/>
    평균점수는 ${avg}으로
    <c:choose>
      <c:when test="${avg>=90}">A학점</c:when>
      <c:when test="${avg>=80}">B학점</c:when>
      <c:when test="${avg ge 70}">C학점</c:when>
      <c:when test="${avg ge 60}">D학점</c:when>
      <c:otherwise>F학점</c:otherwise>
    </c:choose>
    입니다.<br/>
  </c:if>
  </body>
</html>
