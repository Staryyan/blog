package utils.dbUtil;

/**
 * Created by yanzexin on 16/9/6.
 * All right reserved.
 */

import beans.Article;
import beans.ArticleComment;
import beans.Feedback;
import beans.User;

import java.sql.*;
import java.util.ArrayList;

public class DBUtil {
    private static String driverName = DBInfo.driverName;
    private static String dbURL = DBInfo.dbURL;
    private static String userName = DBInfo.userName;
    private static String userPwd = DBInfo.userPwd;
    private static Connection blogConnection = null;

    public DBUtil() {}

    private static void openDB() {
        try {
            Class.forName(driverName).newInstance();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Load failed!");
        }
        try {
            blogConnection = DriverManager.getConnection(dbURL, userName, userPwd);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Connecting failed!");
        }
    }
    private static void closeDB() {
        try {
            blogConnection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
    * Query user with its userName;
    * @param userName the name which will be queryed.
    * @return User(could be null).
     */
    public static User queryUser(final String userName) {
        try {
            openDB();
            PreparedStatement ps = blogConnection.prepareStatement("SELECT * FROM Users WHERE userName = ?");
            ps.setString(1, userName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(rs.getString("userName"), rs.getString("password"), rs.getString("email"), rs.getString("phone"));
            }
        } catch (Exception error) {
            error.printStackTrace();
            return null;
        }
        return null;
    }

    /**
     * Insert User into Users without checking.
     * @param user which will be inserted.
     */
    public static void insertUser(final User user) {
        try {
            openDB();
            PreparedStatement ps = blogConnection.prepareStatement("INSERT INTO Users VALUES (?, ?, ?, ?)");
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhone());
            ps.execute();
            closeDB();
        } catch (Exception error) {
            error.printStackTrace();
        }
    }

    /**
     * delete User from Users by its userName and password.
     */
    public void deleteUser(final String userName, final String password) {
        try {
            openDB();
            PreparedStatement ps = blogConnection.prepareStatement("DELETE FROM Users WHERE userName = ? AND password = ?");
            ps.setString(1, userName);
            ps.setString(2, password);
            ps.execute();
            closeDB();
        } catch (Exception error) {
            error.printStackTrace();
        }
    }

    /**
     * update User with field by its userName and password.
     * @param userName check its profile.
     * @param password check its profile.
     * @param field which will be updated.
     * @param newValue the new value.
     */
    public static void updateUser(String userName, String password, String field, String newValue) {
        try {
            openDB();
            PreparedStatement ps = blogConnection.prepareStatement("UPDATE Users SET " + field + " = ? WHERE userName = ? AND password = ?");
            ps.setString(1, newValue);
            ps.setString(2, userName);
            ps.setString(3, password);
            ps.execute();
            closeDB();
        } catch (Exception error) {
            error.printStackTrace();
        }
    }

    /**
     * List Users
     * @return User List
     */
    public static ArrayList<User> listUsers() {
        try {
            openDB();
            PreparedStatement ps = blogConnection.prepareStatement("SELECT * FROM Users WHERE userName <> ?");
            ps.setString(1, "root");
            ResultSet rs = ps.executeQuery();
            ArrayList<User> ans = new ArrayList<>();
            while (rs.next()) {
                ans.add(new User(rs.getString("userName"), rs.getString("email"), rs.getString("phone")));
            }
            return ans;
        } catch (Exception error) {
            error.printStackTrace();
        }
        return null;
    }

    /**
     * Insert Article into Database.
     * @param article which will be inserted.
     * @param table UncheckedArticles/Articles.
     */
    public static void insertArticle(Article article, String table) {
        try {
            openDB();
            PreparedStatement ps = blogConnection.prepareStatement("INSERT INTO "+ table +"(author, date, title, description, content) VALUES (?, ?, ?, ?, ?)");
            ps.setString(1, article.getAuthor());
            ps.setDate(2, article.getDate());
            ps.setString(3, article.getTitle());
            ps.setString(4, article.getDescription());
            ps.setString(5, article.getContent());
            ps.execute();
            closeDB();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * List Articles from Database.
     * @param table UncheckedArticles/Articles
     * @return Articles List
     */
    public static ArrayList<Article> listArticles(String table) {
        try {
            openDB();
            PreparedStatement ps = blogConnection.prepareStatement("SELECT * FROM " + table);
            ResultSet rs = ps.executeQuery();
            ArrayList<Article> m_articles = new ArrayList<>();
            while (rs.next()) {
                m_articles.add(new Article(rs.getInt("id"), rs.getString("author"), rs.getDate("date"), rs.getString("title"), rs.getString("description"), rs.getString("content")));
            }
            return m_articles;
        } catch (Exception error) {
            error.printStackTrace();
        }
        return null;
    }
    public static Article queryArticle(int id, String table) {
        try {
            openDB();
            PreparedStatement ps = blogConnection.prepareStatement("SELECT * FROM " + table +" WHERE id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Article(rs.getInt("id"), rs.getString("author"), rs.getDate("date"), rs.getString("title"), rs.getString("description"), rs.getString("content"));
            }
            return null;
        } catch (Exception error) {
            error.printStackTrace();
        }
        return null;
    }

    /**
     * Delete Articles from Database.
     * @param id the unique index of Articles.
     * @param table UncheckedArticles/Articles
     */
    public static void deleteArticle(int id, String table) {
        try {
            openDB();
            PreparedStatement ps = blogConnection.prepareStatement("DELETE FROM "+ table +" WHERE id=?");
            ps.setInt(1, id);
            ps.execute();
            closeDB();
        } catch (Exception error) {
            error.printStackTrace();
        }
    }
    /**
     * update Article with specific field.
     * @param author
     * @param title
     * @param field
     * @param newValue
     */
//    public void updateArticle(String author, String title, String field, String newValue) {
//        try {
//            openDB();
//            PreparedStatement ps = blogConnection.prepareStatement("UPDATE Articles SET " + field + " = ? WHERE author = ? AND title = ?");
//            ps.setString(1, newValue);
//            ps.setString(2, author);
//            ps.setString(3, title);
//            ps.execute();
//            closeDB();
//        } catch (Exception error) {
//            error.printStackTrace();
//        }
//    }


    /**
     * Article Comment operation.
     * insert article comment into ArticleComments
     * and according to title, it can be associated with Article.
     * ArticleComment can't be updated.
     * @param comment
     */
    public static void insertArticleComment(ArticleComment comment) {
        try {
            openDB();
            PreparedStatement ps = blogConnection.prepareStatement("INSERT INTO ArticleComments VALUES (?, ?, ?, ?)");
            ps.setInt(1, comment.getId());
            ps.setString(2, comment.getAuthor());
            ps.setDate(3, comment.getDate());
            ps.setString(4, comment.getContent());
            ps.execute();
            closeDB();
        } catch (Exception error) {
            error.printStackTrace();
        }
    }

    /**
     * Query ArticleComment's list with its id.
     * @param id the primary key.
     * @return  the comment list.
     */
    public static ArrayList<ArticleComment> queryArticleComments(int id) {
        try {
            openDB();
            PreparedStatement ps = blogConnection.prepareStatement("SELECT * FROM ArticleComments WHERE id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            ArrayList<ArticleComment> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new ArticleComment(rs.getInt("id"), rs.getString("author"), rs.getDate("date"), rs.getString("content")));
            }
            return list;
        } catch (Exception error) {
            error.printStackTrace();
        }
        return null;
    }
    /**
     * delete ArticleComment by specific title.
     */
//    public void deleteArticleComment(ArticleComment comment) {
//        try {
//            openDB();
//            PreparedStatement ps = blogConnection.prepareStatement("DELETE FROM ArticleComments WHERE title = ? AND author = ? AND content = ?");
//            ps.setString(1, comment.getTitle());
//            ps.setString(2, comment.getAuthor());
//            ps.setString(3, comment.getContent());
//            ps.execute();
//            closeDB();
//        } catch (Exception error) {
//            error.printStackTrace();
//        }
//    }


    /**
     * read data from Discussions.
     * @return Discussion list.
     */
//    public ArrayList<Discussion> readDiscussion() {
//        try {
//            openDB();
//            ResultSet rs = blogConnection.prepareStatement("SELECT * FROM Discussions").executeQuery();
//            ArrayList<Discussion> discussion = new ArrayList<>();
//            while (rs.next()) {
//                Discussion t_discussion = new Discussion(rs.getString("author"), rs.getDate("date"), rs.getString("topic"), rs.getString("content"));
//                PreparedStatement ps = blogConnection.prepareStatement("SELECT * FROM DiscussionComments WHERE topic = ?");
//                ps.setString(1, t_discussion.getTopic());
//                ResultSet t_com = ps.executeQuery();
//                while (t_com.next()) {
//                    t_discussion.insertComment(new DiscussionComment(t_com.getString("topic"), t_com.getString("author"), t_com.getDate("date"), t_com.getString("content")));
//                }
//                t_com.close();
//                ps.close();
//                discussion.add(t_discussion);
//            }
//            rs.close();
//            closeDB();
//            return discussion;
//        } catch (Exception error) {
//            error.printStackTrace();
//            return null;
//        }
//    }
//
//    /**
//     * insert Discussion into Discussions.
//     * @param discussion which will be inserted.
//     */
//    public void insertDiscussion(Discussion discussion) {
//        try {
//            openDB();
//            PreparedStatement ps = blogConnection.prepareStatement("INSERT INTO Discussions VALUES (?, ?, ?, ?)");
//            ps.setString(1, discussion.getAuthor());
//            ps.setDate(2, discussion.getDate());
//            ps.setString(3, discussion.getTopic());
//            ps.setString(4, discussion.getContent());
//            ps.execute();
//            ps.close();
//            closeDB();
//        } catch (Exception error) {
//            error.printStackTrace();
//        }
//    }
//
//    /**
//     * delete Discussion and delete its comment together.
//     * @param discussion which will be deleted.
//     */
//    public void deleteDiscussion(Discussion discussion) {
//        try {
//            openDB();
//            PreparedStatement ps = blogConnection.prepareStatement("DELETE FROM Discussions WHERE topic = ? AND author = ?");
//            ps.setString(1, discussion.getTopic());
//            ps.setString(2, discussion.getAuthor());
//            ps.execute();
//            for (DiscussionComment comment : discussion.getM_comment()) {
//                deleteDiscussionComment(comment);
//            }
//            ps.close();
//            closeDB();
//        } catch (Exception error) {
//            error.printStackTrace();
//        }
//    }
//
//    /**
//     * update Discussion by its author and specific topic.
//     * @param author the author
//     * @param topic the topic
//     * @param field the field
//     * @param newValue the new value
//     */
//    public void updateDiscussion(String author, String topic, String field, String newValue) {
//        try {
//            openDB();
//            PreparedStatement ps = blogConnection.prepareStatement("UPDATE Discussions SET " + field + " = ? WHERE author = ? AND topic = ?");
//            ps.setString(1, newValue);
//            ps.setString(2, author);
//            ps.setString(3, topic);
//            ps.execute();
//            ps.close();
//            closeDB();
//        } catch (Exception error) {
//            error.printStackTrace();
//        }
//    }
//
//    /**
//     * insert DiscussionComment into database.
//     * @param comment which will be inserted.
//     */
//    public void insertDiscussionComment(DiscussionComment comment) {
//        try {
//            openDB();
//            PreparedStatement ps = blogConnection.prepareStatement("INSERT INTO DiscussionComments VALUES (?, ?, ? , ?)");
//            ps.setString(1, comment.getAuthor());
//            ps.setDate(2, comment.getDate());
//            ps.setString(3, comment.getTopic());
//            ps.setString(4, comment.getContent());
//            ps.execute();
//            ps.close();
//            closeDB();
//        } catch (Exception error) {
//            error.printStackTrace();
//        }
//    }
//
//    /**
//     * delete DiscussionComment by its topic.
//     * @param
//     */
//    public void deleteDiscussionComment(DiscussionComment comment) {
//        try {
//            openDB();
//            PreparedStatement ps = blogConnection.prepareStatement("DELETE FROM DiscussionComments WHERE topic = ? AND author = ? AND content = ?");
//            ps.setString(1, comment.getTopic());
//            ps.setString(2, comment.getAuthor());
//            ps.setString(3, comment.getContent());
//            ps.execute();
//            ps.close();
//            closeDB();
//        } catch (Exception error) {
//            error.printStackTrace();
//        }
//    }
        public static void insertFeedback(Feedback feedback) {
            try {
                openDB();
                PreparedStatement sql = blogConnection.prepareStatement("INSERT INTO Feedbacks(author, date, content) VALUES (?, ?, ?)");
                sql.setString(1, feedback.getAuthor());
                sql.setDate(2, feedback.getDate());
                sql.setString(3, feedback.getContent());
                sql.execute();
                closeDB();
            } catch (Exception error) {
                error.printStackTrace();
            }
        }
        public static void deleteFeedback(int id) {
            try {
                openDB();
                PreparedStatement sql = blogConnection.prepareStatement("DELETE FROM Feedbacks WHERE id = ?");
                sql.setInt(1, id);
                sql.execute();
                closeDB();
            } catch (Exception error) {
                error.printStackTrace();
            }
        }
    public static ArrayList<Feedback> listFeedback() {
        try {
            openDB();
            PreparedStatement sql = blogConnection.prepareStatement("SELECT * FROM Feedbacks");
            ResultSet rs = sql.executeQuery();
            ArrayList<Feedback> ans = new ArrayList<>();
            while (rs.next()) {
                ans.add(new Feedback(rs.getInt("id"), rs.getString("author"), rs.getDate("date"), rs.getString("content")));
            }
            closeDB();
            return ans;
        } catch (Exception error) {
            error.printStackTrace();
        }
        return null;
    }
    public static void main(String[] args) {
        DBUtil.deleteFeedback(1);
    }
}
