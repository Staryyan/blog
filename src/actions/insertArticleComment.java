package actions;

import actions.dbUtil.DBUtil;
import beans.ArticleComment;

import java.sql.Date;

/**
 * Created by yanzexin on 16/9/12.
 * All right reserved.
 */
public class insertArticleComment {
    private String author = "";
    private String content = "";
    private int id = 0;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public insertArticleComment() {
    }

    public insertArticleComment(String author, String content, int id) {
        this.author = author;
        this.content = content;
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
    public String execute() {
        Date date = new Date(System.currentTimeMillis());
        System.out.println(author);
        ArticleComment articleComment = new ArticleComment(id, author, date, content);
        DBUtil.insertArticleComment(articleComment);
        return "success";
    }
}
