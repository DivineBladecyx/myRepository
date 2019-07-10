<%@ page import="midterm.User" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DaoVo.bookDao" %>
<%@ page import="DaoVo.bookVo" %>
<%--
  Created by IntelliJ IDEA.
  User: 11501
  Date: 2018/11/19
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="/css/category.css" rel="stylesheet">
    <title>历史类书籍</title>
</head>
<body>
<%
    String categoryname = request.getParameter("categoryname");
    bookDao book = new bookDao();
    ArrayList Books = book.queryAllBooks();
    HttpSession se = request.getSession(false);
    User user = null;
    if (se == null) {
        System.out.println("session is invalidate!");
    } else {
        user = (User) se.getAttribute("user");
    }
%>
<div>
    <table style="border-collapse:separate; border-spacing:50px 15px;">
        <%
            for (int i = 0; i < Books.size(); i++) {
                bookVo bookvo = (bookVo) Books.get(i);
                String name = bookvo.getName();
                String number = bookvo.getNumber();
                if (bookvo.getCategoryname().equals(categoryname)) {
        %>
        <tr>
            <td style="color: black;font-family: 楷体; font-size: 20px"><%=name%>
            </td>
            <td><a class="a1" href="instruct.jsp?name=<%=name%>" role="button" target="iframe2">详情</a></td>
                <%
    }
    }
%>

    </table>
</div>
</body>
</html>
