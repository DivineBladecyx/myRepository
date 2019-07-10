<%--
  Created by IntelliJ IDEA.
  User: LiChe
  Date: 2018/11/28
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息</title>
</head>
<body>
用户信息：
<%

    String user_id = (String) request.getAttribute("user_id");
    out.println("用户id：" + user_id + "<br>");

    String user_name = (String) request.getAttribute("user_name");
    if (user_name == null) {
        out.println("用户不存在！");
    } else {
        out.println("用户名：" + user_name + "<br>");
        String user_password = (String) request.getAttribute("user_password");
        out.println("用户密码：" + user_password + "<br>");
    }
%>
<a type="button" href="/jsp/manager/Manager.jsp">返回</a>
</body>
</html>
