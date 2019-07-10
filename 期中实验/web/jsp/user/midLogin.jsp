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
    String login = (String) se.getAttribute("login");
    String register = (String) se.getAttribute("register");
%>
<script>

    var login = '<%=login%>';
    if (login == "false") {
        alert("用户名或密码错误！请重新登录！");
        window.location.replace("../HomePage.jsp");
    }
    else if (login == "true") {
        alert("登陆成功！");
        window.location.replace("../HomePage.jsp");
    }
</script>
</body>
</html>
