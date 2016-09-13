package actions;

import actions.dbUtil.DBUtil;
import beans.User;
import net.sf.json.JSONObject;

/**
 * Created by yanzexin on 16/9/13.
 * All right reserved.
 */
public class checkuserName {
    private String userName = "";
    private String result = "";

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public checkuserName() {
    }

    public checkuserName(String userName) {

        this.userName = userName;
    }

    public String getUserName() {

        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String execute() {
        JSONObject jsonObject = new JSONObject();
        User m_user= DBUtil.queryUser(userName);
        if (m_user != null) {
            jsonObject.put("error", true);
            jsonObject.put("info", "UserName has been registered.");
        } else if (userName.equals("")) {
            jsonObject.put("error", false);
            jsonObject.put("info", "");
        } else {
            jsonObject.put("error", false);
            jsonObject.put("info","UserName can be used!");
        }
        result = jsonObject.toString();
        return "success";
    }
}
