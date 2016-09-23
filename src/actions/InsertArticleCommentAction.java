package actions;

import utils.dbUtil.DBUtil;
import beans.ArticleComment;
import net.sf.json.JSONObject;

import java.sql.Date;

/**
 * Created by yanzexin on 16/9/12.
 * All right reserved.
 */
public class InsertArticleCommentAction {
    private String author = "";
    private String content = "";
    private String result = "";
    private int id = 0;

    public InsertArticleCommentAction() {
    }

    public InsertArticleCommentAction(String author, String content, String result, int id) {

        this.author = author;
        this.content = content;
        this.result = result;
        this.id = id;
    }

    public String getAuthor() {

        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String execute() {
        Date date = new Date(System.currentTimeMillis());
        ArticleComment articleComment = new ArticleComment(id, author, date, content);
        DBUtil.insertArticleComment(articleComment);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("error", false);
        result = jsonObject.toString();
        System.out.println(result);
        return "success";
    }
}
