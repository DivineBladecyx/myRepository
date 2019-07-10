<%@ page import="midterm.Manager" %><%--
  Created by IntelliJ IDEA.
  User: 11501
  Date: 2018/11/25
  Time: 9:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员界面</title>
</head>
<body>
管理员：
<%
    HttpSession se = request.getSession(false);
    if (se == null) {
        System.out.println("session is invalidate!");
    } else {
        Manager manager = (Manager) se.getAttribute("manager");
        if (manager != null) {
            out.print(manager.ShowID());
            out.print("在线");
        } else {
            out.print("离线");
        }
    }
%>
<form action="/UserAndManagerCancel" method="post">
    <input type="button" value="查看用户订单" onclick="location.href='List_Query.jsp'">
    <input type="button" value="用户查询" onclick="location.href='userFind.jsp'">
    <input type="button" value="书籍管理" onclick="location.href='AddBook.jsp'">
</form>
<form action="/UserAndManagerCancel" method="post">
    <input type="submit" value="注销账号" onclick="exit()">
</form>
<hr color="green" size="3em">
<input type="button" onclick="returnHomePage()" value="返回主页">
<script language="JavaScript">
    function returnHomePage() {
        window.location.replace("../HomePage.jsp");
    }

    function exit() {
        alert("注销成功！")
    }
</script>
</body>
</html>
