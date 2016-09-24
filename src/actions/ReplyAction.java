package actions;

import beans.User;
import utils.dbUtil.DBUtil;

/**
 * Created by yanzexin on 16/9/24.
 * All right reserved.
 */
public class ReplyAction {
    private String receiver = "";
    private String content = "";
    private String result = "";
    private int id = 0;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ReplyAction() {
    }

    public ReplyAction(String receiver, String content, String result) {

        this.receiver = receiver;
        this.content = content;
        this.result = result;
    }

    public String getReceiver() {

        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String execute() {
        User t_user = DBUtil.queryUser(receiver);
        try {
//            Mail.send(t_user.getEmail(), content);
            DBUtil.deleteFeedback(id);
        } catch (Exception error) {
            error.printStackTrace();
        }
        result = "";
        return "success";
    }
}
