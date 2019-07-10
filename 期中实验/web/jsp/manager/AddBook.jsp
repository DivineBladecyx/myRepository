<%--
  Created by IntelliJ IDEA.
  User: zheng
  Date: 2018/11/28
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    String url = "jdbc:mysql://localhost:3306/bookbase?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8&useSSL=false";
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(url, "root", "cyx007");
    Statement stat = conn.createStatement();
%>
<html>
<head>
    <title>后台书籍管理</title>
    <link href="/css/addbook.css" rel="stylesheet">
</head>
<body>
<h3 align="center">欢迎来到后台书籍管理界面</h3>
<hr size="3" color="#FFAABB">
<input type="button" onclick="bookLogin()" value="录入书籍">
<input type="button" onclick="bookRemoval()" value="删除书籍">
<input type="button" onclick="returnManager()" value="返回管理员界面">
<div id="stylebook">
    <form action="/addbooktodb" ; method="get">
        请输入书籍序号：<input name="booknumber" type="text">(不填自动添加）<br>
        请输入书籍名称：<input name="bookname" type="text"><br>
        请输入书籍分类：
        <select name="bookcategory">
            <%
                String sql1 = "select * from category ";
                ResultSet rs1 = stat.executeQuery(sql1);
                while (rs1.next()) {
                    String categorynumber = rs1.getString("category_number");
                    String categoryname = rs1.getString("category_name");
            %>
            <option value="<%=categorynumber%>"><%=categoryname%>
            </option>
            <%
                }
            %>
        </select><br>
        请输入书籍价格：<input name="bookprice" type="text"><br>
        请输入书籍信息：<input name="comments" type="text"><br>
        请输入书籍简介：<input name="introduction" type="text"><br>
        <input type="submit" value="录入" onclick="book_action()">
        <input align="right" type="button" onclick="returnAddBook()" value="返回">
    </form>
</div>
<div id="stylebookremoval">
    <form action="/deletebook" ; method="get">
        请输入需要删除的书籍序号：<input name="booknumber" type="text"><br>
        <input type="submit" value="删除" onclick="book_action()">
        <input align="right" type="button" onclick="returnAddBook()" value="返回">
    </form>
</div>
<div style="position: absolute;top: 20%;left: 10%;">
    <table border="3" style="border-color: green;">
        <caption>书籍信息表</caption>
        <tr>
            <th>书籍序号</th>
            <th>书籍名称</th>
            <th>书籍分类</th>
            <th>分类名称</th>
            <th>书籍价格</th>
            <th>书籍信息</th>
        </tr>
        <%

            String sql = "select * from book ";
            ResultSet rs = stat.executeQuery(sql);
            while (rs.next()) {
                String booknumber = String.valueOf(rs.getInt("book_number"));
                String bookname = rs.getString("book_name");
                String bookcategory = String.valueOf(rs.getInt("book_category"));
                String catagoryname = rs.getString("category_name");
                String bookprice = rs.getString("book_price");
                String comments = rs.getString("comments");

        %>
        <tr>
            <td><%=booknumber%>
            </td>
            <td><%=bookname%>
            </td>
            <td><%=bookcategory%>
            </td>
            <td><%=catagoryname%>
            </td>
            <td><%=bookprice%>¥</td>
            <td><%=comments%>
            </td>
        </tr>
        <%
            }
            conn.close();
            stat.close();
        %>
    </table>
</div>

<script src="/js/addbook.js"></script>

</body>
</html>
