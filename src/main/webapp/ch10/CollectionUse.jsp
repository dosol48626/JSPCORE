<%@ page import="membership.MemberDTO" %>
<%@ page import="java.util.*" %><%--
    CollectionUse.jsp
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-19
  Time: 오후 4:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Object> aList = new ArrayList<>();
    aList.add("홍길동");
    aList.add(10);
    MemberDTO dto = new MemberDTO();
    dto.setId("a124");
    dto.setPass("1234");
    dto.setName("홍길동");
    dto.setRegidate(new Date());
    aList.add(dto);
    pageContext.setAttribute("aList", aList);
    Map<String, Object> maps=new HashMap<>();
    maps.put("요소1","홍길동");
    maps.put("요소2", 10);
    maps.put("요소3", dto);
    pageContext.setAttribute("maps",maps);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>HashMap Collection 사용</h2>
<ul>
    <li>요소1 : ${maps.get("요소1")}</li>
    <li>요소2 : ${maps.get("요소2")}</li>
    <li>요소3 : ${maps.get("요소3")}</li>
</ul>
<h2>ArrayList Collection 사용</h2>
<ul>
    <li>0번째 요소 : ${aList[0]}</li>
    <li>1번째 요소 : ${aList[1]}</li>
    <li>2번째 요소 : ${aList[2]}</li>
</ul>

</body>
</html>
