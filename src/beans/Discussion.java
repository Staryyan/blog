package beans;

import java.sql.Date;
import java.util.ArrayList;

/**
 * Created by yanzexin on 16/9/6.
 * All right reserved.
 */

/**
 * Discussion JavaBean.
 */
public class Discussion {
    private int id;
    private String author;
    private Date date;
    private String topic;
    private String content;
    private ArrayList<DiscussionComment> m_comment;

    public Discussion() {
        id = 0;
        author = "";
        date = new Date(0);
        topic = "";
        content = "";
        m_comment = new ArrayList<>();
    }

    public Discussion(String author, Date date, String topic, String content) {
        id = 0;
        this.author = author;
        this.date = date;
        this.topic = topic;
        this.content = content;
        m_comment = new ArrayList<>();
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

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void insertComment(DiscussionComment comment) {
        m_comment.add(comment);
    }

    public void deleteComment(DiscussionComment comment) { m_comment.remove(comment); }

    public ArrayList<DiscussionComment> getComment() {
        return m_comment;
    }

    public void setComment(ArrayList<DiscussionComment> m_comment) {
        this.m_comment = m_comment;
    }
}
