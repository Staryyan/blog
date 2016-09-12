package beans;

import java.sql.Date;

/**
 * Created by yanzexin on 16/9/6.
 * All right reserved.
 */

/**
 * Article JavaBean.
 */
public class Article {
    private int id;
    private String author;
    private Date date;
    private String title;
    private String description;
    private String content;

    public Article() {
        id = 0;
        author = "";
        date = new Date(0);
        title = "";
        description = "";
        content = "";
    }

    public Article(int id, String author, Date date, String title, String description, String content) {
        this.id = id;
        this.author = author;
        this.date = date;
        this.title = title;
        this.description = description;
        this.content = content;
    }

    public Article(String author, Date date, String title, String description, String content) {
        id = 0;
        this.author = author;
        this.title = title;
        this.date = date;
        this.description = description;
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

}
