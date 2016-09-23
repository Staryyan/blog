package actions;

import utils.mailUtil.Mail;
import utils.dbUtil.DBUtil;
import beans.User;
import net.sf.json.JSONObject;

/**
 * Created by yanzexin on 16/9/15.
 * All right reserved.
 */
public class FindPasswordAction {
    private String userName = "";
    private String email = "";
    private String result = "";

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public FindPasswordAction() {
    }

    public FindPasswordAction(String userName, String email, String result) {
        this.userName = userName;
        this.email = email;
        this.result = result;
    }

    public String getUserName() {

        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    public String execute() {
        User t_user = DBUtil.queryUser(userName);
        JSONObject jsonObject = new JSONObject();
        if (t_user != null) {
            if (t_user.getEmail().equals(email)) {
                jsonObject.put("error", false);
                try {
                    Mail.send(email, "Hello " + userName + "! Thanks for using Stary's blog. We have reset " +
                            "your password as `123456`, you had better change your password right now. \n" +
                            "Best wishes!\n" +
                            "From Stary's blog.");
                    DBUtil.updateUser(userName, t_user.getPassword(), "password", "123456");
                } catch (Exception error) {
                    error.printStackTrace();
                }
            } else {
                jsonObject.put("error", true);
                jsonObject.put("info", "Wrong email!");
            }
        } else {
            jsonObject.put("error", true);
            jsonObject.put("info", "Don't exist " + userName + "!");
        }
        result = jsonObject.toString();
        return "success";
    }
}
