package actions;

import beans.Article;
import net.sf.json.JSONObject;
import utils.dbUtil.DBUtil;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by yanzexin on 16/9/24.
 * All right reserved.
 */
public class ListUncheckedArticlesAction {
    private String result = "";
    private String none = "";

    public ListUncheckedArticlesAction() {
    }

    public String getResult() {

        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getNone() {
        return none;
    }

    public void setNone(String none) {
        this.none = none;
    }

    public String execute() {
        ArrayList<Map<String, String>> list = new ArrayList<>();
        for (Article article : DBUtil.listArticles("UncheckedArticles")) {
            Map<String, String> map = new HashMap<>();
            map.put("id", article.getId() + "");
            map.put("author", article.getAuthor());
            map.put("date", article.getDate().toString());
            map.put("title", article.getTitle());
            map.put("description", article.getDescription());
            map.put("content", article.getContent());
            list.add(map);
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("list", list);
        result = jsonObject.toString();
        return "success";
    }
}
