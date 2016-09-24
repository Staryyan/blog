package beans;

import java.sql.Date;

/**
 * Created by yanzexin on 16/9/24.
 * All right reserved.
 */
public class Feedback {
    private int id;
    private String author;
    private Date date;
    private String content;

    public Feedback(String author, Date date, String content) {
        this.author = author;
        this.date = date;
        this.content = content;
    }

    public Feedback(int id, String author, Date date, String content) {
        this.id = id;
        this.author = author;
        this.date = date;
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
