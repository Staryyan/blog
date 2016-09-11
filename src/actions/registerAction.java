package actions;

import beans.User;
import com.opensymphony.xwork2.ActionSupport;

/**
 * Created by yanzexin on 16/9/11.
 * All right reserved.
 */
public class registerAction extends ActionSupport {
    private blogService m_service = new blogService();
    private User t_user = new User();

    public User getT_user() {
        return t_user;
    }

    public void setT_user(User t_user) {
        this.t_user = t_user;
    }

    public registerAction() {

    }
    public String execute() {
        System.out.println(t_user.getUserName());
        if (m_service.register(t_user.getUserName(), t_user.getPassword(), t_user.getEmail(), t_user.getPhone())) {
            return "success";
        }
        return "error";
    }
}
