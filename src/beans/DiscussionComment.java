package beans;

import java.sql.Date;

/**
 * Created by yanzexin on 16/9/6.
 * All right reserved.
 */
public class DiscussionComment {
    private String topic;
    private String author;
    private Date date;
    private String content;

    public DiscussionComment(String topic, String author, Date date, String content) {
        this.topic = topic;
        this.author = author;
        this.date = date;
        this.content = content;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
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
