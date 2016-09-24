package actions;

import beans.Article;
import beans.User;
import utils.dbUtil.DBUtil;

/**
 * Created by yanzexin on 16/9/24.
 * All right reserved.
 */
public class ApplyArticlesAction {
    private int id;
    private String content;
    private String result;

    public ApplyArticlesAction() {
    }

    public int getId() {

        return id;
    }

    public void setId(int id) {
        this.id = id;
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
        Article article = DBUtil.queryArticle(id, "UncheckedArticles");
        User author = DBUtil.queryUser(article.getAuthor());
        try {
//            Mail.send(author.getEmail(), content);
            DBUtil.insertArticle(article, "Articles");
            DBUtil.deleteArticle(article.getId(), "UncheckedArticles");
        } catch (Exception error) {
            error.printStackTrace();
        }
        result = "";
        return "success";
    }
}
