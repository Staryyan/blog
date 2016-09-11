package beans;

import java.sql.Date;
import java.util.ArrayList;

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
    private ArrayList<beans.ArticleComment> m_commentList;

    public Article() {
        id = 0;
        author = "";
        date = new Date(0);
        title = "";
        description = "";
        content = "";
        m_commentList = new ArrayList<>();
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
        m_commentList = new ArrayList<>();
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

    public void insertComment(ArticleComment comment) {
        m_commentList.add(comment);
    }

    public void deleteComment(ArticleComment comment) {
        m_commentList.remove(comment);
    }

    public ArrayList<ArticleComment> getcommentList() {
        return m_commentList;
    }

    public void setcommentList(ArrayList<ArticleComment> m_commentList) {
        this.m_commentList = m_commentList;
    }
}
