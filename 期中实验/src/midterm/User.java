package midterm;

import DaoVo.bookDao;
import DaoVo.userDao;
import DaoVo.userVo;

import javax.servlet.http.HttpSession;

import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class User {
    private String name;
    private String password;
    private String id;
    public List<String> car = new ArrayList();
    public int login;

    public User(String id, String password) {
        this.id = id;
        this.password = password;
    }

    public String ShowID() {
        return this.id;
    }

    public boolean register(String id, String password, String name) {
        Connection conn;
        PreparedStatement stmt;
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/bookbase";
        String user = "root";
        String basepassword = "cyx007";
        String sql = "insert into user values (?,?,?)";

        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, basepassword);
            stmt = (PreparedStatement) conn.prepareStatement(sql);
            stmt.setString(1, id);
            stmt.setString(2, name);
            stmt.setString(3, password);
            List car = new ArrayList();
            this.car = car;
            this.name = name;
            stmt.executeUpdate();

        } catch (ClassNotFoundException e) {
            // TODO 自动生成的 catch 块
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO 自动生成的 catch 块
            e.printStackTrace();
        }
        return true;
    }

    public static boolean registerjudge(String id) {
        boolean isright = false;
        try {
            userDao users = new userDao();
            ArrayList Users = users.queryAllBooks();
            for (int i = 0; i < Users.size(); i++) {
                userVo uservo = (userVo) Users.get(i);
                String user_id = uservo.getId();
                if (id.equals(user_id)) {
                    isright = true;
                }
            }
            if (isright) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean Userjudge(String id, String password) {//登录进行用户名密码扫描数据库判断判断
        boolean isright = false;//判断用户
        try {
            userDao users = new userDao();
            ArrayList Users = users.queryAllBooks();
            for (int i = 0; i < Users.size(); i++) {
                userVo uservo = (userVo) Users.get(i);
                String user_id = uservo.getId();
                String user_password = uservo.getPassword();
                if (id.equals(user_id) && password.equals(user_password)) {
                    isright = true;
                }
            }
            if (isright) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
