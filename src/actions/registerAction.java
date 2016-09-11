package actions;

import actions.dbUtil.DBUtil;
import beans.User;
import com.opensymphony.xwork2.ActionSupport;

/**
 * Created by yanzexin on 16/9/11.
 * All right reserved.
 */
public class registerAction extends ActionSupport {
    private User m_user = new User();

    public User getM_user() {
        return m_user;
    }

    public void setM_user(User m_user) {
        this.m_user = m_user;
    }

    public registerAction() {
    }
    public String execute() {
        System.out.println(m_user.getUserName());
        User t_user = DBUtil.queryUser(m_user.getUserName());
        if (t_user == null) {
            DBUtil.insertUser(m_user);
            System.out.print(DBUtil.queryUser(m_user.getUserName()));
            return "success";
        }
        return "error";
    }
}
