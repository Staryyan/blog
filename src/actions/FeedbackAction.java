package actions;

import beans.Feedback;
import net.sf.json.JSONObject;
import utils.dbUtil.DBUtil;

import java.sql.Date;

/**
 * Created by yanzexin on 16/9/24.
 * All right reserved.
 */
public class FeedbackAction {
    private String author;

    public FeedbackAction() {
    }

    private String content;
    private String result;

    public FeedbackAction(String author, String content, String result) {
        this.author = author;
        this.content = content;
        this.result = result;
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

    public String execute() {
        Date date = new Date(System.currentTimeMillis());
        Feedback feedback = new Feedback(author, date, content);
        DBUtil.insertFeedback(feedback);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("error", false);
        result = jsonObject.toString();
        return "success";
    }
}
