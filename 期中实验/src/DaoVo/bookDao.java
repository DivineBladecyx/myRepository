package DaoVo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import DaoVo.bookVo;

public class bookDao {

    public ArrayList queryAllBooks() throws Exception {
        Connection conn = null;
        ArrayList Books = new ArrayList();
        try {
            //获取连接
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/bookbase";
            conn = DriverManager.getConnection(url, "root", "cyx007");
            //运行SQL语句
            String sql = "select * from book";//获取
            Statement stat = conn.createStatement();
            ResultSet rs = stat.executeQuery(sql);
            while (rs.next()) {   //实例化VO
                bookVo books = new bookVo();
                books.setbooksNumber(rs.getString("book_number"));
                books.setbooksName(rs.getString("book_name"));
                books.setbooksCategory(rs.getString("book_category"));
                books.setCategoryname(rs.getString("category_name"));
                books.setPrice(rs.getString("book_price"));
                books.setComments(rs.getString("comments"));
                books.setIntroduction(rs.getString("book_introduction"));
                Books.add(books);
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
            return Books;
        }
    }
}
