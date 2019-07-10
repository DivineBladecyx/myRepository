<%@ page import="java.util.List" %>
<%@ page import="midterm.User" %>
<%@ page import="midterm.Book" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="DaoVo.bookDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DaoVo.bookVo" %><%--
  Created by IntelliJ IDEA.
  User: 11501
  Date: 2018/11/23
  Time: 13:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车</title>
</head>
<body>
<form action="/AddToList" method="get">
    <b style="color: yellow">用户</b>
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
    <%
            }
        }
    %>
    <hr color="green" size="3em">
    <%
        User user = (User) se.getAttribute("user");
        out.println("您购物车中有以下书籍：");
    %>
    <BR>
    <%
        double sumprice = 0;
        if (user != null) {
            if (user.car.size() != 0) {
                int[] bookamount = new int[user.car.size()];
                for (int i = 0; i < user.car.size(); i++) {
                    bookamount[i] = 1;
                }
                for (int i = 0; i < user.car.size(); i++) {
                    for (int j = i + 1; j < user.car.size(); j++) {
                        if (user.car.get(j).equals(user.car.get(i))) {
                            bookamount[i]++;
                        }
                    }
                }

                for (int i = 0; i < user.car.size(); i++) {
                    boolean outs = true;
                    int price = 0;
                    try {
                        bookDao book = new bookDao();
                        ArrayList Books = book.queryAllBooks();
                        for (int j = 0; j < Books.size(); j++) {
                            bookVo bookvo = (bookVo) Books.get(j);
                            String book_name = bookvo.getName();
                            if (book_name.equals(user.car.get(i))) {
                                price = Integer.valueOf(bookvo.getPrice());
                                sumprice = price + sumprice;
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    for (int m = 0; m < i; m++) {
                        if (user.car.get(m).equals(user.car.get(i))) {
                            outs = false;
                            // out.print("ssss");
                            break;
                        }
                    }
                    if (outs) {
                        out.println(user.car.get(i) + "  单价：" + price + "元" + "   数量：" + bookamount[i] + "本");
    %>
    <a type="button" href="/removalbook?bookname=<%=user.car.get(i)%>">移除</a>
    <br>

    <%
                    }
                }
                out.println("总价：" + sumprice + "元");
                se.setAttribute("sumprice", sumprice);
            } else {
                out.println("购物车是空的");
            }
        } else {
            out.println("您还未登录！");
        }
    %>
    <br>
    <%if (sumprice != 0) {%>

    <input type="submit" value="提交订单">
    <input type="button" onclick="returnHomePage()" value="返回主页">
    <%
        if (user != null) {
    %>
    <input type="button" value="查看订单" onclick="gotopay()">
    <%
        }
    } else {
        if (user != null) {
    %>
    <input type="button" value="查看订单" onclick="gotopay()">
    <%
        }
    %>
    <input type="button" onclick="returnHomePage()" value="返回主页">
</form>
<%
    }
%>
<script language="JavaScript">
    function returnHomePage() {
        window.location.replace("../HomePage.jsp");
    }

    function gotopay() {
        window.location.replace("/jsp/user/pay.jsp");
    }
</script>

</body>
</html>
