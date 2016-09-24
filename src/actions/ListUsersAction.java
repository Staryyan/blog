package actions;

import beans.User;
import net.sf.json.JSONObject;
import utils.dbUtil.DBUtil;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by yanzexin on 16/9/24.
 * All right reserved.
 */
public class ListUsersAction {
    String none = "";
    String result = "";

    public ListUsersAction() {
    }

    public ListUsersAction(String none, String result) {

        this.none = none;
        this.result = result;
    }

    public String getNone() {

        return none;
    }

    public void setNone(String none) {
        this.none = none;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String execute() {
        JSONObject jsonObject = new JSONObject();
        ArrayList<Map<String, String>> list = new ArrayList<>();
        for (User each : DBUtil.listUsers()) {
            Map<String, String> map = new HashMap<>();
            map.put("userName", each.getUserName());
            map.put("email", each.getEmail());
            map.put("phone", each.getPhone());
            list.add(map);
        }
        jsonObject.put("list", list);
        result = jsonObject.toString();
        return "success";
    }
}
