package actions;

import utils.dbUtil.DBUtil;
import beans.Article;

/**
 * Created by yanzexin on 16/9/11.
 * All right reserved.
 */
public class WriteArticleAction {
    private Article m_article = new Article();

    public Article getM_article() {
        return m_article;
    }

    public void setM_article(Article m_article) {
        this.m_article = m_article;
    }
    public String execute() {
        DBUtil.insertArticle(m_article, "UncheckedArticles");
        return "success";
    }
}
