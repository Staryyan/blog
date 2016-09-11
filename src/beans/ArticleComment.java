package beans;

import java.sql.Date;

/**
 * Created by yanzexin on 16/9/6.
 * All right reserved.
 */
public class ArticleComment {
    private String author;
    private Date date;
    private String content;
    private String title;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public ArticleComment(String author, Date date, String title, String content) {
        this.author = author;
        this.date = date;
        this.content = content;
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

}
