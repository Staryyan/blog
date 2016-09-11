package actions;

import actions.dbUtil.DBUtil;
import beans.User;
import com.opensymphony.xwork2.ActionSupport;

/**
 * Created by yanzexin on 16/9/11.
 * All right reserved.
 */
public class changePassword extends ActionSupport {
    private String userName = "";
    private String password = "";
    private String newPassword = "";

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }
    public String execute() {
        User t_user = DBUtil.queryUser(userName);
        if (t_user != null && t_user.getPassword().equals(password)) {
            DBUtil.updateUser(userName, password, "password", newPassword);
            return "success";
        }
        return "error";
    }
}
