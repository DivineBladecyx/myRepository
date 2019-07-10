package midterm;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


public class deletebook extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=gb2312");
        PrintWriter out = response.getWriter();
        int booknumber = Integer.valueOf(request.getParameter("booknumber"));
        try {
            String url = "jdbc:mysql://localhost:3306/bookbase?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8&useSSL=false";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, "root", "cyx007");
            Statement stat = conn.createStatement();
            String sql = "delete from book where book_number='" + booknumber + "'";
            int i = stat.executeUpdate(sql);
            out.println(i + "行删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("jsp/manager/AddBook.jsp");
    }
}
