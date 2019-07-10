package DaoVo;

import java.util.ArrayList;
import java.util.List;

public class userVo {
    private String name;
    private String password;
    private String id;

    public String getName() {
        return name;
    }

    public void setName(String username) {
        this.name = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String userpassword) {
        this.password = userpassword;
    }

    public String getId() {
        return id;
    }

    public void setId(String userid) {
        this.id = userid;
    }

}
