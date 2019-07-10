<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.lang.String" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="midterm.User" %><%--
  Created by IntelliJ IDEA.
  User: 11501
  Date: 2018/11/19
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="/css/homepage.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>主页</title>
</head>
<body style="background-image: url(/images/bg3.jpg);background-repeat:no-repeat;background-size: cover">
<button style="text-align: right" type="button" onclick="ManagerLogin()">管理员登录</button>
<h1 align="center" style="color: black">书籍列表</h1>
<%
    //将已登录的账号直接显示在页面上

    HttpSession se = request.getSession(false);
    String login = (String) se.getAttribute("login");

    if (se == null) {
        System.out.println("session is invalidate!");
    } else {
        User user = (User) se.getAttribute("user");
        if (user != null) {
%>
<B style="color: orange"><%=user.ShowID()%>
</B>
<B style="color: yellow">在线</B>
<%
} else {
%>
<B style="color: red">离线</B>
<div align="left">
    <button value="用户登录" onclick="UserLogin()"><img src="/images/login.png"></button>
    <button type="button" value="用户注册" onclick="UserRegister()"><img src="/images/register.png"></button>
    <br>
</div>
<%
        }
    }
%>
<div align="right">
    <form action="/UserAndManagerCancel" method="post">
        <button type="submit" value="注销账号" onclick="exit()"><img src="/images/logout.png"></button>
        <button type="button" value="购物车" onclick="car()"><img src="/images/car.png"></button>
    </form>
</div>
<div id="cover">

</div>
<div id="styleregister">
    <h3 align="center">用户注册</h3>
    <div align="center">
        <form action="/UserReAndLog" method="get">
            <div align="left"><b>用户名:</b></div>
            <div align="left">
                <input size="55%" type="text" name="userid"><br>
            </div>
            <div align="left"><b>密码:</b></div>
            <div align="left">
                <input size="55%" type="password" name="userpassword"><br>
            </div>
            <div align="left"><b>昵称:</b></div>
            <div align="left">
                <input size="55%" type="text" align="center" name="username">
            </div>
            <br>
            <div align="left">
                <input type="submit" value="注册">
            </div>
            <div align="right">
                <input type="button" value="返回" onclick="returnmain()">
            </div>
        </form>
    </div>
</div>
<div id="stylelogin1">
    <h3 align="center">用户登录</h3>
    <div align="center">
        <form action="/UserReAndLog" method="post">
            <div align="left"><b>用户名:</b></div>
            <div align="left">
                <input size="55%" type="text" name="userid"><br>
            </div>
            <div align="left"><b>密码:</b></div>
            <div align="left">
                <input size="55%" type="password" name="userpassword"><br>
            </div>
            <br>
            <div align="left">
                <input type="submit" value="登录">
            </div>
            <div align="right">
                <input type="button" value="返回" onclick="returnmain()">
            </div>
        </form>
    </div>
</div>
<div id="stylelogin2">
    <h3 align="center">管理员登录</h3>
    <div align="center">
        <form action="/ManagerLog" method="post">
            <div align="left"><b>用户名:</b></div>
            <div align="left">
                <input size="55%" type="text" name="managerid"><br>
            </div>
            <div align="left"><b>密码:</b></div>
            <div align="left">
                <input size="55%" type="password" name="managerpassword"><br>
            </div>
            <br>
            <div align="left">
                <input type="submit" value="登录">
            </div>
            <div align="right">
                <input type="button" value="返回" onclick="returnmain()">
            </div>
        </form>
    </div>
</div>
<hr color="white" size="1em">
<table>
    <tr>
        <td class="bt"><a class="a6" href="/jsp/user/category.jsp?categoryname=<%="文学类"%>" target="iframe1">文学类 |</a>
        </td>
        <td class="bt"><a class="a6" href="/jsp/user/category.jsp?categoryname=<%="历史类"%>" target="iframe1">历史类 |</a>
        </td>
        <td class="bt"><a class="a6" href="/jsp/user/category.jsp?categoryname=<%="自然科学类"%>" target="iframe1">自然科学类
            |</a></td>
        <td class="bt"><a class="a6" href="/jsp/user/category.jsp?categoryname=<%="哲学类"%>" target="iframe1">哲学类 |</a>
        </td>
        <td class="bt"><a class="a6" href="/jsp/user/category.jsp?categoryname=<%="教育类"%>" target="iframe1">教育类 </a>
        </td>
        <br>
    </tr>
</table>
<div style="position: absolute;top:40%">
    <iframe src="/jsp/user/category.jsp?categoryname=<%="文学类"%>" name="iframe1" width="400" height="400"
            frameborder="1">请选择书籍种类
    </iframe>
</div>
<div style="position: absolute;top:30%;left:30%;">
    <iframe src="/jsp/user/instruct.jsp?name=<%="百年孤独"%>" name="iframe2" width="1000" height="500" frameborder="0">
        书籍详情
    </iframe>
</div>
<script src="/js/homepage.js"></script>
</body>
</html>