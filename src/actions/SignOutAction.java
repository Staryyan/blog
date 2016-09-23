package actions;

import org.apache.struts2.ServletActionContext;

import javax.servlet.http.Cookie;

/**
 * Created by yanzexin on 16/9/17.
 * All right reserved.
 */
public class SignOutAction {
    private String none = "";
    private String result = "";

    public SignOutAction() {
    }

    public SignOutAction(String none, String result) {

        this.none = none;
        this.result = result;
    }

    public String getNone() {

        return none;
    }

    public void setNone(String none) {
        this.none = none;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }
    public String execute() {
        ServletActionContext.getResponse().addCookie(new Cookie("userName", ""));
        result = "";
        return "success";
    }
}
