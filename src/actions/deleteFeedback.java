package actions;

import net.sf.json.JSONObject;
import utils.dbUtil.DBUtil;

/**
 * Created by yanzexin on 16/9/24.
 * All right reserved.
 */
public class deleteFeedback {
    private int id = 0;
    private String result = "";

    public deleteFeedback() {
    }

    public deleteFeedback(int id, String result) {

        this.id = id;
        this.result = result;
    }

    public int getId() {

        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String execute() {
        DBUtil.deleteFeedback(id);
        JSONObject jsonObject = new JSONObject();
        result = jsonObject.toString();
        return "success";
    }
}
