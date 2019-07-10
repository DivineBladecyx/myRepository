<%--
  Created by IntelliJ IDEA.
  User: LiChe
  Date: 2018/11/28
  Time: 23:15
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
    <title>订单状态查询</title>
</head>
<body>

<form>
    请输入订单号：<input type="text" name="list_id">
    <input type="submit" value="查询">
</form>
<%
    String id = request.getParameter("list_id");
    //System.out.print(id);
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
%>
<div>
    <b>订单号：<%=id%>
    </b><br>
    <b>状态：未付款</b><br>
</div>
<a type="button" href="amend_category.jsp?listid=<%=id%>">修改状态</a>
<a type="button" href="Manager.jsp">返回</a>
<%
} else if (category_name.equals("1")) {

%>
<div>
    <b>订单号：<%=id%>
    </b><br>
    <b>状态：已付款</b><br>
</div>
<a href="Manager.jsp"><input type="submit" value="返回管理员界面"></a>

<%
} else if (!category_name.equals("") && !category_name.equals("1") && !category_name.equals("0")) {
%>
<script>
    window.alert("订单不存在");
</script>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>
