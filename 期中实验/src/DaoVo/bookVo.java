package DaoVo;

public class bookVo {
    private String number;
    private String name;
    private String category;
    private String categoryname;
    private String price;
    private String comments;
    private String introduction;

    public String getNumber() {
        return number;
    }

    public void setbooksNumber(String booknumber) {
        this.number = booknumber;
    }

    public String getName() {
        return name;
    }

    public void setbooksName(String bookname) {
        this.name = bookname;
    }

    public String getCategory() {
        return category;
    }

    public void setbooksCategory(String bookcategory) {
        this.category = bookcategory;
    }

    public String getCategoryname() {
        return categoryname;
    }

    public void setCategoryname(String categoryname) {
        this.categoryname = categoryname;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }
}