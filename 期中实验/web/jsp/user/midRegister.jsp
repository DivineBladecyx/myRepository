<%--
  Created by IntelliJ IDEA.
  User: 11501
  Date: 2018/11/28
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>提示</title>
</head>
<body>
<%
    HttpSession se = request.getSession(false);
    String register = (String) se.getAttribute("register");
%>
<script>
    var register = '<%=register%>';
    if (register == "false") {
        alert("用户名已存在！请重新注册！");
        window.location.replace("../HomePage.jsp");
    }
    else if (register == "true") {
        alert("注册成功！请登录");
        window.location.replace("../HomePage.jsp");
    }
</script>
</body>
</html>
