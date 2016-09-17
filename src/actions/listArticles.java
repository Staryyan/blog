package actions;

import actions.dbUtil.DBUtil;
import beans.Article;
import net.sf.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by yanzexin on 16/9/12.
 * All right reserved.
 */
public class listArticles {
    private String none = "";
    private String result = "";

    public listArticles() {
    }

    public listArticles(String none, String result) {

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
        for (Article each : DBUtil.listArticles()) {
            Map<String, String> map = new HashMap<>();
            map.put("id", each.getId() + "");
            map.put("title", each.getTitle());
            map.put("description", each.getDescription());
            list.add(map);
        }
        jsonObject.put("list", list);
        result = jsonObject.toString();
        return "success";
    }
    public static void main(String[] args) {
    }
}
