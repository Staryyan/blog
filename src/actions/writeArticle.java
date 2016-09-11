package actions;

import actions.dbUtil.DBUtil;
import beans.Article;

/**
 * Created by yanzexin on 16/9/11.
 * All right reserved.
 */
public class writeArticle {
    private Article m_article = new Article();

    public Article getM_article() {
        return m_article;
    }

    public void setM_article(Article m_article) {
        this.m_article = m_article;
    }
    public String execute() {
        DBUtil.insertArticle(m_article);
        return "success";
    }
}
