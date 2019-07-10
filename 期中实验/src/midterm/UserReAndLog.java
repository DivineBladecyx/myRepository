package midterm;


import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.lang.*;
import java.util.ArrayList;
import java.util.List;

import static midterm.User.Userjudge;
import static midterm.User.registerjudge;

public class UserReAndLog extends javax.servlet.http.HttpServlet {
    public static List oluser = new ArrayList();

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
        HttpSession se = request.getSession();
        String user_id = request.getParameter("userid");
        String user_password = request.getParameter("userpassword");
        User user = null;
        String login = "";
        if (Userjudge(user_id, user_password)) {
            user = new User(user_id, user_password);
            se.setAttribute("user", user);
            login = "true";
            se.setAttribute("login", login);
            response.sendRedirect("jsp/user/midLogin.jsp");
        } else {
            login = "false";
            se.setAttribute("login", login);
            response.sendRedirect("jsp/user/midLogin.jsp");
        }
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String user_id = request.getParameter("userid");
        String user_password = request.getParameter("userpassword");
        String user_name = request.getParameter("username");
        HttpSession se = request.getSession();
        String register = "";
        if (!registerjudge(user_id)) {
            User user = new User(user_id, user_password);
            user.register(user_id, user_password, user_name);
            register = "true";
            se.setAttribute("register", register);
            response.sendRedirect("jsp/user/midRegister.jsp");
        } else {
            register = "false";
            se.setAttribute("register", register);
            response.sendRedirect("jsp/user/midRegister.jsp");
        }
    }
}
