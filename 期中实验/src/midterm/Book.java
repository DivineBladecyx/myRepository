package midterm;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

public class Book {
    private String number;
    private String name;
    private String category;
    private String categoryname;
    private String price;
    private String comments;

    public Book(String number, String name, String category, String categoryname, String price, String comments) {
        this.number = number;
        this.name = name;
        this.category = category;
        this.categoryname = categoryname;
        this.price = price;
        this.comments = comments;
    }

    public String ShowBookName() {
        return this.name;
    }

    public static void add(String bookname, List car) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookbase", "root", "cyx007");
            String sql = "SELECT * FROM book";
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                String book_name = resultSet.getString("book_name");
                if (book_name.equals(bookname)) {
                    String booknumber = resultSet.getString("book_number");
                    String bookcategory = resultSet.getString("book_category");
                    String categoryname = resultSet.getString("category_name");
                    String price = resultSet.getString("book_price");
                    String comments = resultSet.getString("comments");
                    car.add(book_name);
                }
            }
            resultSet.close();
            statement.close();
            conn.close();


        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

