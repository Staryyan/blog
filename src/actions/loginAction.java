package actions;

import beans.User;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.Cookie;

/**
 * Created by yanzexin on 16/9/11.
 * All right reserved.
 */
public class loginAction extends ActionSupport {
    private blogService m_service;
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
        m_service = new blogService();
    }
    public String execute() {
        User t_user =  m_service.login(userName, password);
        if (t_user != null) {
            Cookie cookie = new Cookie("userName", t_user.getUserName());
            ServletActionContext.getResponse().addCookie(cookie);
            return "success";
        }
        return "error";
    }
}
