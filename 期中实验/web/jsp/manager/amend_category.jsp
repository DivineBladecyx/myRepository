<%--
  Created by IntelliJ IDEA.
  User: LiChe
  Date: 2018/11/28
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.lang.String" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>修改用户订单</title>
</head>
<body>
<%
    String id = request.getParameter("listid");
    System.out.print(id);
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookbase?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8&useSSL=false", "root", "cyx007");

        Statement stat = conn.createStatement();
        String sql = "select list_category from list where list_id=" + id;
        ResultSet rs = stat.executeQuery(sql);
        String category_name = "";
        while (rs.next()) {
            category_name = rs.getString("list_category");
        }
        rs.close();
        if (category_name.equals("0")) {
            String sql0 = "update list set list_category='1' where list_id=" + id;
            stat.execute(sql0);
            stat.close();
%>

<script>
    window.alert("已经完成修改！");
    window.close();
</script>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>
