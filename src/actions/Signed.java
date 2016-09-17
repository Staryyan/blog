package actions;

import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.Cookie;

/**
 * Created by yanzexin on 16/9/14.
 * All right reserved.
 */
public class Signed {
    private String result = "";
    private String none = "";

    public Signed() {
    }

    public Signed(String result, String none) {

        this.result = result;
        this.none = none;
    }

    public String getResult() {

        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getNone() {
        return none;
    }

    public void setNone(String none) {
        this.none = none;
    }
    public String execute() {
        Cookie[] cookies = ServletActionContext.getRequest().getCookies();
        JSONObject jsonObject = new JSONObject();
        for (Cookie each : cookies) {
            if (each.getName().equals("userName") && each.getValue() != null && !each.getValue().equals("")) {
                jsonObject.put("signed", true);
                jsonObject.put("userName", each.getValue());
            } else {
                jsonObject.put("signed", false);
            }
        }
        result = jsonObject.toString();
        return "success";
    }
}
