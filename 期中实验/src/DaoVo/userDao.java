package DaoVo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class userDao {
    public ArrayList queryAllBooks() throws Exception {
        Connection conn = null;
        ArrayList Users = new ArrayList();
        try {
            //获取连接
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/bookbase";
            conn = DriverManager.getConnection(url, "root", "cyx007");
            //运行SQL语句
            String sql = "select * from user ";//获取
            Statement stat = conn.createStatement();
            ResultSet rs = stat.executeQuery(sql);
            while (rs.next()) {   //实例化VO
                userVo users = new userVo();
                users.setName(rs.getString("user_name"));
                users.setId(rs.getString("user_id"));
                users.setPassword(rs.getString("user_password"));
                Users.add(users);
            }
            rs.close();
            stat.close();
        } catch (Exception e1) {
            e1.printStackTrace();
        } finally {
            try {//关闭连接
                if (conn != null) {
                    conn.close();
                    conn = null;
                }
            } catch (Exception ex) {
            }
            return Users;
        }
    }
}
