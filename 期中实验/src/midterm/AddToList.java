package midterm;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Random;


public class AddToList extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession se = request.getSession(false);
        User user = (User) se.getAttribute("user");
        PrintWriter out = response.getWriter();

        if (user != null) {
            int list_infor_id = 0;
            if (user.car.size() != 0) {
                int[] bookamount = new int[user.car.size()];
                for (int m = 0; m < user.car.size(); m++) {
                    bookamount[m] = 1;
                }
                for (int i = 0; i < user.car.size(); i++) {
                    for (int j = i + 1; j < user.car.size(); j++) {
                        if (user.car.get(j).equals(user.car.get(i))) {
                            bookamount[i]++;
                        }
                    }
                }
                int sumprice = 0;
                int list_getid = 0;
                String user_id = user.ShowID();
                int book_id = 0;
                double book_price = 0;
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn5 = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookbase", "root", "cyx007");
                    String sql5 = "select MAX(list_id) from list;";
                    Statement statement = conn5.createStatement();
                    ResultSet resultSet = statement.executeQuery(sql5);
                    while (resultSet.next()) {
                        list_infor_id = resultSet.getInt("MAX(list_id)") + 1;
                    }
                    resultSet.close();
                    statement.close();
                    conn5.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookbase", "root", "cyx007");
                    String sql4 = "select MAX(listget_id) from list_infor;";
                    Statement statement = conn3.createStatement();
                    ResultSet resultSet = statement.executeQuery(sql4);
                    while (resultSet.next()) {
                        list_getid = resultSet.getInt("MAX(listget_id)") + 1;
                    }
                    resultSet.close();
                    statement.close();
                    conn3.close();


                } catch (Exception e) {
                    e.printStackTrace();
                }
                try {
                    Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookbase?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8&useSSL=false", "root", "cyx007");
                    Statement stat1 = conn1.createStatement();
                    for (int i = 0; i < user.car.size(); i++) {
                        boolean outs = true;
                        int price = 0;

                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookbase?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8&useSSL=false", "root", "cyx007");

                        String sql = "SELECT * FROM book";
                        Statement stat = conn.createStatement();
                        ResultSet resultSet = stat.executeQuery(sql);
                        while (resultSet.next()) {
                            String book_name = resultSet.getString("book_name");
                            if (book_name.equals(user.car.get(i))) {

                                book_id = resultSet.getInt("book_number");
                                book_price = resultSet.getDouble("book_price");
                                break;
                            }
                        }
                        for (int m = 0; m < i; m++) {
                            if (user.car.get(m).equals(user.car.get(i))) {
                                outs = false;
                                out.print("ssss");
                                break;
                            }
                        }
                        if (outs) {
                            String sql_All = "insert into list_infor " +
                                    "values ('" + Integer.valueOf(list_getid) + "','" + Integer.valueOf(list_infor_id) + "','" + Integer.valueOf(user_id) + "','" + Integer.valueOf(book_id) + "','" + bookamount[i] + "','" + Double.valueOf(book_price) + "');";
                            stat1.execute(sql_All);
                            list_getid++;
                        }
                        conn.close();
                        stat.close();
                        resultSet.close();
                    }


                    stat1.close();

                    conn1.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }


            double sumprice = (double) se.getAttribute("sumprice");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookbase", "root", "cyx007");
                Statement statement = conn3.createStatement();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date date = new Date(System.currentTimeMillis());
                String dateStr = sdf.format(date);

                String sql_All = "insert into list " +
                        "values ('" + list_infor_id + "','" + '0' + "','" + Integer.valueOf(user.ShowID()) + "','" + Integer.valueOf(list_infor_id) + "','" + dateStr + "','" + sumprice + "','" + "无" + "','" + "无" + "');";
                statement.execute(sql_All);

                statement.close();
                conn3.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        user.car.clear();

        response.sendRedirect("/jsp/user/pay.jsp");
    }
}