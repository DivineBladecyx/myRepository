<%@ page import="midterm.User" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DaoVo.bookDao" %>
<%@ page import="DaoVo.bookVo" %><%--
  Created by IntelliJ IDEA.
  User: cjy
  Date: 2018/11/28
  Time: 22:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍简介</title>
</head>
<body>
<%

    HttpSession se = request.getSession(false);
    User user = null;
    if (se == null) {
        System.out.println("session is invalidate!");
    } else {
        user = (User) se.getAttribute("user");
    }
    String bookname = request.getParameter("name");
    bookDao book = new bookDao();
    ArrayList Books = book.queryAllBooks();
    for (int i = 0; i < Books.size(); i++) {
        bookVo bookvo = (bookVo) Books.get(i);
        String name = bookvo.getName();
        if (bookname.equals(name)) {

            String number = bookvo.getNumber();
            String category = bookvo.getCategory();
            String categoryname = bookvo.getCategoryname();
            String price = bookvo.getPrice();
            String comments = bookvo.getComments();
            String introduction = bookvo.getIntroduction();
            out.println("书名:" + name + "  ");
%>
<div style="font-family: 楷体">
    <%=introduction%>
</div>
<%
        }
    }
%>
<hr color="white" size="1em">
<img src="/images/<%=bookname%>.jpg" width=200 height=200>
<%
    if (user != null) {
%>
<td><a href="/AddToCar?name=<%=bookname%>" role="button" onclick="tip()"><img src="/images/car.png"></a></td>
<%
} else {
%>
<td><a class="a1" href="" type="button" onclick="tip2()"><img src="/images/car.png"></a></td>
<%
    }
%>
<hr color="white" size="1em">
<script>
    function tip() {
        alert('加入购物车成功！');
    }

    function tip2() {
        alert('请登陆后加入购物车！');
    }
</script>
</body>
</html>
