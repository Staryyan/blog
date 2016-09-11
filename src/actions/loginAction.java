package actions;

import actions.dbUtil.DBUtil;
import beans.User;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.Cookie;

/**
 * Created by yanzexin on 16/9/11.
 * All right reserved.
 */
public class loginAction extends ActionSupport {
    private String userName;
    private String password;

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

    public loginAction() {
    }
    public String execute() {
        User t_user = DBUtil.queryUser(userName);
        if (t_user != null && t_user.getPassword().equals(password)) {
            Cookie cookie = new Cookie("userName", t_user.getUserName());
            ServletActionContext.getResponse().addCookie(cookie);
            return "success";
        }
        return "error";
    }
}
