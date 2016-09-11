package actions;

import actions.dbUtil.DBUtil;
import beans.User;

/**
 * Created by yanzexin on 16/9/7.
 * All right reserved.
 */
public class blogService {
    public User login(String userName, String password) {
        User t_user = DBUtil.existUser(userName, password);
        return t_user;
    }
    public boolean register(String userName, String password, String email, String phone) {
        if (DBUtil.existUser(userName, password) == null) {
            DBUtil.insertUser(new User(userName, password, email, phone));
            return true;
        }
        return false;
    }
    public boolean deleteUser(String userName, String password) {
        return true;
    }
    public boolean changePassword(String userName, String password, String newPassword) {
        if (DBUtil.existUser(userName, password) != null) {
            DBUtil.updateUser(userName, password, "password", newPassword);
            return true;
        }
        return false;
    }
//    public boolean changeEmail(String userName, String password, String newEmail) {
//        return m_storage.queryUser(new Filter<User>() {
//            @Override
//            public boolean filter(User object) {
//                return object.getUserName().equals(userName) && object.getPassword().equals(password);
//            }
//
//            @Override
//            public void switcher(User object) {
//                object.setEmail(newEmail);
//                DBUtil.updateUser(userName, password, "email", newEmail);
//            }
//        });
//    }
//    public boolean changePhone(String userName, String password, String newPhone) {
//        return m_storage.queryUser(new Filter<User>() {
//            @Override
//            public boolean filter(User object) {
//                return object.getUserName().equals(userName) && object.getPassword().equals(password);
//            }
//
//            @Override
//            public void switcher(User object) {
//                object.setPhone(newPhone);
//                DBUtil.updateUser(userName, password, "phone", newPhone);
//            }
//        });
//    }
//    public boolean writeArticle(String author, String title, java.sql.Date date, String description, String content) {
//        if (m_storage.queryArticle(new Filter<Article>() {
//            @Override
//            public boolean filter(Article object) {
//                return object.getTitle().equals(title);
//            }
//            @Override
//            public void switcher(Article object) {
//            }
//        }).size() == 0) {
//            m_storage.insertArticle(new Article(author, title, date, description, content));
//            DBUtil.insertArticle(new Article(author, title, date, description, content));
//            return true;
//        }
//        return false;
//    }
//    public boolean deleteArticle(String author, String title) {
//        return m_storage.queryArticle(new Filter<Article>() {
//            @Override
//            public boolean filter(Article object) {
//                return object.getTitle().equals(title);
//            }
//            @Override
//            public void switcher(Article object) {
//                m_storage.deleteArticle(object);
//                DBUtil.deleteArticle(object);
//            }
//        }).size() == 1;
//    }
//    public ArrayList<Article> listArticle() {
//        return m_storage.queryArticle(new Filter<Article>() {
//            @Override
//            public boolean filter(Article object) {
//                return true;
//            }
//            @Override
//            public void switcher(Article object) {
//
//            }
//        });
//    }
//    public Article getArticle(String title) {
//        return m_storage.queryArticle(new Filter<Article>() {
//            @Override
//            public boolean filter(Article object) {
//                return object.getTitle().equals(title);
//            }
//            @Override
//            public void switcher(Article object) {
//            }
//        }).get(0);
//    }
//    public boolean changeArticileDescription(String author, String title, String description, java.sql.Date date) {
//        return m_storage.queryArticle(new Filter<Article>() {
//            @Override
//            public boolean filter(Article object) {
//                return object.getAuthor().equals(author) && object.getTitle().equals(title);
//            }
//
//            @Override
//            public void switcher(Article object) {
//                object.setDescription(description);
//                object.setDate(date);
//                DBUtil.updateArticle(author, title, "description", description);
//                DBUtil.updateArticle(author, title, "date", date.toString());
//            }
//        }).size() == 1;
//    }
//    public boolean changeArticileContent(String author, String title, String content, java.sql.Date date) {
//        return m_storage.queryArticle(new Filter<Article>() {
//            @Override
//            public boolean filter(Article object) {
//                return object.getAuthor().equals(author) && object.getTitle().equals(title);
//            }
//
//            @Override
//            public void switcher(Article object) {
//                object.setContent(content);
//                object.setDate(date);
//                DBUtil.updateArticle(author, title, "content", content);
//                DBUtil.updateArticle(author, title, "date", date.toString());
//            }
//        }).size() == 1;
//    }
//    public boolean insertArticleComment(String author, String title, java.sql.Date date, String content) {
//        return m_storage.queryArticle(new Filter<Article>() {
//            @Override
//            public boolean filter(Article object) {
//                return object.getAuthor().equals(author) && object.getTitle().equals(title);
//            }
//
//            @Override
//            public void switcher(Article object) {
//                object.insertComment(new ArticleComment(author, date, title, content));
//                DBUtil.insertArticleComment(new ArticleComment(author, date, title, content));
//            }
//        }).size() == 1;
//    }
//    public boolean deleteArticleComment(ArticleComment comment) {
//        return m_storage.queryArticle(new Filter<Article>() {
//            @Override
//            public boolean filter(Article object) {
//                return object.getTitle().equals(comment.getTitle());
//            }
//            @Override
//            public void switcher(Article object) {
//                object.deleteComment(comment);
//                DBUtil.deleteArticleComment(comment);
//            }
//        }).size() == 1;
//    }
//    public boolean insertDiscussion(String author, java.sql.Date date, String topic, String content) {
//        if (m_storage.queryDiscussion(new Filter<Discussion>() {
//            @Override
//            public boolean filter(Discussion object) {
//                return object.getTopic().equals(topic);
//            }
//            @Override
//            public void switcher(Discussion object) {
//            }
//        }).size() == 0) {
//            m_storage.insertDiscussion(new Discussion(author, date, topic, content));
//            DBUtil.insertDiscussion(new Discussion(author, date, topic, content));
//            return true;
//        }
//        return false;
//    }
//    public boolean deleteDiscussion(String topic) {
//        if (m_storage.queryDiscussion(new Filter<Discussion>() {
//            @Override
//            public boolean filter(Discussion object) {
//                return object.getTopic().equals(topic);
//            }
//            @Override
//            public void switcher(Discussion object) {
//                m_storage.deleteDiscussion(object);
//                DBUtil.deleteDiscussion(object);
//            }
//        }).size() == 1) {
//            return true;
//        }
//        return false;
//    }
//    public ArrayList<Discussion> listDiscussion() {
//        return m_storage.queryDiscussion(new Filter<Discussion>() {
//            @Override
//            public boolean filter(Discussion object) {
//                return true;
//            }
//
//            @Override
//            public void switcher(Discussion object) {
//            }
//        });
//    }
//    public Discussion getDiscussion(String topic) {
//        return m_storage.queryDiscussion(new Filter<Discussion>() {
//            @Override
//            public boolean filter(Discussion object) {
//                return object.getTopic().equals(topic);
//            }
//
//            @Override
//            public void switcher(Discussion object) {
//            }
//        }).get(0);
//    }
//    public boolean changeDiscussionContent(String topic, String content) {
//        return m_storage.queryDiscussion(new Filter<Discussion>() {
//            @Override
//            public boolean filter(Discussion object) {
//                return object.getTopic().equals(topic);
//            }
//
//            @Override
//            public void switcher(Discussion object) {
//                object.setContent(content);
//            }
//        }).size() == 1;
//    }
//    public boolean insertDiscussionComment(String topic, String author, java.sql.Date date, String content) {
//        return m_storage.queryDiscussion(new Filter<Discussion>() {
//            @Override
//            public boolean filter(Discussion object) {
//                return object.getTopic().equals(topic);
//            }
//
//            @Override
//            public void switcher(Discussion object) {
//                object.insertComment(new DiscussionComment(topic, author, date, content));
//                DBUtil.insertDiscussionComment(new DiscussionComment(topic, author, date, content));
//            }
//        }).size() == 1;
//    }
//    public boolean deleteDiscussionComment(DiscussionComment comment) {
//        return m_storage.queryDiscussion(new Filter<Discussion>() {
//            @Override
//            public boolean filter(Discussion object) {
//                return object.getTopic().equals(comment.getTopic());
//            }
//
//            @Override
//            public void switcher(Discussion object) {
//                object.deleteComment(comment);
//                DBUtil.deleteDiscussionComment(comment);
//            }
//        }).size() == 1;
//    }
    public static void main(String[] args) {
        blogService m_service = new blogService();
        System.out.print(m_service.changePassword("yan","1234","123456"));
    }
}
