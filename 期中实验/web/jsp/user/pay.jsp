<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="midterm.User" %><%--
  Created by IntelliJ IDEA.
  User: 11501
  Date: 2018/12/5
  Time: 20:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>支付页面</title>
</head>
<body>
<script language="JavaScript">
    function get_info(listinfoid) {
        window.open("/jsp/manager/show_list_info.jsp?listgetid=" + listinfoid, "订单详细信息",
            "height=450, width=800,top=200,left=400,toolbar=no,menubar=no, scrollbars=yes," +
            "resizable=yes, location=no, status=no");
    }
</script>
<b style="color: yellow">用户</b>
<%
    //将已登录的账号直接显示在页面上

    HttpSession se = request.getSession(false);
    String login = (String) se.getAttribute("login");
    User user = (User) se.getAttribute("user");
    if (se == null) {
        System.out.println("session is invalidate!");
    } else {
        user = (User) se.getAttribute("user");
        if (user != null) {
%>
<B style="color: orange"><%=user.ShowID()%>
</B>
<B style="color: yellow">在线</B>
<%
} else {
%>
<B style="color: red">离线</B>
<%
        }
    }
%>
<hr color="blue" size="2em">
<div align="right" style="position: absolute;top: 10%;left: 50%">
    <table border="3" style="border-collapse: collapse">
        <caption>总订单表</caption>
        <tr>
            <th>订单序号</th>
            <th>下单用户</th>
            <th>下单时间</th>
            <th>下单地址</th>
            <th>订单总价</th>
            <th>买家备注</th>
            <th>订单状态</th>
            <th>检测</th>
            <th>支付</th>
        </tr>
        <%
            String url = "jdbc:mysql://localhost:3306/bookbase?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8&useSSL=false";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, "root", "cyx007");
            Statement stat = conn.createStatement();
            int userid = Integer.valueOf(user.ShowID());
            String sql = "select * from list where list_user_id=" + userid;
            ResultSet rs = stat.executeQuery(sql);
            while (rs.next()) {
                String listid = rs.getString("list_id");
                String listuserid = rs.getString("list_user_id");
                String listinfoid = rs.getString("list_infor_id");
                String listtime = rs.getString("list_time");
                String listaddress = rs.getString("list_address");
                String listtotalprice = rs.getString("list_totalprice");
                String comments = rs.getString("list_comments");
                String listcategory = rs.getString("list_category");
        %>
        <tr>
            <td><%=listid%>
            </td>
            <td><%=listuserid%>
            </td>
            <td><%=listtime%>
            </td>
            <td><%=listaddress%>
            </td>
            <td><%=listtotalprice%>¥</td>
            <td><%=comments%>
            </td>
            <td><%=listcategory%>
            </td>
            <td>
                <input type="submit" value="显示详情" onclick="get_info(<%=listinfoid%>)">
            </td>
            <td>
                <a type="button" onclick="ale()" href="behindpay.jsp?listid=<%=listid%>">支付</a>
            </td>
        </tr>
        <%
            }
            conn.close();
            stat.close();
        %>
    </table>
</div>
<form action="/jsp/HomePage.jsp" method="post">
    <input type="submit" value="返回主页面">
</form>
<script>
    function ale() {
        alert('支付成功！');
    }
</script>
</body>
</html>
