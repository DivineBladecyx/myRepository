<%--
  Created by IntelliJ IDEA.
  User: zheng
  Date: 2018/11/29
  Time: 18:39
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
    <title>单类订单信息</title>
</head>
<body>
<script language="JavaScript">
    function get_info(listinfoid) {
        window.open("show_list_info.jsp?listgetid=" + listinfoid, "订单详细信息",
            "height=450, width=800,top=200,left=400,toolbar=no,menubar=no, scrollbars=yes," +
            "resizable=yes, location=no, status=no");
    }
</script>
<div align="left">
    <table border="1" style="border-collapse: collapse">
        <caption>单类订单表</caption>
        <tr>
            <th>订单序号</th>
            <th>下单用户</th>
            <th>下单时间</th>
            <th>下单地址</th>
            <th>订单总价</th>
            <th>买家备注</th>
            <th>订单状态</th>
            <th>检测</th>
        </tr>
        <%
            String listcategoryget = request.getParameter("listcategoryget");
            System.out.print(listcategoryget);
            String sql = "select * from list where list_category=" + listcategoryget;
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
