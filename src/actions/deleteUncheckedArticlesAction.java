package actions;

import utils.dbUtil.DBUtil;

/**
 * Created by yanzexin on 16/9/24.
 * All right reserved.
 */
public class deleteUncheckedArticlesAction {
    private int id = 0;
    private String result = "";

    public deleteUncheckedArticlesAction() {
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
        DBUtil.deleteArticle(id, "UncheckedArticles");
        result = "";
        return "success";
    }
}
