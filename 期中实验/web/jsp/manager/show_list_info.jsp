<%--
  Created by IntelliJ IDEA.
  User: zheng
  Date: 2018/11/29
  Time: 17:38
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
    <title>订单详细信息表</title>
</head>
<body>
<div align="center">
    <table border="1" style="border-collapse: collapse">
        <caption>订单详细信息表</caption>
        <tr>
            <th>订单序号</th>
            <th>下单用户</th>
            <th>书籍标识符</th>
            <th>书籍名称</th>
            <th>书籍分类</th>
            <th>购买数量</th>
            <th>价格</th>
        </tr>
        <%
            String list_get_id = request.getParameter("listgetid");
            System.out.println(list_get_id);
        %>
        <%
            String sql = "select * from v_list_info where list_infor_id=" + Integer.valueOf(list_get_id);
            ResultSet rs = stat.executeQuery(sql);
            while (rs.next()) {
                String listinfoid = rs.getString("list_infor_id");
                String userid = rs.getString("user_id");
                String bookid = rs.getString("book_id");
                String bookname = rs.getString("book_name");
                String categoryname = rs.getString("category_name");
                String bookamount = rs.getString("book_amount");
                String bookprice = rs.getString("book_price");

        %>
        <tr>
            <td><%=listinfoid%>
            </td>
            <td><%=userid%>
            </td>
            <td><%=bookid%>
            </td>
            <td><%=bookname%>
            </td>
            <td><%=categoryname%>
            </td>
            <td><%=bookamount%>¥</td>
            <td><%=bookprice%>
            </td>
        </tr>
        <%
            }
            conn.close();
            stat.close();
        %>
    </table>
</div>
</body>
</html>
