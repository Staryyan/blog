package actions;

import actions.dbUtil.DBUtil;
import beans.User;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONObject;

/**
 * Created by yanzexin on 16/9/11.
 * All right reserved.
 */
public class changePassword extends ActionSupport {
    private String userName = "";
    private String oldPassword = "";
    private String newPassword = "";
    private String result = "";

    public changePassword() {
    }

    public changePassword(String userName, String oldPassword, String newPassword, String result) {

        this.userName = userName;
        this.oldPassword = oldPassword;
        this.newPassword = newPassword;
        this.result = result;
    }

    public String getUserName() {

        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String execute() {
        User t_user = DBUtil.queryUser(userName);
        JSONObject jsonObject = new JSONObject();
        if (t_user.getPassword().equals(oldPassword)) {
            DBUtil.updateUser(userName, oldPassword, "password", newPassword);
            jsonObject.put("error", false);
        } else  {
            jsonObject.put("error", true);
            jsonObject.put("info", "Wrong password");
        }
        result = jsonObject.toString();
        return "success";
    }
}
