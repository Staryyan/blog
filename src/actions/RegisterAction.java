package actions;

import utils.dbUtil.DBUtil;
import beans.User;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONObject;

/**
 * Created by yanzexin on 16/9/11.
 * All right reserved.
 */
public class RegisterAction extends ActionSupport {
    private String userName = "";
    private String password = "";
    private String email = "";
    private String phone = "";
    private String result = "";
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }


    public RegisterAction() {
    }
    public String execute() {
        JSONObject jsonObject = new JSONObject();
        User m_user = new User(userName, password, email, phone);
        User t_user = DBUtil.queryUser(m_user.getUserName());
        System.out.print(m_user.getUserName());
        if (t_user == null) {
            DBUtil.insertUser(m_user);
            jsonObject.put("error", false);
            jsonObject.put("info", "");
        } else {
            jsonObject.put("error", true);
            jsonObject.put("info","");
        }
        result = jsonObject.toString();
        return "success";
    }
}
