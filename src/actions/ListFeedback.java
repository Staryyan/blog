package actions;

import beans.Feedback;
import net.sf.json.JSONObject;
import utils.dbUtil.DBUtil;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by yanzexin on 16/9/24.
 * All right reserved.
 */
public class ListFeedback {
    private String none = "";
    private String result = "";

    public ListFeedback() {
    }

    public ListFeedback(String none, String result) {

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
        ArrayList<Map<String, String>> list = new ArrayList<>();
        for (Feedback feedback : DBUtil.listFeedback()) {
            Map<String, String> map = new HashMap<>();
            map.put("id", feedback.getId() + "");
            map.put("date", feedback.getDate() + "");
            map.put("author", feedback.getAuthor());
            map.put("content", feedback.getContent());
            list.add(map);
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("list", list);
        result = jsonObject.toString();
        return "success";
    }
}
