package actions;

import beans.Article;
import beans.User;
import utils.dbUtil.DBUtil;

/**
 * Created by yanzexin on 16/9/24.
 * All right reserved.
 */
public class DenyArticlesAction {
    private Article article;
    private String content;
    private String result;

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public DenyArticlesAction() {
    }

    public Article getArticle() {

        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public String execute() {
        User author = DBUtil.queryUser(article.getAuthor());
        try {
//            Mail.send(author.getEmail(), content);
            DBUtil.deleteArticle(article.getId(), "UncheckedArticles");
        } catch (Exception error) {
            error.printStackTrace();
        }
        result = "";
        return "success";
    }
}
