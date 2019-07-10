package midterm;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

import static midterm.Manager.Managerjudge;


public class ManagerLog extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession se = request.getSession();
        String manager_id = request.getParameter("managerid");
        String manager_password = request.getParameter("managerpassword");
        String login = "";
        if (Managerjudge(manager_id, manager_password)) {
            Manager manager = new Manager(manager_id, manager_password);
            login = "true";
            se.setAttribute("manager", manager);
            se.setAttribute("login", login);
            response.sendRedirect("jsp/manager/MmidLogin.jsp");
        } else {
            login = "false";
            se.setAttribute("login", login);
            response.sendRedirect("jsp/manager/MmidLogin.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
