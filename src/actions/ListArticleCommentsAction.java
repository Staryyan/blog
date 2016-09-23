package actions;

import utils.dbUtil.DBUtil;
import beans.ArticleComment;
import net.sf.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by yanzexin on 16/9/18.
 * All right reserved.
 */
public class ListArticleCommentsAction {
    private int id = 0;
    private String result = "";

    public ListArticleCommentsAction() {
    }

    public ListArticleCommentsAction(int id, String result) {

        this.id = id;
        this.result = result;
    }

    public int getId() {

        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }
    public String execute() {
        ArrayList<ArticleComment> list = DBUtil.queryArticleComments(id);
        ArrayList<Map<String, String>> j_list = new ArrayList<>();
        JSONObject jsonObject = new JSONObject();
        if (list == null) {
            jsonObject.put("error", true);
        } else {
            for (ArticleComment comment : list) {
                Map<String, String> map = new HashMap<>();
                map.put("author", comment.getAuthor());
                map.put("content", comment.getContent());
                map.put("date", comment.getDate().toString());
                j_list.add(map);
            }
            jsonObject.put("comments", j_list);
        }
        result = jsonObject.toString();
        return "success";
    }
    public static void main(String[] args) {

    }
}
