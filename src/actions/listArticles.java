package actions;

import actions.dbUtil.DBUtil;
import beans.Article;
import com.opensymphony.xwork2.ActionContext;

import java.util.ArrayList;

/**
 * Created by yanzexin on 16/9/12.
 * All right reserved.
 */
public class listArticles {
    public String execute() {
        ArrayList<Article> m_articles = DBUtil.listArticles();
        System.out.println(m_articles);
        ActionContext.getContext().getSession().put("list", m_articles);
        return "success";
    }
}
