package midterm;

import java.sql.*;

public class Manager {
    private String name;
    private String password;
    private String id;
    private int[] car;

    public Manager(String id, String password) {
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
        String sql = "insert into manager values (?,?,?)";

        try {
            System.out.print("开始注册！");
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, basepassword);
            stmt = (PreparedStatement) conn.prepareStatement(sql);
            stmt.setString(1, id);
            stmt.setString(2, name);
            stmt.setString(3, password);
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

    public static boolean Managerjudge(String id, String password) {//登录进行用户名密码扫描数据库判断判断
        boolean isright = false;//判断用户
        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookbase", "root", "cyx007");
            String sql = "SELECT * FROM manager";
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                String manager_id = resultSet.getString("manager_id");
                String manager_password = resultSet.getString("manager_password");
                if (id.equals(manager_id) && password.equals(manager_password)) {
                    isright = true;
                }
            }
            resultSet.close();
            statement.close();
            conn.close();
            if (isright == true) {
                return true;
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
