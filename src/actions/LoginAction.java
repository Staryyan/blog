package actions;

import utils.dbUtil.DBUtil;
import beans.User;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.Cookie;

/**
 * Created by yanzexin on 16/9/11.
 * All right reserved.
 */
public class LoginAction extends ActionSupport {
    private String userName = "";
    private String password = "";
    private String result = "";

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

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

    public LoginAction() {
    }
    public String execute() {
        User t_user = DBUtil.queryUser(userName);
        JSONObject jsonObject = new JSONObject();
        if (t_user != null) {
            if (t_user.getPassword().equals(password)) {
                Cookie cookie = new Cookie("userName", t_user.getUserName());
                ServletActionContext.getResponse().addCookie(cookie);
                jsonObject.put("error", false);
            } else {
                jsonObject.put("error", true);
                jsonObject.put("info", "Wrong Password!");
            }
        } else {
            jsonObject.put("error", true);
            jsonObject.put("info", "Don't exist userName!");
        }
        result = jsonObject.toString();
        return "success";
    }
}
