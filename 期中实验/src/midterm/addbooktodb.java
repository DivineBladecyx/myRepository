package midterm;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


public class addbooktodb extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=gb2312");
        PrintWriter out = response.getWriter();
        String bookname = request.getParameter("bookname");
        String bookcategory = request.getParameter("bookcategory");
        String bookprice = request.getParameter("bookprice");
        String comments = request.getParameter("comments");
        String introduction = request.getParameter("introduction");
        int booknumber = 0;
        String categoryname = "";
        try {
            String url = "jdbc:mysql://localhost:3306/bookbase?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8&useSSL=false";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, "root", "cyx007");
            Statement stat = conn.createStatement();
            String sql1 = "select book_number from book ";
            ResultSet rs = stat.executeQuery(sql1);
            while (rs.next()) {
                booknumber = rs.getInt("book_number");
            }
            booknumber++;
            String number = request.getParameter("booknumber");
            if (!number.equals(""))
                booknumber = Integer.valueOf(number);

            String sql2 = "select * from category";
            ResultSet rs2 = stat.executeQuery(sql2);
            while (rs2.next()) {
                if (bookcategory.equals(String.valueOf(rs2.getInt("category_number"))))
                    categoryname = rs2.getString("category_name");
            }
            String sql_All = "insert into book " +
                    "values ('" + (booknumber) + "','" + bookname + "','" + Integer.valueOf(bookcategory) + "','" +
                    categoryname + "','" + Integer.valueOf(bookprice) + "','" + comments + "','" + introduction + "');";
            int i = stat.executeUpdate(sql_All);
            out.println(i + "行录入成功！");
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("jsp/manager/AddBook.jsp");
    }
}
