
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
이름 : ${param.name}, ${param["name"]}, ${param['name']}<br/>
나이 : ${param.age+1}, ${param["age"]-1}, ${param['age']*2}<br/>
직업 : ${param.job}, ${param["job"]}, ${param['job']} <br/>
관심분야 :
    ${paramValues.favo[0]}
    ${paramValues.favo[1]}
    ${paramValues.favo[2]}
    ${paramValues.favo[3]}
<br/>


${header["user-agent"]}<br/>
${header['user-agent']}<br/>
${header.user-agent}<br/>
${param["한글"]}<br/>
${param['한글']}<br/>
<%--${param.한글}<br/>&ndash;%&gt;--%>
</body>
</html>
