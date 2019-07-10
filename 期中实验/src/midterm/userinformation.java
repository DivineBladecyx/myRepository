package midterm;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import java.lang.*;


import java.sql.*;


public class userinformation extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("user_id");
        request.setAttribute("user_id", id);
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookbase?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8&useSSL=false", "root", "cyx007");
            Statement statement = conn.createStatement();
            String sql = "SELECT user_name,user_password FROM user where user_id=" + id;

            ResultSet result = statement.executeQuery(sql);
            while (result.next()) {
                String name = result.getString("user_name");
                request.setAttribute("user_name", name);
                String password = result.getString("user_password");
                request.setAttribute("user_password", password);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/jsp/manager/user_output.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
